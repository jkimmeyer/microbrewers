<template>
  <div>
    <h1>{{ $t('brewer.create') }}</h1>
    <form @submit.prevent="createCraftBeer">
      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.name')"
        input-id="input-name"
      >
        <input
          id="input-name"
          v-model="craftBeer.name"
          :class="slotProps.class"
          required
          type="text"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.image')"
        input-id="input-craft-beer-image"
      >
        <input
          id="input-craft-beer-image"
          :class="slotProps.class"
          type="file"
          @change="handleFileUpload($event)"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.description')"
        input-id="input-description"
      >
        <textarea
          id="input-description"
          v-model="craftBeer.description"
          :class="slotProps.class"
          type="textfield"
        />
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.hops')"
        input-id="input-hops"
      >
        <input
          id="input-hops"
          v-model="craftBeer.hop"
          :class="slotProps.class"
          type="text"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.ibu')"
        input-id="input-ibu"
      >
        <input
          id="input-ibu"
          v-model="craftBeer.international_bitterness_unit"
          :class="slotProps.class"
          type="number"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.alcohol')"
        input-id="input-vol"
      >
        <input
          id="input-vol"
          v-model="craftBeer.alcohol_volume"
          :class="slotProps.class"
          type="number"
          step=".1"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.price')"
        input-id="input-price"
      >
        <input
          id="input-price"
          v-model="craftBeer.price"
          :class="slotProps.class"
          type="number"
          step=".01"
        >
      </InputField>
      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.flavor')"
        input-id="input-flavor"
      >
        <input
          id="input-flavor"
          v-model="craftBeer.flavor"
          :class="slotProps.class"
          type="text"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.color')"
        input-id="input-color"
      >
        <input
          id="input-color"
          v-model="craftBeer.color"
          :class="slotProps.class"
          type="text"
        >
      </InputField>

      <InputField
        :label="$t('craftBeer.category')"
        input-id="input-craft-beer-type"
      >
        <select
          id="input-craft-beer-type"
          v-model="craftBeer.craft_beer_type_id"
          required
        >
          <option
            v-for="craftBeerType in craftBeerTypes"
            :key="craftBeerType.id"
            :value="craftBeerType.id"
          >
            {{ craftBeerType.name }}
          </option>
        </select>
      </InputField>

      <div>
        {{ errors }}
      </div>

      <button
        type="submit"
        @click="createCraftBeer"
      >
        {{ $t('brewer.addCraftBeer') }}
      </button>
    </form>

    <router-link to="/craft_beers">
      {{ $t('brewer.craftBeerOverview') }}
    </router-link>
  </div>
</template>

<script>
import InputField from '@/components/Input/Field.vue';
import Repository from '@/repositories/index';

const CraftBeerRepository = Repository.get('craftBeer');
const CraftBeerTypeRepository = Repository.get('craftBeerType');

export default {
  name: 'CraftBeerNew',
  components: {
    InputField,
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
    };
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
  },
};
</script>
