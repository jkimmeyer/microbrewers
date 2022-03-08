import Client from '@/clients/axiosClient';

const resource = '/flavors';

export default {
  get() {
    return Client.get(`${resource}`);
  },
};
