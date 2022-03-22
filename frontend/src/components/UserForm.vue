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
        v-model="user.email"
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
        v-model="user.password"
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
        v-model="user.passwordConfirmation"
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
        :class="slotProps.class"
        type="checkbox"
      >
    </InputCheckbox>

    <div>
      <button
        class="py-2 px-4 bg-saffron rounded-lg font-bold"
        type="submit"
      >
        {{ $t('navigation.continue') }}
      </button>
    </div>
  </form>
</template>

<script>
import InputField from '@/components/Input/Field.vue';
import InputCheckbox from '@/components/Input/Checkbox.vue';

export default {
  name: 'UserForm',
  components: { InputCheckbox, InputField },
  props: {
    currentUser: {
      type: Object,
      default: () => {},
    },
  },
  data() {
    return {
      user: {
        email: this.currentUser?.email,
        password: '',
        passwordConfirmation: '',
        termsAndConditions: false,
      },
    };
  },
};
</script>
