<template>
  <div
    data-craft-beer
    class="p-8 flex flex-col justify-center items-center"
  >
    <div class="relative z-10 h-320 w-320 flex items-center justify-center">
      <img
        v-if="imageUrl"
        class="text-center h-320 max-w-320"
        :src="imageUrl"
      >
      <div class="absolute bg-saffron top-24 -bottom-8 left-8 right-8 -z-10 rounded-4xl blur-2xl" />
    </div>

    <div class="w-full relative z-20">
      <div class="mb-2">
        <div class="leading-none">
          {{ craftBeerTypeName || 'Kategorie' }}
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
        @add-to-cart="handleAddToCart"
      />
    </div>
  </div>
</template>

<script>
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
  data() {
    return {
      imageUrl: this.craftBeer.craft_beer_image || new URL('../../assets/placeholder_beer.png', import.meta.url),
    };
  },
  computed: {
    craftBeerTypeName() {
      return this.craftBeerTypes
        .find((craftBeerType) => craftBeerType.id === this.craftBeer.craft_beer_type_id)?.name;
    },
  },
  watch: {
    // eslint-disable-next-line func-names
    'craftBeer.craft_beer_image': function () {
      this.imageUrl = URL.createObjectURL(this.craftBeer.craft_beer_image);
    },
  },
  methods: {
    handleAddToCart(amount) {
      this.$emit('addToCart', this.craftBeer, amount);
    },
  },
};
</script>

<style scoped>
.craft-beer {
  padding: 10px;
}
</style>
