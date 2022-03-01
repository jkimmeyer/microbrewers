import Client from '@/clients/axiosClient';

const resource = '/auth';

export default {
  login(user) {
    return Client.post(`${resource}/sign_in`, user);
  },
  register(user) {
    return Client.post(`${resource}`, user);
  },
  validateToken() {
    return Client.get(`${resource}/validate_token`);
  },
};
