<template>
  <div class="grid grid-cols-12 gap-32 justify-center">
    <UserForm
      :class="gridItemClasses"
      @handleSubmit="setUser"
    />
    <AccountForm
      v-if="step > 0"
      class="col-span-4"
      @handleSubmit="setAccountType"
    />
    <BrewersForm
      v-if="step > 1"
      class="col-span-4"
      @handleSubmit="setBrewer"
    />
  </div>
</template>

<script>
import { computed, ref } from 'vue';
import AccountForm from '@/components/AccountForm.vue';
import BrewersForm from '@/components/BrewersForm.vue';
import UserForm from '@/components/UserForm.vue';
import Repository from '@/repositories/index';

const UserRepository = Repository.get('user');

export default {
  name: 'UsersLogin',
  components: {
    AccountForm,
    BrewersForm,
    UserForm,
  },
  setup() {
    const errors = ref({});
    const step = ref(0);
    const user = ref({});

    const setUser = (userData) => {
      user.value = userData;
      step.value += 1;
    };

    const registerUser = () => {
      UserRepository.register(user.value)
        .catch((error) => {
          errors.value = error.response.data.errors;
        });
    };

    const gridItemClasses = computed(() => {
      if (step.value === 0) { return 'col-start-5 col-end-9'; }
      return 'col-span-4';
    });

    return {
      errors,
      step,
      registerUser,
      setUser,
      gridItemClasses,
    };
  },
};
</script>
