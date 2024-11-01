import { ref, computed } from 'vue';

const cart = ref([]);

const savedCart = JSON.parse(window.localStorage.getItem('CART'));

if (savedCart) {
  cart.value = savedCart;
}

export const useCart = () => {
  const addToCart = (product, quantity = 1, type = 'CraftBeer') => {
    const item = cart.value
      .filter((cartItem) => cartItem.type === type)
      .find((cartItem) => cartItem.product.id === product.id);

    if (item != null) {
      item.quantity += quantity;
    } else {
      cart.value.push({ type, product, quantity });
    }

    window.localStorage.setItem('CART', JSON.stringify(cart.value));
  };

  const cartItemsAmount = computed(() => cart.value.length);

  const removeFromCart = (cartItemId) => {
    cart.value.splice(cartItemId, 1);
    window.localStorage.setItem('CART', JSON.stringify(cart.value));
  };

  const increaseQuantity = (cartItemId) => {
    cart.value[cartItemId].quantity += 1;
    window.localStorage.setItem('CART', JSON.stringify(cart.value));
  };

  const decreaseQuantity = (cartItemId) => {
    if (cart.value[cartItemId].quantity === 1) return;
    cart.value[cartItemId].quantity -= 1;
    window.localStorage.setItem('CART', JSON.stringify(cart.value));
  };

  const setQuantity = (cartItemId, quantity) => {
    if (cart.value[cartItemId].quantity <= 1) return;
    cart.value[cartItemId].quantity = quantity;
    window.localStorage.setItem('CART', JSON.stringify(cart.value));
  };

  const getCart = () => cart.value;

  return {
    getCart,
    addToCart,
    removeFromCart,
    increaseQuantity,
    decreaseQuantity,
    setQuantity,
    cartItemsAmount,
  };
};
