import Client from '../clients/axiosClient';

const resource = '/craft_beers';

export default {
  get() {
    return Client.get(`${resource}`);
  },
  getCraftBeer(id) {
    return Client.get(`${resource}/${id}`);
  },
  create(payload) {
    return Client.post(`${resource}`, payload);
  },
  update(payload, id) {
    return Client.put(`${resource}/${id}`, payload);
  },
  delete(id) {
    return Client.delete(`${resource}/${id}`);
  },
};
