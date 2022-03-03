<template>
  <div>
    <div class="p-8 w-96 flex flex-col justify-center items-center">
      <img
        v-if="imageUrl"
        class="text-center"
        :src="imageUrl"
      >
      <div class="text-center">
        {{ craftBeer.name }}
      </div>
      <div class="text-center">
        {{ 'craftBeer.brewery' }}
      </div>
      <button @click="addToCart(craftBeer)">
        <Icon
          icon="cart"
          width="32"
          height="32"
          color="black"
        />
      </button>
    <!-- <div class="p-16 bg-oxfordBlue block rounded-full" /> -->
    </div>
  </div>
</template>

<script>
import { useCart } from '@/composables/useCart';

import Icon from '@/components/Icon.vue';

export default {
  components: {
    Icon,
  },
  props: {
    craftBeer: {
      type: Object,
      required: true,
    },
  },
  setup() {
    const { addToCart } = useCart();
    return { addToCart };
  },
  data() {
    return {
      imageUrl: new URL('../assets/placeholder_beer.png', import.meta.url),
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
