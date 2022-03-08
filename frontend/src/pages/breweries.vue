<template>
  <div class="py-16 max-w-screen-2xl m-auto">
    <div class="grid grid-cols-12 gap-12">
      <div class="col-span-5">
        <Map />
      </div>
      <div class="col-span-7 flex flex-col justify-start space-y-16">
        <div
          v-for="brewery in breweries"
          :key="brewery.id"
        >
          <BreweryView
            :brewery="brewery"
            @support-brewery="supportBrewery"
          />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import BreweryView from '@/components/Brewery/View.vue';
import Map from '@/components/Map.vue';
import Repository from '@/repositories/index';
import { useCart } from '@/composables/useCart';

const BreweryRepository = Repository.get('brewery');
export default {
  components: {
    BreweryView,
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
      breweries: [],
    };
  },
  mounted() {
    BreweryRepository.get()
      .then((response) => {
        this.breweries = response.data;
      });
  },
  methods: {
    supportBrewery(brewery) {
      this.addToCart(brewery, 1, 'brewery');
    },
  },
};
</script>
