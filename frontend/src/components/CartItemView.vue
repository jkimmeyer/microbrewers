<template>
  <div class="grid grid-cols-12 gap-4 py-4 border-b border-white w-full items-center">
    <div class="col-span-2 justify-self-center">
      <img
        class="text-center max-h-16"
        :src="cartItem.type === 'brewery' ?
          cartItem.product.logo : cartItem.product.craft_beer_image"
      >
    </div>

    <div class="col-span-5">
      <div class="leading-none">
        {{ cartItem.type === 'brewery'
          ? 'Brauerei Support': cartItem.product?.craftBeerType || 'IPA' }}
      </div>
      <div class="text-4xl leading-none font-bold">
        {{ cartItem.product.name }}
      </div>
      <div class="flex justify-between">
        <div class="text-xl">
          {{ cartItem.product?.brewery }}
        </div>
      </div>
    </div>

    <div class="col-span-2 justify-self-center">
      <div class="flex items-center space-x-2">
        <button
          :aria-label="$t('cart.decrease')"
          @click="$emit('decrease-quantity', index)"
        >
          <Icon
            icon="subtract"
            height="24"
            width="24"
          />
        </button>

        <span>{{ cartItem.quantity }}</span>

        <button
          :aria-label="$t('cart.increase')"
          @click="$emit('increase-quantity', index)"
        >
          <Icon
            icon="add"
            height="24"
            width="24"
          />
        </button>
        <button
          :aria-label="$t('cart.remove')"
          @click="$emit('remove-from-cart', index)"
        >
          <Icon
            icon="delete"
            height="24"
            width="24"
          />
        </button>
      </div>
    </div>

    <div class="col-span-1 justify-self-center">
      {{ cartItem.product?.price || 19.95 }} €
    </div>

    <div class="col-span-2 justify-self-center">
      {{ cartItem.product?.price * cartItem.quantity || 19.95 * cartItem.quantity }} €
    </div>
  </div>
</template>

<script>
import Icon from '@/components/Icon.vue';

export default {
  components: {
    Icon,
  },
  props: {
    index: {
      type: Number,
      required: true,
    },
    cartItem: {
      type: Object,
      required: true,
    },
  },
};
</script>
