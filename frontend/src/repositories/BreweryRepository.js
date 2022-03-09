import Client from '@/clients/axiosClient';

const resource = '/breweries';

export default {
  get() {
    return Client.get(`${resource}`);
  },
};
