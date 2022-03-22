<template>
  <form @submit.prevent="$emit('handle-submit', accountType)">
    <InputRadio
      v-slot="slotProps"
      :label="$t('user.brewery')"
      input-id="brewery-radio"
    >
      <input
        id="brewery-radio"
        v-model="accountType"
        :class="slotProps.class"
        type="radio"
        name="account-type"
      >
    </InputRadio>

    <InputRadio
      v-slot="slotProps"
      :label="$t('user.customer')"
      input-id="customer-radio"
    >
      <input
        id="customer-radio"
        v-model="accountType"
        :class="slotProps.class"
        type="radio"
        name="account-type"
      >
    </InputRadio>

    <InputRadio
      v-slot="slotProps"
      :label="$t('user.privateBrewery')"
      input-id="private-brewery-radio"
    >
      <input
        id="private-brewery-radio"
        v-model="accountType"
        :class="slotProps.class"
        type="radio"
        name="account-type"
      >
    </InputRadio>
  </form>
</template>

<script>
import InputRadio from '@/components/Input/Radio.vue';

export default {
  components: {
    InputRadio,
  },
  data() {
    return {
      accountType: null,
    };
  },
};
</script>
