<template>
  <div class="flex justify-between">
    <div
      class="bg-white inline-flex py-2 px-2 rounded-xl text-2xl font-bold
               items-center space-x-2 border-oxfordBlue border-2"
    >
      <button
        :disabled="amount <= 0"
        class="disabled:opacity-25"
        @click="amount--"
      >
        <Icon
          icon="subtract"
          width="32"
          height="32"
        />
      </button>
      <input
        v-model="amount"
        class="pb-1 w-8 text-center cart-input"
        type="number"
        min="0"
        max="99"
      >
      <button
        :disabled="amount >= 99"
        class="disabled:opacity-25"
        @click="amount++"
      >
        <Icon
          icon="add"
          width="32"
          height="32"
        />
      </button>
    </div>
    <button
      class="p-2 bg-saffron rounded-xl ml-auto"
      @click="$emit('add-to-cart', amount)"
    >
      <Icon
        icon="cart"
        width="32"
        height="32"
      />
    </button>
  </div>
</template>

<script>
import Icon from '@/components/Icon.vue';

export default {
  components: {
    Icon,
  },
  data() {
    return {
      amount: 0,
    };
  },
};
</script>
<style scoped>
.cart-input::-webkit-outer-spin-button,
.cart-input::-webkit-inner-spin-button {
  appearance: none;
  margin: 0;
}

.cart-input[type='number'] {
  /* stylelint-disable-next-line property-no-vendor-prefix */
  -moz-appearance: textfield; /* Firefox */
}
</style>
