import CraftBeerRepository from './CraftBeerRepository';
import CraftBeerTypeRepository from './CraftBeerTypeRepository';

const repositories = {
  craftBeer: CraftBeerRepository,
  craftBeerType: CraftBeerTypeRepository,
};

export default {
  get: (name) => repositories[name],
};
