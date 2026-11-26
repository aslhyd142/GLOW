// Configura y exporta un pool de conexiones hacia mysql
//Un pool es un grupo de conexiones que se reutlizan en cada
//consulta en lugar de abrir y cerrar una conexión nueva cada vez
//eso hace que la apliccion responda mas rapido

//Mysql2/promise nos permite usar async/await en las consultas
//en lugar de trabajar callbacks

const mysqly = require('mysql2/promise');

// Cargamos las variables definidas en el archivo .env
// (DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)
require('dotenv').config();

//createPool crea un conjunto de conexiones reutilizables
const pool = mysqly.createPool({
host: process.env.DB_HOST,//servidor de mysql
port: process.env.DB_PORT,//puerto de mysql
user: process.env.DB_USER,//usuario de mysql
password: process.env.DB_PASSWORD,//contraseña de mysql
database: process.env.DB_NAME,//Nombre de la base de datos
waitForConnections: true,//si no hay conexiones libres
connectionLimit: 10, //maximo de conexiones simultaneas
queueLimit: 0, //sin limite de conexiones en espera
});

// Exportamos el pool para poder hacer pool.query desde
//cualquier controlador
module.exports = pool;