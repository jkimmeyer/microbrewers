<template>
  <form
    class="grid grid-cols-12 gap-8"
    @submit.prevent="$emit('createCraftBeer', craftBeer)"
  >
    <div class="col-span-3">
      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.name')"
        input-id="input-name"
      >
        <input
          id="input-name"
          v-model="name"
          :class="slotProps.class"
          required
          type="text"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.description')"
        input-id="input-description"
      >
        <textarea
          id="input-description"
          v-model="description"
          :class="slotProps.class"
          type="textfield"
        />
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.flavor')"
        input-id="input-flavor"
      >
        <input
          id="input-flavor"
          v-model="flavor"
          :class="slotProps.class"
          type="text"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.hops')"
        input-id="input-hops"
      >
        <input
          id="input-hops"
          v-model="hop"
          :class="slotProps.class"
          type="text"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.category')"
        input-id="input-craft-beer-type"
      >
        <select
          id="input-craft-beer-type"
          v-model="craft_beer_type_id"
          :class="slotProps.class"
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
    </div>

    <div class="col-start-6 col-span-2">
      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.color')"
        input-id="input-color"
      >
        <input
          id="input-color"
          v-model="color"
          :class="slotProps.class"
          type="text"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.price')"
        input-id="input-price"
      >
        <input
          id="input-price"
          v-model="price"
          :class="slotProps.class"
          type="number"
          step=".01"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('craftBeer.ibu')"
        input-id="input-ibu"
      >
        <input
          id="input-ibu"
          v-model="international_bitterness_unit"
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
          v-model="alcohol_volume"
          :class="slotProps.class"
          type="number"
          step=".1"
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
          @change="$emit('handleFileUpload', $event)"
        >
      </InputField>

      <VButton
        button-type="submit"
      >
        <span>{{ $t('brewer.saveCraftBeer') }}</span>
        <Icon
          icon="arrow-circle-right"
          width="24"
        />
      </VButton>
    </div>
  </form>
</template>

<script>
import Icon from '@/components/Icon.vue';
import InputField from '@/components/Input/Field.vue';
import VButton from '@/components/VButton.vue';

export default {
  components: {
    Icon,
    InputField,
    VButton,
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
  },
  data() {
    return {
      name: this.craftBeer.name,
      description: this.craftBeer.description,
      hop: this.craftBeer.hop,
      craft_beer_image: this.craftBeer.craft_beer_image,
      international_bitternes_unit: this.craftBeer.international_bitternes_unit,
      alcohol_volume: this.craftBeer.alcohol_volume,
      price: this.craftBeer.price,
      flavor: this.craftBeer.flavor,
      color: this.craftBeer.color,
      craft_beer_type_id: this.craftBeer.craft_beer_type_id,
    };
  },
  watch: {
    $data: {
      handler() {
        this.$emit('update-craft-beer', this.$data);
      },
      deep: true,
    },
  },
};
</script>
