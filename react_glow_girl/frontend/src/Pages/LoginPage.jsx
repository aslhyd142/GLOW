import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext.jsx';
import logoGlowGirl from '../assets/175300.jpg';

const TIPOS_CUENTA = [
  { id: 'cliente', label: 'Cliente', icon: 'bi-person' },
  { id: 'propietario', label: 'Propietario de Salón', icon: 'bi-shop' },
  { id: 'admin', label: 'Administrador General', icon: 'bi-shield-check' },
];

function LoginPage() {
  const { login } = useAuth();
  const navigate = useNavigate();

  // Dejamos Administrador General por defecto mientras el backend valida la sesión principal
  const [tipoCuenta, setTipoCuenta] = useState('admin');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [verPassword, setVerPassword] = useState(false);
  const [error, setError] = useState('');
  const [enviando, setEnviando] = useState(false);

  const cuentaSeleccionada = TIPOS_CUENTA.find((item) => item.id === tipoCuenta);

  async function manejarEnvio(evento) {
    evento.preventDefault();
    setError('');

    if (tipoCuenta !== 'admin') {
      setError(
        `El ingreso directo como "${cuentaSeleccionada?.label}" aún no está conectado al backend. Selecciona "Administrador General" para iniciar sesión.`
      );
      return;
    }

    setEnviando(true);
    try {
      await login(email, password);
      navigate('/dashboard', { replace: true });
    } catch (err) {
      const mensajeBackend = err?.response?.data?.mensaje;
      setError(
        mensajeBackend ||
          'No se pudo conectar con el servidor. Verifica que el backend esté corriendo.'
      );
    } finally {
      setEnviando(false);
    }
  }

  return (
    <div
      className="min-vh-100 d-flex justify-content-center align-items-center p-3"
      style={{
        background: 'linear-gradient(135deg, #fff5f9 0%, #fce7f3 55%, #fdf2f8 100%)',
      }}
    >
      <div
        className="card border-0 shadow-lg"
        style={{
          width: '100%',
          maxWidth: '450px',
          borderRadius: '26px',
          backgroundColor: '#fffafd',
        }}
      >
        <div className="card-body p-4 p-md-5">
          <div className="text-center mb-4">
            <img
              src={logoGlowGirl}
              alt="Glow Girl"
              className="d-block mx-auto mb-2"
              style={{
                width: '280px',
                maxWidth: '100%',
                height: '120px',
                objectFit: 'cover',
                objectPosition: 'center',
              }}
            />
            <h1 className="h4 fw-bold mt-2 mb-1" style={{ fontFamily: 'Georgia, serif' }}>
              Bienvenida de vuelta
            </h1>
            <p className="text-muted small mb-0">Inicia sesión en Glow Girl</p>
          </div>

          <div className="mb-3">
            <label
              className="form-label fw-bold text-uppercase mb-2"
              style={{ fontSize: '0.72rem', letterSpacing: '1px', color: '#9d174d' }}
            >
              Tipo de cuenta
            </label>
            <div className="row g-2">
              {TIPOS_CUENTA.map((rol) => {
                const activo = tipoCuenta === rol.id;
                return (
                  <div className="col-4" key={rol.id}>
                    <button
                      type="button"
                      onClick={() => {
                        setTipoCuenta(rol.id);
                        setError('');
                      }}
                      className="w-100 h-100 py-2 px-1 d-flex flex-column align-items-center justify-content-center text-center"
                      style={{
                        borderRadius: '14px',
                        border: activo ? '2px solid #db2777' : '1px solid #f5b8d8',
                        backgroundColor: activo ? '#fdf2f8' : '#ffffff',
                        color: activo ? '#be185d' : '#6b7280',
                      }}
                    >
                      <i className={`bi ${rol.icon} fs-5 mb-1`}></i>
                      <span className="fw-semibold" style={{ fontSize: '0.75rem', lineHeight: 1.2 }}>
                        {rol.label}
                      </span>
                    </button>
                  </div>
                );
              })}
            </div>
          </div>

          {error && (
            <div className="alert alert-danger py-2 small rounded-3" role="alert">
              {error}
            </div>
          )}

          <form onSubmit={manejarEnvio}>
            <div className="mb-3">
              <label className="form-label small fw-semibold">Correo electrónico *</label>
              <input
                type="email"
                className="form-control py-2"
                style={{ borderRadius: '12px', borderColor: '#f5b8d8' }}
                placeholder="correo@ejemplo.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
                autoFocus
              />
            </div>

            <div className="mb-4">
              <label className="form-label small fw-semibold">Contraseña *</label>
              <div className="input-group">
                <input
                  type={verPassword ? 'text' : 'password'}
                  className="form-control py-2 border-end-0"
                  style={{
                    borderTopLeftRadius: '12px',
                    borderBottomLeftRadius: '12px',
                    borderColor: '#f5b8d8',
                  }}
                  placeholder="••••••••"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
                <button
                  type="button"
                  className="btn bg-white border border-start-0 text-muted"
                  style={{
                    borderTopRightRadius: '12px',
                    borderBottomRightRadius: '12px',
                    borderColor: '#f5b8d8',
                  }}
                  onClick={() => setVerPassword((prev) => !prev)}
                  tabIndex={-1}
                >
                  <i className={`bi ${verPassword ? 'bi-eye-slash' : 'bi-eye'}`}></i>
                </button>
              </div>
            </div>

            <button
              type="submit"
              className="btn w-100 text-white fw-semibold py-2"
              disabled={enviando}
              style={{
                borderRadius: '14px',
                background: 'linear-gradient(90deg, #ec4899 0%, #db2777 100%)',
                border: 'none',
              }}
            >
              {enviando
                ? 'Ingresando...'
                : `Ingresar como ${cuentaSeleccionada?.label}`}
            </button>
          </form>

          <div className="text-center mt-3">
            <span className="text-muted small">¿Olvidaste tu contraseña?</span>
          </div>

          <hr className="my-3 opacity-25" />

          <div className="text-center small text-muted">
            ¿No tienes cuenta?{' '}
            <span className="fw-bold" style={{ color: '#db2777' }}>
              Regístrate gratis
            </span>
          </div>
        </div>
      </div>
    </div>
  );
}

export default LoginPage;