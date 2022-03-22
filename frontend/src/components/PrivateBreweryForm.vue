<template>
  <form
    @submit.prevent="$emit('handleSubmit', $data)"
  >
    <InputField
      v-slot="slotProps"
      :label="$t('brewery.name')"
      input-id="private-brewery-name-input"
    >
      <input
        id="private-brewery-name-input"
        v-model.lazy="name"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('user.firstName')"
      input-id="private-brewery-first-name-input"
    >
      <input
        id="private-brewery-first-name-input"
        v-model.lazy="firstName"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="private-brewery-last-name-input"
      :label="$t('user.lastName')"
    >
      <input
        id="private-brewery-last-name-input"
        v-model.lazy="lastName"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="private-brewery-street-input"
      :label="$t('user.street')"
    >
      <input
        id="private-brewery-street-input"
        v-model.lazy="address.street"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="private-brewery-house-number-input"
      :label="$t('user.houseNumber')"
    >
      <input
        id="private-brewery-house-number-input"
        v-model.lazy="address.houseNumber"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="private-brewery-postal-code-input"
      :label="$t('user.postalCode')"
    >
      <input
        id="private-brewery-postal-code-input"
        v-model.lazy="address.postalCode"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="private-brewery-city-input"
      :label="$t('user.city')"
    >
      <input
        id="private-brewery-city-input"
        v-model.lazy="address.city"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="private-brewery-phone-input"
      :label="$t('brewery.phone')"
    >
      <input
        id="private-brewery-phone-input"
        v-model.lazy="phone"
        :class="slotProps.class"
        type="tel"
      >
    </InputField>
  </form>
</template>

<script>
import InputField from '@/components/Input/Field.vue';

export default {
  name: 'PrivateBreweryForm',
  components: {
    InputField,
  },
  props: {
    currentData: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      name: this.currentData?.name,
      firstName: this.currentData?.firstName,
      lastName: this.currentData?.lastName,
      street: this.currentData?.street,
      houseNumber: this.currentData?.houseNumber,
      city: this.currentData?.city,
      postalCode: this.currentData?.postalCode,
      phone: this.currentData?.phone,
    };
  },
  watch: {
    $data: {
      handler() {
        this.$emit('handleSubmit', this.$data);
      },
      deep: true,
    },
  },
};
</script>
