<template>
  <div class="grid grid-cols-12 gap-16 place-items-center">
    <UserForm
      v-if="step === 0"
      class="col-start-5 col-end-9 w-full"
      :current-data="user"
      @handleSubmit="setUser"
    />

    <Transition name="fade">
      <AccountForm
        v-if="step === 1"
        class="col-start-5 col-end-9"
        :current-data="user"
        @handleSubmit="setAccountType"
      />
    </Transition>

    <Transition name="fade">
      <CustomerForm
        v-if="step === 2 && user.account_type === 'Customer'"
        class="col-start-5 col-end-9 w-full"
        :current-data="user"
        @handleSubmit="setAccountData"
      />
    </Transition>

    <Transition name="fade">
      <BreweryForm
        v-if="step === 2 && user.account_type === 'Brewery'"
        class="col-start-5 col-end-9 w-full"
        :current-data="user"
        @handleSubmit="setAccountData"
      />
    </Transition>

    <Transition name="fade">
      <PrivateBreweryForm
        v-if="step === 2 && user.account_type === 'PrivateBrewery'"
        class="col-start-5 col-end-9 w-full"
        :current-data="user"
        @handleSubmit="setAccountData"
      />
    </Transition>

    <div
      v-if="errors.size > 0"
      class="col-start-5 col-end-9"
    >
      {{ errors }}
    </div>

    <div class="col-start-5 col-end-9 flex items-center space-x-4">
      <VButton
        v-if="step > 0"
        button-type="button"
        :primary="false"
        @click="handleClick(false)"
      >
        {{ $t('navigation.back') }}
      </VButton>
      <VButton
        button-type="button"
        @click="handleClick(true)"
      >
        {{ $t('navigation.continue') }}
      </VButton>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';
import AccountForm from '@/components/AccountForm.vue';
import UserForm from '@/components/UserForm.vue';
import VButton from '@/components/VButton.vue';
import Repository from '@/repositories/index';
import CustomerForm from '@/components/CustomerForm.vue';
import BreweryForm from '@/components/BreweryForm.vue';
import PrivateBreweryForm from '@/components/PrivateBreweryForm.vue';
import { useRouter } from 'vue-router';

const UserRepository = Repository.get('user');

export default {
  name: 'UsersLogin',
  components: {
    AccountForm,
    BreweryForm,
    CustomerForm,
    PrivateBreweryForm,
    UserForm,
    VButton,
  },
  setup() {
    const errors = ref({});
    const step = ref(0);
    const user = ref({});
    const router = useRouter();

    const setUser = (userData) => {
      user.value = userData;
    };

    const setAccountType = (accountType) => {
      user.value.account_type = accountType;
      user.value.account_attributes = { };
    };

    const setAccountData = (accountData) => {
      user.value.account_attributes = { ...accountData };
    };

    const registerUser = () => {
      UserRepository.register(user.value)
        .then(() => {
          router.push('/brewers-registration');
        })
        .catch((error) => {
          errors.value = error.response.data.errors.full_messages;
        });
    };

    const handleClick = (forward) => {
      if (forward && step.value <= 1) {
        step.value += 1;
        return;
      }

      if (!forward && step.value >= 1) {
        step.value -= 1;
        return;
      }

      if (forward && step.value === 2) {
        registerUser();
        return;
      }

      step.value = 0;
    };

    return {
      errors,
      step,
      registerUser,
      setUser,
      user,
      setAccountType,
      setAccountData,
      handleClick,
    };
  },
};
</script>

<style scoped>
.fade-enter-active {
  transition: all 0.3s ease-out;
}

.fade-enter-from {
  opacity: 0;
  transform: translateX(20px);
}

.fade-leave-active {
  opacity: 0;
}
</style>
