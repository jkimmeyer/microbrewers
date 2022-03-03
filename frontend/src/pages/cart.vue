<template>
  <div>
    <ul>
      <li
        v-for="(cartItem, index) in getCart()"
        :key="index"
        class="flex items-center font-2xl"
      >
        <span>{{ index }}</span>
        <span>{{ cartItem.craftBeer?.name }}</span>
        <button @click="increaseQuantity(index)">
          <Icon
            icon="add"
            height="24"
            width="24"
            color="black"
          />
        </button>

        <span>{{ cartItem.quantity }}</span>

        <button @click="decreaseQuantity(index)">
          <Icon
            icon="subtract"
            height="24"
            width="24"
            color="black"
          />
        </button>

        <button @click="removeFromCart(index)">
          <Icon
            icon="delete"
            height="24"
            width="24"
            color="black"
          />
        </button>
      </li>
    </ul>
  </div>
</template>

<script>
import { useCart } from '@/composables/useCart';
import Icon from '@/components/Icon.vue';

export default {
  name: 'Cart',
  components: {
    Icon,
  },
  setup() {
    const {
      getCart, removeFromCart, increaseQuantity, decreaseQuantity,
    } = useCart();

    return {
      getCart,
      removeFromCart,
      increaseQuantity,
      decreaseQuantity,
    };
  },
};
</script>
