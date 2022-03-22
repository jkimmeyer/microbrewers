<template>
  <form
    @submit.prevent="$emit('handleSubmit', $data)"
  >
    <InputField
      v-slot="slotProps"
      :label="$t('brewery.name')"
      input-id="brewery-name-input"
    >
      <input
        id="brewery-name-input"
        v-model.lazy="name"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('brewery.description')"
      input-id="brewery-description-input"
    >
      <textarea
        id="brewery-description-input"
        v-model.lazy="description"
        :class="slotProps.class"
      />
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="brewery-street-input"
      :label="$t('user.street')"
    >
      <input
        id="brewery-street-input"
        v-model.lazy="address.street"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="brewery-house-number-input"
      :label="$t('user.houseNumber')"
    >
      <input
        id="brewery-house-number-input"
        v-model.lazy="address.houseNumber"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="brewery-postal-code-input"
      :label="$t('user.postalCode')"
    >
      <input
        id="brewery-postal-code-input"
        v-model.lazy="address.postalCode"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="brewery-city-input"
      :label="$t('user.city')"
    >
      <input
        id="brewery-city-input"
        v-model.lazy="address.city"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="brewery-ust-id-input"
      :label="$t('brewery.ustId')"
    >
      <input
        id="brewery-ust-id-input"
        v-model.lazy="ustId"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="brewery-phone-input"
      :label="$t('brewery.phone')"
    >
      <input
        id="brewery-phone-input"
        v-model.lazy="phone"
        :class="slotProps.class"
        type="tel"
      >
    </InputField>

    <h3 class="text-xl">
      {{ $t('brewery.contactPerson') }}
    </h3>

    <InputField
      v-slot="slotProps"
      input-id="brewery-first-name-input"
      :label="$t('user.firstName')"
    >
      <input
        id="brewery-first-name-input"
        v-model.lazy="firstName"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="brewery-last-name-input"
      :label="$t('user.lastName')"
    >
      <input
        id="brewery-last-name-input"
        v-model.lazy="lastName"
        :class="slotProps.class"
        type="text"
      >
    </InputField>
  </form>
</template>

<script>
import InputField from '@/components/Input/Field.vue';

export default {
  name: 'BreweryForm',
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
      description: this.currentData?.description,
      address: {
        street: this.currentData?.street,
        houseNumber: this.currentData?.houseNumber,
        city: this.currentData?.city,
        postalCode: this.currentData?.postalCode,
      },
      ustId: this.currentData?.ustId,
      firstName: this.currentData?.firstName,
      lastName: this.currentData?.lastName,
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
