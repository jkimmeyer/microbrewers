import CraftBeerRepository from './CraftBeerRepository';
import CraftBeerTypeRepository from './CraftBeerTypeRepository';
import FlavorRepository from './FlavorRepository';
import HopsRepository from './HopsRepository';
import UserRepository from './UserRepository';

const repositories = {
  craftBeer: CraftBeerRepository,
  craftBeerType: CraftBeerTypeRepository,
  flavors: FlavorRepository,
  hops: HopsRepository,
  user: UserRepository,
};

export default {
  get: (name) => repositories[name],
};
