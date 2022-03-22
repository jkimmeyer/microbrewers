<template>
  <div>
    <h1 class="text-3xl">
      {{ $t('user.login') }}
    </h1>
    <form
      id="login-form"
      class="mb-4"
      @submit.prevent="$emit('user-login', user)"
    >
      <InputField
        v-slot="slotProps"
        :label="$t('user.email')"
        input-id="input-email"
      >
        <input
          id="input-email"
          v-model="user.email"
          :class="slotProps.class"
          size="32"
          type="email"
        >
      </InputField>

      <InputField
        v-slot="slotProps"
        :label="$t('user.password')"
        input-id="input-password"
      >
        <input
          id="input-password"
          v-model="user.password"
          :class="slotProps.class"
          size="32"
          type="password"
        >
      </InputField>

      <p class="block text-right">
        <router-link
          to="#"
        >
          Passwort vergessen?
        </router-link>
      </p>

      <div
        v-if="errors"
        class="errors"
      >
        {{ errors?.errors }}
      </div>

      <button
        class="block bg-saffron px-16 py-1 text-xl rounded-lg mt-4 ml-auto"
        type="submit"
      >
        Login
      </button>
    </form>

    <p class="block text-right">
      {{ $t('user.registration.missing') }}
      <router-link
        class="font-bold"
        to="/users/registration"
      >
        {{ $t('user.registration.invitation') }}
      </router-link>
    </p>
  </div>
</template>

<script>
import InputField from '@/components/Input/Field.vue';

export default {
  components: { InputField },
  props: {
    errors: {
      type: Object,
      default: () => {},
    },
  },

  data() {
    return {
      user: {
        email: '',
        password: '',
      },
    };
  },
};
</script>
