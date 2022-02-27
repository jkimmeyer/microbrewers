<template>
  <div>
    <h1>Add a new craft beer</h1>
    <form>
      <InputField
        label="Name"
        input-id="input-name"
      >
        <input
          id="input-name"
          v-model="craftBeer.name"
          required
          type="text"
        >
      </InputField>

      <InputField
        label="Craft Beer Image"
        input-id="input-craft-beer-image"
      >
        <input
          id="input-craft-beer-image"
          type="file"
          @change="handleFileUpload($event)"
        >
      </InputField>

      <InputField
        label="Description"
        input-id="input-description"
      >
        <textarea
          id="input-description"
          v-model="craftBeer.description"
          type="textfield"
        />
      </InputField>

      <InputField
        label="Hops"
        input-id="input-hops"
      >
        <input
          id="input-hops"
          v-model="craftBeer.hop"
          type="text"
        >
      </InputField>

      <InputField
        label="International Bitterness Unit"
        input-id="input-ibu"
      >
        <input
          id="input-ibu"
          v-model="craftBeer.international_bitterness_unit"
          type="number"
        >
      </InputField>

      <InputField
        label="Alcohol Volume %"
        input-id="input-vol"
      >
        <input
          id="input-vol"
          v-model="craftBeer.alcohol_volume"
          type="number"
          step=".1"
        >
      </InputField>

      <InputField
        label="Price €"
        input-id="input-price"
      >
        <input
          id="input-price"
          v-model="craftBeer.price"
          type="number"
          step=".01"
        >
      </InputField>
      <InputField
        label="Flavor"
        input-id="input-flavor"
      >
        <input
          id="input-flavor"
          v-model="craftBeer.flavor"
          type="text"
        >
      </InputField>

      <InputField
        label="Color"
        input-id="input-color"
      >
        <input
          id="input-color"
          v-model="craftBeer.color"
          type="text"
        >
      </InputField>

      <InputField
        label="Craft Beer Type"
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
        Craft Bier hinzufügen
      </button>
    </form>

    <router-link to="/craft_beers">
      See all craft beers
    </router-link>
  </div>
</template>

<script>
import InputField from '../../components/InputField.vue';

function removeEmpty(obj) {
  // eslint-disable-next-line no-unused-vars
  return Object.fromEntries(Object.entries(obj).filter(([_, v]) => v != null && v !== ''));
}

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
    this.axios
      .get('/api/v1/craft_beer_types')
      .then((response) => {
        this.craftBeerTypes = response.data;
      });
  },
  methods: {
    createCraftBeer() {
      const formData = new FormData();
      const craftBeer = removeEmpty(this.$data.craftBeer);

      Object.keys(craftBeer).forEach((key) => {
        formData.append(`craft_beer[${key}]`, craftBeer[key]);
      });

      if (this.craft_beer_image) {
        formData.append('craft_beer[craft_beer_image]', this.craft_beer_image);
      }

      this.axios
        .post(
          '/api/v1/craft_beers',
          formData,
          {
            headers: {
              'Content-Type': 'multipart/form-data',
            },
          },
        )
        .catch((error) => {
          this.errors = error.response.data;
          // eslint-disable-next-line no-console
          console.log(error);
        });
    },
    handleFileUpload(event) {
      [this.craft_beer_image] = event.target.files;
    },
  },
};
</script>
