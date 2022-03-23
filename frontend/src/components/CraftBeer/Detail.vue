<template>
  <div class="grid grid-cols-12 justify-items-center">
    <div class="col-span-6">
      <div class="mb-16">
        <div class="leading-none">
          {{ craftBeerTypeName || 'Kategorie' }}
        </div>
        <div class="text-4xl leading-none font-bold">
          {{ craftBeer.name || 'Biername' }}
        </div>
        <div class="flex justify-between">
          <div class="text-xl">
            {{ breweryName || 'Brauerei' }}
          </div>
        </div>
      </div>

      <div class="relative z-10 w-320 flex items-center justify-center">
        <img
          v-if="imageUrl"
          class="text-center z-30 h-320 max-w-320"
          :src="imageUrl"
        >
        <img
          v-if="fruitsSelected >= 1 && craftBeer.name.length <= 8"
          class="absolute z-20 right-4 bottom-0 w-32"
          src="@/assets/grapefruit.png"
        >
        <img
          v-if="fruitsSelected >= 1 && craftBeer.name.length > 8"
          class="absolute z-20 right-4 bottom-0 w-32"
          src="@/assets/zimt.png"
        >
        <img
          v-if="fruitsSelected >= 2 && craftBeer.name.length <= 8"
          class="absolute z-20 left-14 w-32"
          src="@/assets/orange.png"
        >
        <img
          v-if="fruitsSelected >= 2 && craftBeer.name.length > 8"
          class="absolute z-20 left-14 w-32"
          src="@/assets/zitrone.png"
        >
        <div
          class="absolute bg-saffron top-24 -bottom-8 left-8 right-8 -z-10 rounded-4xl blur-2xl"
        />
      </div>
    </div>

    <div class="col-span-5">
      <p class="px-10 mb-8 w-full">
        {{ craftBeer.description }}
      </p>

      <dl class="grid grid-cols-12 gap-x-8 mb-8">
        <dt class="col-span-6 flex items-center space-x-4 text-2xl">
          <Icon icon="question-circle" />
          <span class="mb-1">{{ $t('craftBeer.originalWort') }}</span>
        </dt>
        <dd class="col-span-6 text-2xl">
          {{ craftBeer.originalWort || '12' }} %
        </dd>

        <dt class="col-span-6 flex items-center space-x-4 text-2xl">
          <Icon icon="question-circle" />
          <span class="mb-1">{{ $t('craftBeer.alcohol') }}</span>
        </dt>
        <dd class="col-span-6 text-2xl">
          {{ craftBeer.alcohol_volume || '5.4' }} %
        </dd>

        <dt class="col-span-6 flex items-center space-x-4 text-2xl">
          <Icon icon="question-circle" />
          <span class="mb-1">{{ $t('craftBeer.ibu') }}</span>
        </dt>
        <dd class="col-span-6 text-2xl">
          {{ craftBeer.international_bitterness_unit || '12' }} IBU
        </dd>

        <dt class="col-span-6 flex items-center space-x-4 text-2xl">
          <Icon icon="question-circle" />
          <span class="mb-1">{{ $t('craftBeer.color') }}</span>
        </dt>
        <dd class="col-span-6 text-2xl">
          {{ craftBeer.color || 'Saffrongelb' }}
        </dd>

        <dt class="col-span-6 flex items-center space-x-4 text-2xl">
          <Icon icon="question-circle" />
          <span class="mb-1">{{ $t('craftBeer.hops') }}</span>
        </dt>
        <dd class="col-span-6 text-2xl">
          {{ craftBeer?.hops?.join(', ') || 'Hallertauer' }}
        </dd>
      </dl>

      <div class="px-10">
        <div class="text-xl">
          {{ craftBeer.price || '2.99' }} €
        </div>

        <div class="text-xl mb-2">
          {{ $t('crowdBrew.productionDateText') }}
          <strong>{{ productionDate || '04.04.22' }}</strong>
        </div>

        <AddToCart
          v-if="!preview"
          @add-to-cart="$emit('add-to-cart', {$payload, craftBeer})"
        />
      </div>
    </div>
  </div>
</template>

<script>
import { useAuth } from '@/composables/useAuth';
import { useCart } from '@/composables/useCart';

import AddToCart from '@/components/AddToCart.vue';
import Icon from '@/components/Icon.vue';

export default {
  components: {
    AddToCart,
    Icon,
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
    fruitsSelected: {
      type: Number,
      default: 3,
    },
    breweries: {
      type: Array,
      default: () => [],
    },
  },
  setup() {
    const { user } = useAuth();
    const { addToCart } = useCart();
    return { addToCart, user };
  },
  data() {
    return {
      imageUrl: new URL('../../assets/placeholder_beer.png', import.meta.url),
    };
  },
  computed: {
    craftBeerTypeName() {
      return this.craftBeerTypes
        .find((craftBeerType) => craftBeerType.id === this.craftBeer.craft_beer_type_id)?.name;
    },
    breweryName() {
      return this.breweries
        .find((brewery) => brewery.id === this.craftBeer.breweryId)?.name;
    },
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
