<template>
  <div class="flex mt-36 justify-center">
    <LoginForm
      :errors="errors"
      @user-login="login"
    />
  </div>
</template>

<script>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

import Repository from '@/repositories/index';

import { useAuth } from '@/composables/useAuth';
import LoginForm from '@/components/LoginForm.vue';

const UserRepository = Repository.get('user');

export default {
  name: 'UsersLogin',
  components: {
    LoginForm,
  },
  setup() {
    const { setUser } = useAuth();
    const errors = ref([]);
    const router = useRouter();

    const login = (user) => {
      UserRepository.login(user)
        .then((response) => {
          setUser(response.data);
          router.push('/dashboard');
        })
        .catch((response) => {
          errors.value = response.response.data;
        });
    };

    return {
      login,
      setUser,
      errors,
    };
  },
};
</script>
