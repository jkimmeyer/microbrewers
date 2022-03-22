<template>
  <form @submit.prevent="$emit('handleSubmit', user)">
    <h2 class="text-2xl font-serif">
      {{ $t('user.loginForm') }}
    </h2>
    <InputField
      v-slot="slotProps"
      :label="$t('user.email')"
      input-id="input-user-email"
    >
      <input
        id="input-user-email"
        v-model.lazy="user.email"
        size="32"
        :class="slotProps.class"
        type="email"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('user.password')"
      input-id="input-user-password"
    >
      <input
        id="input-user-password"
        v-model.lazy="user.password"
        size="32"
        :class="slotProps.class"
        type="password"
      >
    </InputField>

    <InputField
      v-slot="slotProps"
      :label="$t('user.passwordConfirmation')"
      input-id="input-user-password-confirmation"
    >
      <input
        id="input-user-password-confirmation"
        v-model.lazy="user.passwordConfirmation"
        size="32"
        :class="slotProps.class"
        type="password"
      >
    </InputField>

    <InputCheckbox
      v-slot="slotProps"
      input-id="input-terms-and-conditions"
      :label="$t('user.termsAndConditions')"
    >
      <input
        id="input-terms-and-conditions"
        v-model="user.termsAndConditions"
        :class="slotProps.class"
        type="checkbox"
      >
    </InputCheckbox>
  </form>
</template>

<script>
import InputField from '@/components/Input/Field.vue';
import InputCheckbox from '@/components/Input/Checkbox.vue';

export default {
  name: 'UserForm',
  components: { InputCheckbox, InputField },
  props: {
    currentData: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      user: {
        email: this.currentData?.email,
        password: this.currentData?.password,
        passwordConfirmation: this.currentData?.passwordConfirmation,
        termsAndConditions: this.currentData?.termsAndConditions,
      },
    };
  },
  watch: {
    user: {
      handler() {
        this.$emit('handleSubmit', this.user);
      },
      deep: true,
    },
  },
};
</script>
