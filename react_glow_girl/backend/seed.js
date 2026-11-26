// ============================================================
// seed.js
// Pertenece a: Clase 02 - Base de datos y backend
// ------------------------------------------------------------
// Script que se ejecuta UNA SOLA VEZ (o cada vez que quieras
// reiniciar) para crear un usuario administrador de prueba
// directamente desde JavaScript, encriptando su contraseña con
// bcrypt antes de guardarla en MySQL.
//
// Se ejecuta con:  npm run seed   (desde la carpeta backend)
// ============================================================

// Libreria para encriptar la contraseña antes de guardarla
const bcrypt = require('bcryptjs');
// Pool de conexiones a MySQL (mismo que usa el resto del backend)
const pool = require('./src/config/db');
// Carga las variables de .env (datos del usuario semilla)
require('dotenv').config();

// Funcion principal del script: crea el usuario administrador si no existe
async function crearUsuarioAdmin() {
  // Tomamos los datos del admin desde el .env para no dejarlos
  // "quemados" en el codigo.
  const nombre = process.env.SEED_ADMIN_NOMBRE || 'Administrador';
  const email = process.env.SEED_ADMIN_EMAIL || 'admin@inventario.com';
  const passwordPlano = process.env.SEED_ADMIN_PASSWORD || 'Admin123!';

  try {
    // Revisamos si ya existe un usuario con ese correo, para no
    // duplicarlo cada vez que se corra el script.
    const [existentes] = await pool.query('SELECT id FROM usuarios WHERE email = ?', [email]);

    // bcrypt.hash("texto", saltRounds) genera un hash irreversible.
    // saltRounds = 10 es un buen balance entre seguridad y velocidad.
    const passwordEncriptada = await bcrypt.hash(passwordPlano, 10);

    if (existentes.length > 0) {
      await pool.query(
        'UPDATE usuarios SET nombre = ?, password = ?, rol = ?, estado = 1 WHERE email = ?',
        [nombre, passwordEncriptada, 'admin', email]
      );
      console.log(`Usuario administrador actualizado: ${email}`);
      process.exit(0);
    }

    // Insertamos el usuario ya con la contraseña encriptada
    await pool.query(
      'INSERT INTO usuarios (nombre, email, password, rol, estado) VALUES (?, ?, ?, ?, ?)',
      [nombre, email, passwordEncriptada, 'admin', 1]
    );

    // Mostramos en consola las credenciales en texto plano SOLO para que
    // el estudiante las pueda copiar; en la base de datos ya quedaron encriptadas.
    console.log('Usuario administrador creado con exito:');
    console.log(`  Email:    ${email}`);
    console.log(`  Password: ${passwordPlano} (guardada encriptada en la base de datos)`);
    process.exit(0); // 0 = el script termino sin errores
  } catch (error) {
    // Si algo fallo (por ejemplo, MySQL apagado o tabla inexistente),
    // lo mostramos en consola y terminamos con codigo de error.
    console.error('Error creando el usuario administrador:', error);
    process.exit(1); // 1 = el script termino CON errores
  }
}

// Ejecutamos la funcion apenas se corre "node seed.js" / "npm run seed"
crearUsuarioAdmin();
