import { defineStore } from 'pinia';

export interface User { id: string; name: string; email: string; }

interface AuthState {
  token: string | null;
  user: User | null;
}

export const useAuthStore = defineStore('auth', {
  state: (): AuthState => ({ token: localStorage.getItem('token'), user: null }),
  getters: { isAuthenticated: (s) => Boolean(s.token) },
  actions: {
    login(token: string, user?: User) {
      this.token = token;
      this.user = user ?? null;
      localStorage.setItem('token', token);
    },
    logout() {
      this.token = null;
      this.user = null;
      localStorage.removeItem('token');
    },
  },
});
