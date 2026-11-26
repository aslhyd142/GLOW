/**
 * Verificar token utiliza la funcion:
 * middleware de express. es una fuction
 * que se ejecuta ANTES de llegar
 * a las ruta protegida por ejemplo un get
 * su trabajo es revisar que la peticion
 * traiga un tpken JWT
 * valido si no lo trae corta la peticion
 * con error 401
 */

//libreria para crear y verificar TOKENS JWT
const jwt = require('jsonwebtoken');
require('dotenv').config();

//req la peticion entrante; res: la
//respuesta; next funcion que
//continua la cadena de middleware/
//controlador si todo esta bien

function verificarToken(req, res, next) {
  //el frontend debe enviar el token en header
  //Authorization: Bearer <token>
  const authHeader = req.headers['authorization'];
  // si no viene el header no hay sesion -> rechazamos la peticion
  if (!authHeader) {
      return res.status(401).json({ message: 'No se envio un token de autenticacion' });
  }

  //authHeader tiene ele formato "Bearer eyJhbGciOi" ,nos quedamos 
  //solo con la segunda parte que es el token real
  const token = authHeader.split(' ')[1];
  //si el header vino mal formado por ejemplo son la palabra Bearer
  //el token queda undefined y tampoco dejamos pasar la peticion
  if (!token) {
    return res.status(401).json({mensaje: 'formato de token invalido '});
  }

  //Todo lo que pueda fallar (toke invalido expirado alterado) se 
  //maneja dentro de este try/catch
  try{
    //jwt.verify valida la firma del tokrn con el mismo secreto que se uso para crearlo (JWT_SECRET)
    //y revisa que haya expirado
    const datosUsuario = jwt.verify(token, process.env.JWT_SECRET);
    //guardamos los datos decodificados del usuario en req.usuario
    //para que la siguiente funcion (el controlador) pueda usarlos
    req.usuario = datosUsuario;
    //next() le dice al express todo esta bien continua con la siguiente funcion
    next();
  } catch (error) {
    //si el token esta vencido o fue alterado, jwt.verify lanza un error
    return res.status(401).json({ mensaje: 'token invalido o expirado' });
  }
}

//exportamos
module.exports = verificarToken;