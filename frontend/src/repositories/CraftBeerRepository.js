import Client from '@/clients/axiosClient';
import { removeEmpty } from '@/lib/apiHelper';

const resource = '/craft_beers';
const headers = {
  headers: {
    'Content-Type': 'multipart/form-data',
  },
};

const ARRAY_KEYS = ['flavors', 'hops'];

export default {
  get() {
    return Client.get(`${resource}`);
  },
  getCraftBeer(id) {
    return Client.get(`${resource}/${id}`);
  },
  getCraftBeerByUser(id) {
    return Client.get(`${resource}?user_id=${id}`);
  },
  create(payload) {
    const formData = new FormData();
    const craftBeer = removeEmpty(payload);

    Object.keys(craftBeer).forEach((key) => {
      const value = craftBeer[key];

      if (ARRAY_KEYS.includes(key)) {
        for (let i = 0; i < value.length; i += 1) {
          formData.append(`craft_beer[${key}]`, value[i]);
        }
      } else {
        formData.append(`craft_beer[${key}]`, value);
      }
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
