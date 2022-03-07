<template>
  <div>
    <div class="mb-20">
      <h1>{{ $t('brewer.create') }}</h1>

      <CraftBeerForm
        :craft-beer="craftBeer"
        :craft-beer-types="craftBeerTypes"
        :errors="errors"
        @update-craft-beer="updateCraftBeer"
        @handle-file-upload="handleFileUpload"
      />
    </div>

    <h2 class="text-3xl font-serif mb-8">
      {{ previewHeading }}
    </h2>

    <div v-if="craftBeerDetailView">
      <CraftBeerDetail
        :craft-beer="craftBeer"
        :craft-beer-types="craftBeerTypes"
        :preview="true"
      />
    </div>

    <div
      v-else
      class="grid grid-cols-12"
    >
      <div class="col-span-3">
        <CraftBeerView
          :craft-beer="craftBeer"
          :craft-beer-types="craftBeerTypes"
          :preview="true"
        />
      </div>
    </div>

    <router-link to="/craft_beers">
      {{ $t('brewer.craftBeerOverview') }}
    </router-link>
  </div>
</template>

<script>
import CraftBeerView from '@/components/CraftBeer/View.vue';
import CraftBeerDetail from '@/components/CraftBeer/Detail.vue';
import Repository from '@/repositories/index';
import CraftBeerForm from '@/components/CraftBeer/Form.vue';

const CraftBeerRepository = Repository.get('craftBeer');
const CraftBeerTypeRepository = Repository.get('craftBeerType');

export default {
  name: 'CraftBeerNew',
  components: {
    CraftBeerView,
    CraftBeerDetail,
    CraftBeerForm,
  },
  data() {
    return {
      craftBeer: {
        name: null,
        description: null,
        hop: null,
        craft_beer_image: null,
        international_bitternes_unit: null,
        alcohol_volume: null,
        price: null,
        flavor: null,
        color: null,
        craft_beer_type_id: null,
      },
      craftBeerTypes: [],
      errors: [],
      craftBeerDetailView: true,
    };
  },
  computed: {
    previewHeading() {
      return this.craftBeerDetailView ? this.$t('brewer.craftBeerPreviewDetail') : this.$t('brewer.craftBeerPreviewOverview');
    },
  },
  mounted() {
    CraftBeerTypeRepository.get()
      .then((response) => {
        this.craftBeerTypes = response.data;
      });
  },
  methods: {
    createCraftBeer() {
      CraftBeerRepository.create(this.craftBeer)
        .then((response) => {
          // eslint-disable-next-line no-console
          console.log(response);
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
      this.craftBeer = craftBeer;
    },
  },
};
</script>
