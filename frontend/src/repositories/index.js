import BreweryRepository from './BreweryRepository';
import CraftBeerRepository from './CraftBeerRepository';
import CraftBeerTypeRepository from './CraftBeerTypeRepository';
import FlavorRepository from './FlavorRepository';
import HopRepository from './HopRepository';
import UserRepository from './UserRepository';

const repositories = {
  brewery: BreweryRepository,
  craftBeer: CraftBeerRepository,
  craftBeerType: CraftBeerTypeRepository,
  flavor: FlavorRepository,
  hop: HopRepository,
  user: UserRepository,
};

export default {
  get: (name) => repositories[name],
};
