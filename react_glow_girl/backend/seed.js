const bcrypt = require('bcryptjs');
const pool = require('./src/config/db');
require('dotenv').config();

async function registrarAdmins() {
  const admins = [
    {
      nombre: 'Aslhy Diaz',
      email: 'aslhydiaz@correo.com',
      passwordPlano: 'Glow2026',
      rol: 'admin',
      estado: 1,
    },
    {
      nombre: 'Julieth Quevedo',
      email: 'juliethquevedo@correo.com',
      passwordPlano: 'Glow2026',
      rol: 'admin',
      estado: 1,
    },
  ];

  try {
    for (const admin of admins) {
      const hash = await bcrypt.hash(admin.passwordPlano, 10);
      const [existentes] = await pool.query(
        'SELECT id FROM usuarios WHERE email = ?',
        [admin.email]
      );

      if (existentes.length > 0) {
        await pool.query(
          'UPDATE usuarios SET nombre = ?, password = ?, rol = ?, estado = ? WHERE email = ?',
          [admin.nombre, hash, admin.rol, admin.estado, admin.email]
        );
        console.log(`Actualizado: ${admin.email}`);
      } else {
        await pool.query(
          'INSERT INTO usuarios (nombre, email, password, rol, estado) VALUES (?, ?, ?, ?, ?)',
          [admin.nombre, admin.email, hash, admin.rol, admin.estado]
        );
        console.log(`Creado: ${admin.email}`);
      }
    }
    process.exit(0);
  } catch (error) {
    console.error('Error registrando admins en usuarios:', error);
    process.exit(1);
  }
}

registrarAdmins();