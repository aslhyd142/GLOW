#PROJECT IN  REACT INVENTORY SYSTEM
elaborado con react+ Boostrap y mysql

el sistema de inventario contara con inicio de sesion con base de datos en mysql con
contraseña encriptado y JWT

l dashboar contara con gestion CRUD de **usuarios, categorias, subcategorias, productos** Usando datos simulados en Javascript

# Stack Usado
Frontend = react 19 + vite + Bootstrap 5 + react router
Backend  (solo para login) = node.js + express + jwt
Base de datos MySQL (XAMPP) + glow_girl
Encriptarcion de contraseña = bcrypt (bcrpsjs)
Gestiones = Usuarios, categorias, subcategorias, produsctos/datos simulados en JS (useStage + localStorege)
Automatizacion npm scripts + concurrently

Pre Requistos
    "react-router-dom": "^7.18.7"
instalar node.js verificar desde cmd con node -v
#2
Tener xamp instalado con mysql en puerto 3306
#3 
Tener un editor de codigo 

**componente**
La pantalla se divide en piezas pequeñas y reutilizables 
(un boton,una tabla ,un formulario, un menu) cada componente es 
una funcion de javascript que devuelve lo que tiene que mostrar

**JSX** una sintaxis que permite escribir algo parecido a html dentro de javascript por eso los archivos terminan con extension .jxs ejemplo:

````jsx````
functio`n Saludo () {
    return <h1 classname="text-primary"> Hola, react </h1>
}

Estado (stage)** cada componente puede guardar datos que cambian por ejemplo, lo que el usuario  escribe en un input, cuando el estado cambia react vuelvue a dibujar automaticamente 
solo lo necesario sin cambiar la pagina

**SPA** la aplicacion se carga una sola vez en el navegador y luego cambia de pagina sin recargar para esto usamos  react-router-dom

React solo se encarga de la interfaz grafica para el resto utilizamos 


**viteW**

para crear y correr el proyecto

**Bootstrab**

para los estilos

**axios**

para hablar entre el frontend y el backend

**react-router-don**

para las rutas
# paso para crear el proyecto
- 1 verifique que tengas node, js(node -v)cmd
- 2 Desde la raíz del proyecto crea el proyecto con react y vite
npm create vite@latest frontend -- --template react
- 3 Entre a la carpeta frontend con `cd frontend` y instale en el `npm install`
- 4 Instale las librerias ; `npm install bootstrap bootstrap-icons react-router-dom axios`
•5 empaquetador junta y optimisa todo el css en unsolo archivo al hacer `npm run bild`
6 Install the backend and frontend dependencies at the same time from the root of the project: `npm run install:all`
7 ingresar la carpeta backend `npm init -y`
8 instalar dependencias 
8.1`npm install express mysql


2 bcryptjs jsonwebtoken cors dotenv`
8.2 crea .env dentro de backend  para las variables de entorno
8.3 crea src/config/db.js

8.4 crea src/middlewares/verificartoken.js valida el token JWT en rutas protegidas
8.5 crea src/controllers/auth.controllers.js es la logica del inicio de sesion 
8.6 crea src/routes/auth.routes.js conecta las rutas con el controlador 
8.7 crea src/server.js arma la app express 
8.8 crea en backend seed.js crea usuario administrador
9 crear las siguientes carpetas en frontend
9.1 src/api/axiosclient.js
9.2 src/api/authservice.js
9.3 src/context/authcontext.jsx
9.4 src/page/Loginpage.jsx

10 construir el esqueleto visual del panel admin (sidebar + barra superior )
y proteger las rutas del dashboar y solo se puedan ver si hay sesion activa
10.1 archivos a crear
frontend/src/routes/ProtectedRoutes.jsx
frontend/src/layoust/DashboardLayout.jsx
frontend/src/components/common/Sidebar.jsx
frontend/src/components/common/Topbar.jsx
frontend/src/pages/DashboardHome.jsx
frontend/src/NotFoundPage.jsx
editar frontend/src/App.jsx

11 crear la pantalla de gestion de usuarios con CRUD A/D se usan datos simulados en javascript
11.1 se crean estos archivos 
frontend/src/data/mockUsuarios.jsx
frontend/src/hooks/useCrudSimulado.jsx
frontend/src/components/common/EstadoBadge.jsx
frontend/src/components/common/ConfirmModal.jsx
frontend/src/components/UsuarioFormModal.jsx
frontend/src/pages/UsuariosPage.jsx