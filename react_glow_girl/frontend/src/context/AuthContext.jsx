import { createContext, useContext, useMemo, useState } from 'react';
import axios from 'axios';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [usuario, setUsuario] = useState(() => {
    const guardado = localStorage.getItem('usuario');
    return guardado ? JSON.parse(guardado) : null;
  });

  async function login(email, password) {
    const respuesta = await axios.post('http://localhost:4000/api/auth/login', {
      email,
      password,
    });

    localStorage.setItem('token', respuesta.data.token);
    localStorage.setItem('usuario', JSON.stringify(respuesta.data.usuario));
    setUsuario(respuesta.data.usuario);
  }

  const value = useMemo(() => ({ usuario, login }), [usuario]);

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const contexto = useContext(AuthContext);
  if (!contexto) {
    throw new Error('useAuth debe usarse dentro de AuthProvider');
  }
  return contexto;
}
