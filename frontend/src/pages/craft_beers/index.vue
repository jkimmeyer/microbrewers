<template>
  <div class="px-16 py-16">
    <div class="grid grid-cols-12 gap-12">
      <div class="col-span-5">
        <Map />
      </div>
      <div class="col-span-7 grid grid-cols-12 gap-12">
        <div
          v-for="craftBeer in craftBeers"
          :key="craftBeer.id"
          class="col-span-6"
        >
          <CraftBeerView
            :craft-beer="craftBeer"
            :craft-beer-types="craftBeerTypes"
            :breweries="breweries"
            @add-to-cart="addToCart"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CraftBeerView from '@/components/CraftBeer/View.vue';
import Repository from '@/repositories/index';
import Map from '@/components/Map.vue';

import { useCart } from '@/composables/useCart';

const CraftBeerRepository = Repository.get('craftBeer');
const CraftBeerTypeRepository = Repository.get('craftBeerType');
const BreweryRepository = Repository.get('brewery');

export default {
  name: 'CraftBeersIndex',
  components: {
    CraftBeerView,
    Map,
  },
  setup() {
    const { addToCart } = useCart();

    return {
      addToCart,
    };
  },
  data() {
    return {
      craftBeers: [],
      craftBeerTypes: [],
      breweries: [],
    };
  },
  mounted() {
    CraftBeerRepository.get()
      .then((response) => {
        this.craftBeers = response.data;
      });
    CraftBeerTypeRepository.get()
      .then((response) => {
        this.craftBeerTypes = response.data;
      });
    BreweryRepository.get()
      .then((response) => {
        this.breweries = response.data;
      });
  },
};
</script>
