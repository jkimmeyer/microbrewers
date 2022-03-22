<template>
  <form
    @submit.prevent="$emit('handleSubmit', $data)"
  >
    <InputField
      v-slot="slotProps"
      :label="$t('user.firstName')"
      input-id="user-first-name-input"
    >
      <input
        id="user-first-name-input"
        v-model.lazy="firstName"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="user-last-name-input"
      :label="$t('user.lastName')"
    >
      <input
        id="user-last-name-input"
        v-model.lazy="lastName"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      input-id="user-street-input"
      :label="$t('user.street')"
    >
      <input
        id="user-street-input"
        v-model.lazy="address.street"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('user.houseNumber')"
    >
      <input
        v-model.lazy="address.houseNumber"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('user.postalCode')"
    >
      <input
        v-model.lazy="address.postalCode"
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('user.city')"
    >
      <input
        v-model.lazy="address.city"
        :class="slotProps.class"
        type="text"
      >
    </InputField>
  </form>
</template>

<script>
import InputField from '@/components/Input/Field.vue';

export default {
  name: 'CustomerForm',
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
      firstName: this.currentData?.firstName,
      lastName: this.currentData?.lastName,
      address: {
        street: this.currentData?.street,
        houseNumber: this.currentData?.houseNumber,
        city: this.currentData?.city,
        postalCode: this.currentData?.postalCode,
      },
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
