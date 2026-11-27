/**
 * Aqui vive la logica de negocio del login recibir email
 * y contraseña, buscar el usuario en mysql, comparar la contraseña
 * encriptada y devolver un token JWT si todo es correcto
 * las rutas (auth.routes.js)solo dicen cuando llegue tal data
 * peticion, llama a esta funcion la logica en si va aca (CRUD)
 */

// Libreria para encriptar y comparar la contraseña
const bcrypt = require('bcryptjs');
//Libreria para crear (firmar) tokens JWT se sesion
const jwt = require('jsonwebtoken');
//pool para conexiones mysql condigurado en config/db.js
const pool = require('../config/db');
//Carga las variables de .env (JWT_SECRET, JWT_EXPIRES_IN )
require('dotenv').config();

// post /api/auth/login
//Recibe {email, password} y devuelve {token, usuario}si son correctos
async function login(req, res) {
  try {
    //Extraemos el email y password de cuerpo (body) de la peticion,
    // que express.json() ya convirtio de JSON a objeto de javascript
    const { email, password }= req.body;

    // 1 validacion basica que no llegue al formulario vacio
    if (!email || !password) {
      return res.status(400).json({mensaje: 'El correo y la contraseña son obligatorias'});
    }

    // 2 Buscar el administrador creado por el seed.
    let usuario = null;
    try {
      const [filas] = await pool.query(
        'SELECT id, nombre, email, password, rol, estado FROM usuarios WHERE email = ? LIMIT 1',
        [email]
      );
      usuario = filas[0] || null;
    } catch (error) {
      if (error.code !== 'ER_NO_SUCH_TABLE') throw error;
    }

    if (usuario) {
      if (usuario.estado === 0) {
        return res.status(403).json({
          mensaje: 'Este usuario esta desactivado. contacte al administrador '
        });
      }

      const passwordCorrecta = await bcrypt.compare(password, usuario.password);
      if (!passwordCorrecta) {
        return res.status(401).json({
          mensaje: 'Correo o contraseña incorrectos'
        });
      }

      const token = jwt.sign(
        { id: usuario.id, email: usuario.email, rol: usuario.rol },
        process.env.JWT_SECRET,
        { expiresIn: process.env.JWT_EXPIRES_IN || '8h'}
      );

      return res.json({
        token,
        usuario:{
          nombre: usuario.nombre,
          email: usuario.email,
          rol: usuario.rol,
        },
      });
    }

    // 3 Buscar también cuentas creadas con Glow_seguridad.sql.
    // Se permite usar usuario_login o correo.
    const [cuentas] = await pool.query(
      `SELECT id_cuenta, usuario_login, correo, rol, activo
       FROM Cuenta_Acceso
       WHERE usuario_login = ? OR correo = ?
       LIMIT 1`,
      [email, email]
    );

    if (cuentas.length === 0) {
      return res.status(401).json({mensaje: 'Correo o contraseña incorrectos'});
    }

    const cuenta = cuentas[0];
    if (!cuenta.activo) {
      return res.status(403).json({
        mensaje: 'Este usuario esta desactivado. contacte al administrador '
      });
    }

    const conexion = await pool.getConnection();
    let mensajeLogin;

    try {
      await conexion.query('CALL sp_login_glow(?, ?, @res_login)', [cuenta.usuario_login, password]);
      const [resultado] = await conexion.query('SELECT @res_login AS resultado');
      mensajeLogin = resultado[0]?.resultado;
    } finally {
      conexion.release();
    }

    if (mensajeLogin !== 'Acceso concedido') {
      const estado = mensajeLogin === 'Cuenta bloqueada. Contacte al administrador' ? 403 : 401;
      return res.status(estado).json({mensaje: mensajeLogin});
    }

    const token = jwt.sign(
      { id: cuenta.id_cuenta, email: cuenta.correo, rol: cuenta.rol },
      process.env.JWT_SECRET,
      { expiresIn: process.env.JWT_EXPIRES_IN || '8h'}
    );

    return res.json({
      token,
      usuario: {
        nombre: cuenta.usuario_login,
        email: cuenta.correo,
        rol: cuenta.rol,
      },
    });

  } catch (error){
    // cualquier error inesperado (por ejemplo el mysql este apagado)
    // cae aqui en vez de tumbar el servidor
    console.error('error en login:',error);
    return res.status(500).json({mensaje:'error del servidor al iniciar sesion'});
  }
}

// GET /api/auth/perfil
// Ruta protegida de ejemplo solo responde a personas si el middleware
// verificartoken confirmo que el token es valido
async function perfil(req,res){
  // Req.usuario fue puesto por el middleware verificar token
  return res.json({usuario: req.usuario})
}

//Exportamos ambas funciones para
//authroutes.js pueda conectarlas
//con las urls correspondientes
module.exports = { login, perfil };


