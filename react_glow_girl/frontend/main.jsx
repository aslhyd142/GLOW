import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { BrowserRouter, Navigate, Route, Routes } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap-icons/font/bootstrap-icons.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';

import LoginPage from './src/Pages/LoginPage.jsx';
import DashboardAdmin from './src/Pages/DashboardAdmin.jsx';
import { AuthProvider, useAuth } from './src/context/AuthContext.jsx';

function DashboardRoute() {
  const { usuario, logout } = useAuth();

  if (!usuario) {
    return <Navigate to="/login" replace />;
  }

  if (!['admin', 'administrador'].includes(String(usuario.rol).toLowerCase())) {
    return <Navigate to="/login" replace />;
  }

  return (
    <>
      <nav className="navbar bg-white border-bottom">
        <div className="container d-flex justify-content-between">
          <span className="navbar-brand fw-semibold">Glow Girl · Administración</span>
          <button type="button" className="btn btn-outline-secondary btn-sm" onClick={logout}>
            Cerrar sesión
          </button>
        </div>
      </nav>
      <main className="container py-5">
        <DashboardAdmin />
      </main>
    </>
  );
}

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <BrowserRouter>
      <AuthProvider>
        <Routes>
          <Route path="/" element={<Navigate to="/login" replace />} />
          <Route path="/login" element={<LoginPage />} />
          <Route path="/dashboard" element={<DashboardRoute />} />
          <Route path="*" element={<Navigate to="/login" replace />} />
        </Routes>
      </AuthProvider>
    </BrowserRouter>
  </StrictMode>,
);
