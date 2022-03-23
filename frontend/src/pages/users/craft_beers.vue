<template>
  <div>
    <ul>
      <li
        v-for="craftBeer,index in craftBeers"
        :key="index"
      >
        <CraftBeerListView
          :craft-beer="craftBeer"
          :craft-beer-types="craftBeerTypes"
          :crowd-brew="index < 1 ? crowdBrew : null"
        />
      </li>
    </ul>
  </div>
</template>
<script>
import Repository from '@/repositories/index';
import { useAuth } from '@/composables/useAuth';
import CraftBeerListView from '@/components/CraftBeer/ListView.vue';

const CraftBeerRepository = Repository.get('craftBeer');
const CraftBeerTypeRepository = Repository.get('craftBeerType');

export default {
  name: 'UsersCraftBeers',
  components: {
    CraftBeerListView,
  },
  setup() {
    const { user } = useAuth();

    return { user };
  },
  data() {
    return {
      craftBeers: [],
      craftBeerTypes: [],
      crowdBrew: {
        producingAt: new Date('2022-04-01'),
        crowdBrewUntil: new Date('2022-03-29'),
        crowdBrewFrom: new Date('2022-03-01'),
        amount: 800,
        estimatedDeliveryDate: new Date('2022-05-01'),
      },
    };
  },
  mounted() {
    CraftBeerRepository.getCraftBeerByUser(this.user?.account_id)
      .then((response) => {
        this.craftBeers = response.data;
      });
    CraftBeerTypeRepository.get()
      .then((response) => {
        this.craftBeerTypes = response.data;
      });
  },
};
</script>
