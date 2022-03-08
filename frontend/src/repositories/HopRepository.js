import Client from '@/clients/axiosClient';

const resource = '/hops';

export default {
  get() {
    return Client.get(`${resource}`);
  },
};
