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
    this.axios
      .get('/api/v1/craft_beers')
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
