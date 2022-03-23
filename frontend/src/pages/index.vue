<template>
  <div>
    <div class="max-w-screen-xl m-auto mt-20">
      <h2 class="text-3xl font-serif text-center mb-16">
        Unterstütze lokale Brauereien und kaufe lokal und nachhaltig Craft-Bier
      </h2>

      <p class="text-xl">
        The European languages are members of the same family. Their separate existence is a myth.
        For science, music, sport, etc, Europe uses the same vocabulary. The languages only
        differ in their grammar, their pronunciation and their most common words.
        Everyone realizes why a new common language would be desirable:
        one could refuse to pay expensive translators. To achieve this, it would be necessary to
        have uniform grammar, pronunciation and more common words.
      </p>
    </div>

    <h2 class="mt-20 m-auto max-w-screen-xl text-2xl font-serif">
      Unser Konzept
    </h2>

    <div class="max-w-screen-xl m-auto mt-20 flex justify-center">
      <img
        src="@/assets/process.png"
        alt="Unser Konzept"
      >
    </div>

    <div class="max-w-screen-xl mx-auto mt-20 bg-oxfordBlue">
      <iframe
        width="100%"
        height="800px"
        src="https://www.youtube.com/embed/5i1txE9NT3c"
        title="YouTube video player"
        frameborder="0"
        allow="
        accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        class="rounded-lg"
        allowfullscreen
      />
    </div>

    <h2 class="mt-20 m-auto max-w-screen-xl text-2xl font-serif">
      Unsere Biere
    </h2>
    <div class="grid grid-cols-12 mt-20 m-auto max-w-screen-xl">
      <div
        v-for="craftBeer in craftBeers.slice(0,5)"
        :key="craftBeer.id"
        class="col-span-4"
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
</template>

<script>
import CraftBeerView from '@/components/CraftBeer/View.vue';
import Repository from '@/repositories/index';

import { useCart } from '@/composables/useCart';

const CraftBeerRepository = Repository.get('craftBeer');
const CraftBeerTypeRepository = Repository.get('craftBeerType');
const BreweryRepository = Repository.get('brewery');

export default {
  name: 'Index',
  components: {
    CraftBeerView,
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
