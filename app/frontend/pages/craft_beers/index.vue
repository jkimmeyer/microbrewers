<template>
  <div>
    <div class="craft-beer-grid">
      <CraftBeerView
        v-for="craftBeer in craftBeers"
        :key="craftBeer.id"
        :craft-beer="craftBeer"
      />
    </div>
    <router-link to="/craft_beers/new">
      Create a new craft beer
    </router-link>
  </div>
</template>

<script>
import CraftBeerView from '../../components/CraftBeerView.vue';
import Repository from '../../repositories/index';

const CraftBeerRepository = Repository.get('craftBeer');

export default {
  name: 'CraftBeersIndex',
  components: {
    CraftBeerView,
  },
  data() {
    return {
      craftBeers: [],
    };
  },
  mounted() {
    CraftBeerRepository.get()
      .then((response) => {
        this.craftBeers = response.data;
      });
  },
};
</script>

<style>
  .craft-beer-grid {
    display: grid;
    grid-template-columns: 33% 33% 33%;
    grid-gap: 3rem;
  }
</style>
