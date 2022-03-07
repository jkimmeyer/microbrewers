<template>
  <div class="p-8 flex flex-col justify-center items-center">
    <div class="relative z-10 w-320 flex items-center justify-center">
      <img
        v-if="imageUrl"
        class="text-center"
        :src="imageUrl"
      >
      <div class="absolute bg-saffron top-24 -bottom-8 left-8 right-8 -z-10 rounded-4xl blur-2xl" />
    </div>

    <div class="w-full relative z-20">
      <div class="mb-2">
        <div class="leading-none">
          {{ craftBeerTypes[craftBeer.craft_beer_type_id]?.name || 'Kategorie' }}
        </div>

        <div class="text-4xl leading-none font-bold">
          {{ craftBeer.name || 'Biername' }}
        </div>

        <div class="flex justify-between">
          <div class="text-xl">
            {{ user?.brewery || 'Brauerei' }}
          </div>
          <div class="text-xl">
            {{ craftBeer.price || '0,00' }} €
          </div>
        </div>
      </div>

      <AddToCart
        v-if="!preview"
        @add-to-cart="$emit('addToCart', craftBeer, amount)"
      />
    </div>
  </div>
</template>

<script>
import { useCart } from '@/composables/useCart';

import AddToCart from '@/components/AddToCart.vue';

export default {
  components: {
    AddToCart,
  },
  props: {
    craftBeer: {
      type: Object,
      required: true,
    },
    craftBeerTypes: {
      type: Array,
      required: true,
    },
    productionDate: {
      type: String,
      default: null,
    },
    preview: {
      type: Boolean,
      default: false,
    },
  },
  setup() {
    const { addToCart } = useCart();
    return { addToCart };
  },
  data() {
    return {
      imageUrl: new URL('../../assets/placeholder_beer.png', import.meta.url),
    };
  },
  watch: {
    // eslint-disable-next-line func-names
    'craftBeer.craft_beer_image': function () {
      this.imageUrl = URL.createObjectURL(this.craftBeer.craft_beer_image);
    },
  },
};
</script>

<style scoped>
.craft-beer {
  padding: 10px;
}
</style>
