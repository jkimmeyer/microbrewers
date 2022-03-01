import Client from '@/clients/axiosClient';
import { removeEmpty } from '@/lib/apiHelper';

const resource = '/craft_beers';
const headers = {
  headers: {
    'Content-Type': 'multipart/form-data',
  },
};

export default {
  get() {
    return Client.get(`${resource}`);
  },
  getCraftBeer(id) {
    return Client.get(`${resource}/${id}`);
  },
  create(payload) {
    const formData = new FormData();
    const craftBeer = removeEmpty(payload);

    Object.keys(craftBeer).forEach((key) => {
      formData.append(`craft_beer[${key}]`, craftBeer[key]);
    });

    return Client.post(`${resource}`, formData, headers);
  },
  update(payload, id) {
    return Client.put(`${resource}/${id}`, payload);
  },
  delete(id) {
    return Client.delete(`${resource}/${id}`);
  },
};
