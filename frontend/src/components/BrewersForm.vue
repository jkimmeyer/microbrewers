<template>
  <form @submit.prevent="$emit('handleSubmit', brewer)">
    <InputField
      v-slot="slotProps"
      :label="$t('user.firstName')"
      input-id="user-first-name-input"
    >
      <input
        id="user-first-name-input"
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
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('user.houseNumber')"
    >
      <input
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('user.city')"
    >
      <input
        :class="slotProps.class"
        type="text"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('user.postalCode')"
    >
      <input
        :class="slotProps.class"
        type="text"
      >
    </InputField>
  </form>
</template>

<script>
import InputField from '@/components/Input/Field.vue';

export default {
  name: 'BrewersForm',
  components: {
    InputField,
  },
};
</script>
