<template>
  <div>
    <div class="mb-20">
      <h2 class="text-3xl font-serif mb-8">
        {{ $t('brewery.create') }}
      </h2>

      <CraftBeerForm
        :craft-beer="craftBeer"
        :craft-beer-types="craftBeerTypes"
        :hops-list="hops"
        :flavors-list="flavors"
        :errors="errors"
        @create-craft-beer="createCraftBeer"
        @update-craft-beer="updateCraftBeer"
        @handle-file-upload="handleFileUpload"
      />
    </div>

    <h2 class="text-3xl font-serif mb-8">
      {{ previewHeading }}
    </h2>

    <div
      v-if="craftBeerDetailView"
      data-preview
    >
      <CraftBeerDetail
        :craft-beer="craftBeer"
        :craft-beer-types="craftBeerTypes"
        :breweries="breweries"
        :preview="true"
        :fruits-selected="craftBeer.flavors?.length"
      />
    </div>

    <div
      v-else
      class="grid grid-cols-12"
      data-preview
    >
      <div class="col-span-3">
        <CraftBeerView
          :craft-beer="craftBeer"
          :craft-beer-types="craftBeerTypes"
          :preview="true"
          :fruits-selected="craftBeer.flavors?.length"
        />
      </div>
    </div>

    <router-link to="/craft_beers">
      {{ $t('brewery.craftBeerOverview') }}
    </router-link>
  </div>
</template>

<script>
import CraftBeerView from '@/components/CraftBeer/View.vue';
import CraftBeerDetail from '@/components/CraftBeer/Detail.vue';
import Repository from '@/repositories/index';
import CraftBeerForm from '@/components/CraftBeer/Form.vue';
import { useAuth } from '@/composables/useAuth';

const CraftBeerRepository = Repository.get('craftBeer');
const CraftBeerTypeRepository = Repository.get('craftBeerType');
const BreweryRepository = Repository.get('brewery');

const HopRepository = Repository.get('hop');
const FlavorRepository = Repository.get('flavor');

export default {
  name: 'CraftBeerNew',
  components: {
    CraftBeerView,
    CraftBeerDetail,
    CraftBeerForm,
  },
  setup() {
    const { user } = useAuth();

    return { user };
  },
  data() {
    return {
      craftBeer: {
        name: null,
        description: null,
        hops: null,
        craft_beer_image: null,
        international_bitterness_unit: null,
        alcohol_volume: null,
        price: null,
        flavors: [],
        color: null,
        craft_beer_type_id: null,
        brewery_id: this.user?.account_id,
      },
      craftBeerTypes: [],
      hops: [],
      breweries: [],
      flavors: [],
      errors: [],
      craftBeerDetailView: true,
    };
  },
  computed: {
    previewHeading() {
      return this.craftBeerDetailView ? this.$t('brewery.craftBeerPreviewDetail') : this.$t('brewery.craftBeerPreviewOverview');
    },
  },
  mounted() {
    CraftBeerTypeRepository.get()
      .then((response) => {
        this.craftBeerTypes = response.data;
      });

    HopRepository.get()
      .then((response) => {
        this.hops = response.data;
      });

    FlavorRepository.get()
      .then((response) => {
        this.flavors = response.data;
      });

    BreweryRepository.get()
      .then((response) => {
        this.breweries = response.data;
      });
  },
  methods: {
    createCraftBeer() {
      CraftBeerRepository.create(this.craftBeer)
        .then(() => {
          this.$router.push('/users/craft_beers');
        })
        .catch((error) => {
          this.errors = error.response.data;
          // eslint-disable-next-line no-console
          console.log(error);
        });
    },
    handleFileUpload(event) {
      [this.craftBeer.craft_beer_image] = event.target.files;
    },
    updateCraftBeer(craftBeer) {
      this.craftBeer = { ...this.craftBeer, ...craftBeer };
    },
  },
};
</script>
