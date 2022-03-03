<template>
  <div class="flex justify-center mt-36">
    <div>
      <h2 class="text-2xl font-serif">
        {{ $t('user.loginForm') }}
      </h2>
      <UserForm @handleSubmit="registerUser" />
    </div>
  </div>
</template>

<script>
import UserForm from '@/components/UserForm.vue';
import Repository from '@/repositories/index';

const UserRepository = Repository.get('user');

export default {
  name: 'UsersLogin',
  components: {
    UserForm,
  },
  setup() {
    const registerUser = (user) => {
      UserRepository.register(user)
        .catch((error) => {
          this.errors = error.response.data;
          // eslint-disable-next-line no-console
          console.log(error);
        });
    };

    return {
      registerUser,
    };
  },
};
</script>
