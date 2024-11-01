// src/modules/auth.ts
import { reactive, toRefs } from 'vue';
import Repository from '@/repositories/index';

const UserRepository = Repository.get('user');

const state = reactive({
  user: undefined,
  loggedIn: false,
  authenticating: false,
});

const ACCESS_TOKEN = 'ACCESS_TOKEN';
const CLIENT = 'CLIENT';
const UID = 'UID';

const removeTokenFromLocalStorage = () => {
  window.localStorage.removeItem(ACCESS_TOKEN);
  window.localStorage.removeItem(CLIENT);
  window.localStorage.removeItem(UID);
};

export const useAuth = () => {
  const setUser = (payload) => {
    state.user = payload.data;
    state.loggedIn = true;
    state.authenticating = false;
  };

  const logout = () => {
    removeTokenFromLocalStorage();

    state.user = undefined;
    state.loggedIn = false;
  };

  const validateToken = () => {
    const token = window.localStorage.getItem(ACCESS_TOKEN);

    if (token) {
      state.authenticating = true;

      return UserRepository.validateToken()
        .then((response) => {
          state.user = response.data.data;
          state.loggedIn = true;
        })
        .catch(() => {
          // TODO: Sent exception to sentry
          removeTokenFromLocalStorage();
        })
        .finally(() => {
          state.authenticating = false;
        });
    }
    return Promise.resolve();
  };

  return {
    validateToken,
    setUser,
    logout,
    ...toRefs(state),
  };
};
