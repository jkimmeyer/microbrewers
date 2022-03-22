<template>
  <form
    class="grid grid-cols-12 gap-8"
    @submit.prevent="$emit('createCraftBeer')"
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
        :label="$t('craftBeer.flavors')"
        input-id="input-flavors"
      >
        <Multiselect
          id="input-flavors"
          v-model="flavors"
          mode="tags"
          max="2"
          :searchable="true"
          :options="flavorsList"
        />
      </InputField>

      <InputField
        :label="$t('craftBeer.hops')"
        input-id="input-hops"
      >
        <Multiselect
          id="input-hops"
          v-model="hops"
          mode="tags"
          :searchable="true"
          :options="hopsList"
        />
      </InputField>

      <InputField
        :label="$t('craftBeer.category')"
        input-id="input-craft-beer-type"
      >
        <Multiselect
          id="input-craft-beer-type"
          v-model="craft_beer_type_id"
          :searchable="true"
          value-prop="id"
          label="name"
          :options="craftBeerTypes"
        />
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
        <span>{{ $t('brewery.saveCraftBeer') }}</span>
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

import Multiselect from '@vueform/multiselect';

export default {
  components: {
    Icon,
    InputField,
    Multiselect,
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
    hopsList: {
      type: Array,
      required: true,
    },
    flavorsList: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      name: this.craftBeer.name,
      description: this.craftBeer.description,
      hops: this.craftBeer.hops,
      craft_beer_image: this.craftBeer.craft_beer_image,
      international_bitterness_unit: this.craftBeer.international_bitterness_unit,
      alcohol_volume: this.craftBeer.alcohol_volume,
      price: this.craftBeer.price,
      flavors: this.craftBeer.flavors,
      color: this.craftBeer.color,
      craft_beer_type_id: this.craftBeer.craft_beer_type_id,
    };
  },
  computed: {
    mappedCraftBeerTypes() {
      return this.craftBeerTypes
        .map((craftBeerType) => ({ value: craftBeerType.id, label: craftBeerType.name }));
    },
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

<style src="@vueform/multiselect/themes/default.css"></style>
<style>
:root {
  --ms-bg-disabled: rgb(243, 244, 246);
  --ms-border-color: rgb(255, 255, 255);
  --ms-border-width: 1px;
  --ms-radius: 8px;
  --ms-py: 0.5rem;
  --ms-px: 0.875rem;
  --ms-ring-width: 1px;
  --ms-ring-color: rgb(16, 25, 53);
  --ms-placeholder-color: rgb(156, 163, 175);
  --ms-max-height: 10rem;
  --ms-spinner-color: rgb(16, 185, 129);
  --ms-caret-color: rgb(16, 25, 53);
  --ms-clear-color: rgb(16, 25, 53);
  --ms-clear-color-hover: rgb(0, 0, 0);
  --ms-tag-font-size: 0.875rem;
  --ms-tag-line-height: 1.25rem;
  --ms-tag-font-weight: 600;
  --ms-tag-bg: rgb(16, 25, 53);
  --ms-tag-bg-disabled: rgb(156, 163, 175);
  --ms-tag-color: rgb(248, 198, 48);
  --ms-tag-color-disabled: rgb(255, 255, 255);
  --ms-tag-radius: 16px;
  --ms-tag-py: 0.25rem;
  --ms-tag-px: 0.5rem;
  --ms-tag-my: 0.25rem;
  --ms-tag-mx: 0.25rem;
  --ms-tag-remove-radius: 4px;
  --ms-tag-remove-py: 0.25rem;
  --ms-tag-remove-px: 0.25rem;
  --ms-tag-remove-my: 0;
  --ms-tag-remove-mx: 0.125rem;
  --ms-dropdown-bg: rgb(255, 255, 255);
  --ms-dropdown-border-color: rgb(209, 213, 219);
  --ms-dropdown-border-width: 1px;
  --ms-dropdown-radius: 4px;
  --ms-option-font-size: 1rem;
  --ms-option-line-height: 1.375;
  --ms-option-bg-pointed: rgb(16, 25, 53);
  --ms-option-color-pointed: rgb(248, 198, 48);
  --ms-option-bg-selected: rgb(16, 25, 53);
  --ms-option-color-selected: rgb(248, 198, 48);
  --ms-option-bg-disabled: rgb(255, 255, 255);
  --ms-option-color-disabled: rgb(209, 213, 219);
  --ms-option-bg-selected-pointed: rgb(16, 25, 53);
  --ms-option-color-selected-pointed: rgb(255, 255, 255);
  --ms-option-bg-selected-disabled: rgb(255, 255, 255);
  --ms-option-color-selected-disabled: rgb(209, 250, 229);
  --ms-option-py: 0.5rem;
  --ms-option-px: 0.75rem;
  --ms-empty-color: rgb(75, 85, 99);
}
</style>
