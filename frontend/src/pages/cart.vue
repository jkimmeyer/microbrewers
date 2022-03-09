<template>
  <div class="mt-32">
    <ul>
      <li>
        <div
          class="grid grid-cols-12 gap-4 py-4 border-b border-white w-full
          items-center justify-items-center"
        >
          <div class="col-span-7" />
          <div class="col-span-2 font-bold">
            Anzahl
          </div>
          <div class="col-span-1 font-bold">
            Einzelpreis
          </div>
          <div class="col-span-2 font-bold">
            Summe
          </div>
        </div>
      </li>
      <li
        v-for="(cartItem, index) in getCart()"
        :key="index"
      >
        <CartItemView
          :index="index"
          :cart-item="cartItem"
          @increase-quantity="increaseQuantity"
          @decrease-quantity="decreaseQuantity"
          @remove-from-cart="removeFromCart"
        />
      </li>
      <li>
        <div
          class="grid grid-cols-12 gap-4 py-8 border-white w-full
          items-center justify-items-center"
        >
          <div class="col-span-9" />
          <div class="col-span-1 font-bold" />
          <div class="col-span-2 font-bold">
            {{ calculateSum() }} €
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import { useCart } from '@/composables/useCart';
import CartItemView from '@/components/CartItemView.vue';

export default {
  name: 'Cart',
  components: {
    CartItemView,
  },
  setup() {
    const {
      getCart, removeFromCart, increaseQuantity, decreaseQuantity,
    } = useCart();

    const calculateSum = () => {
      let sum = 0;

      getCart().forEach((element) => {
        if (element.type === 'brewery') {
          sum += 19.95 * element.quantity;
        } else {
          sum += element.quantity * element.product.price;
        }
      });
      return sum;
    };

    return {
      calculateSum,
      getCart,
      removeFromCart,
      increaseQuantity,
      decreaseQuantity,
    };
  },
};
</script>
