/**
 * Punto de entrada del backend, aquí se
 * crea la aplicación de Express, se
 * configuran los middleware globales
 * (cors, json)
 * y se montan las rutas. Al final el
 * servidor queda escuchando
 * peticiones por el puerto definido en el
 * .env (por defecto el 4000)
 */

//Framework para crear en servidor HTTP y definir rutas
const express = require('express');
//middleware que habilita CORS (peticiones desde otros dominios)
const cors = require('cors');
//lee el archivo .env y carga subvalores en process.env
require('dotenv').config();
//importamos el router con los enhpoint de autenticacion (login y perfil)
const authRoutes = require('./routes/auth.routes');
//creamos la aplicacion de express 
const app = express();
//corst()permite que el frontend (que corre en otro puerto)
//pueda hacer peticiones a este backend sin que el navegador lo bloquee
app.use(cors());
//express.json() le enseña a express a leer el body de las peticiones
//cuando viene en formato json asi mismo podemos leer req.body.email, etc
app.use(express.json());
//ruta de salud simple, util para probar que el srvidor esta vivo
app.get('/',(req,rest)=>{
    rest.json({message:'Api de inventario react funcionando correctamente'});
});
//todas las rutas que empiecen con api/auth se resuelven en authroutes.js
app.use('/api/auth',authRoutes);
// Middleware para rutas que no existen (404)
app.use((req, res) => {
  res.status(404).json({ mensaje: 'ruta no encontrada' });
});
// Tomamosn el puerto desde .env o 4000 si
// no esta definido
const PORT = process.env.PORT || 4000;
// Arranca el servidor a partir de aqui
// Express queda escuchando
// peticiones HTTP en el puerto indicado
// hasta que se detenga el proceso
app.listen(PORT, () => {
  // Este callback se ejecuta una vez cuando el servidor este listo
  console.log(`Servidor backend escuchando en http://localhost:${PORT}`);
});



