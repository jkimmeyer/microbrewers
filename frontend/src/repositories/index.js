import CraftBeerRepository from './CraftBeerRepository';
import CraftBeerTypeRepository from './CraftBeerTypeRepository';
import UserRepository from './UserRepository';

const repositories = {
  craftBeer: CraftBeerRepository,
  craftBeerType: CraftBeerTypeRepository,
  user: UserRepository,
};

export default {
  get: (name) => repositories[name],
};
