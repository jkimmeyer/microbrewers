<template>
  <div class="flex mt-36 justify-center">
    <div>
      <h1 class="text-3xl">
        {{ $t('user.login') }}
      </h1>
      <form
        id="login-form"
        class="mb-4"
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

        <div v-if="errors">
          {{ errors.errors }}
        </div>

        <button
          class="block bg-saffron px-16 py-1 text-xl rounded-lg mt-4 ml-auto"
          type="submit"
          @click="login()"
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
  </div>
</template>

<script>
import { reactive } from 'vue';

import InputField from '@/components/Input/Field.vue';
import Repository from '@/repositories/index';

import { useAuth } from '@/composables/useAuth';

const UserRepository = Repository.get('user');

export default {
  name: 'UsersLogin',
  components: { InputField },
  setup() {
    const { setUser } = useAuth();
    const user = reactive({ email: '', password: '' });
    const errors = reactive([]);

    const login = () => {
      UserRepository.login(user)
        .then((response) => {
          setUser(response.data);
        })
        .catch((error) => {
          errors.value = error.response.data;
        });
    };

    return {
      login,
      setUser,
      user,
      errors,
    };
  },
};
</script>
