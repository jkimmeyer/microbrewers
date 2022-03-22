<template>
  <form @submit.prevent="$emit('handle-submit', accountType)">
    <InputRadio
      v-slot="slotProps"
      :label="$t('user.brewery')"
      input-id="brewery-radio"
    >
      <input
        id="brewery-radio"
        :class="slotProps.class"
        type="radio"
        name="account-type"
        value="Brewery"
        required
        :checked="accountType === 'Brewery'"
        @change="accountType = $event.target.value; $emit('handleSubmit', accountType);"
      >
    </InputRadio>

    <InputRadio
      v-slot="slotProps"
      :label="$t('user.customer')"
      input-id="customer-radio"
    >
      <input
        id="customer-radio"
        :class="slotProps.class"
        type="radio"
        name="account-type"
        value="Customer"
        required
        :checked="accountType === 'Customer'"
        @change="accountType = $event.target.value; $emit('handleSubmit', accountType);"
      >
    </InputRadio>

    <InputRadio
      v-slot="slotProps"
      :label="$t('user.privateBrewery')"
      input-id="private-brewery-radio"
    >
      <input
        id="private-brewery-radio"
        :class="slotProps.class"
        type="radio"
        name="account-type"
        value="PrivateBrewery"
        required
        :checked="accountType === 'PrivateBrewery'"
        @change="accountType = $event.target.value; $emit('handleSubmit', accountType);"
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
  props: {
    currentData: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      accountType: this.currentData?.accountType,
    };
  },
};
</script>
