<template>
  <nav
    id="navigation"
    class="flex items-center justify-between mx-16"
  >
    <h1 class="font-serif text-3xl">
      {{ $t('microbrewers') }}
    </h1>
    <ul class="flex items-center space-x-8">
      <NavigationItem
        :navigation-text="$t('navigation.craftBeers')"
        navigation-link="/craft_beers"
      />
      <NavigationItem
        :navigation-text="$t('navigation.brewers')"
        navigation-link="/breweries"
      />
      <template v-if="loggedIn">
        <NavigationItem
          :navigation-text="$t('navigation.logout')"
          @click="userLogout()"
        />
      </template>
      <template v-else>
        <NavigationItem
          :navigation-text="$t('navigation.login')"
          navigation-link="/users/login"
        />
      </template>
      <NavigationItem
        :navigation-text="$t('navigation.cart')"
        navigation-link="/cart"
      >
        <div class="flex items-center flex-col">
          <span
            class="w-4 h-4 text-sm rounded-full border-2 flex items-center justify-center"
          >{{ cartItemsAmount }}</span>
          <Icon
            icon="beer"
            width="32"
            height="32"
          />
        </div>
      </NavigationItem>
    </ul>
  </nav>
</template>

<script>
import Icon from '@/components/Icon.vue';
import NavigationItem from '@/components/NavigationItem.vue';
import { useAuth } from '@/composables/useAuth';
import { useRouter } from 'vue-router';
import { useCart } from '@/composables/useCart';

export default {
  components: {
    Icon,
    NavigationItem,
  },
  setup() {
    const { cartItemsAmount } = useCart();
    const { logout, user, loggedIn } = useAuth();
    const router = useRouter();

    const userLogout = () => {
      logout();
      router.push('/users/login');
    };
    return {
      cartItemsAmount,
      userLogout,
      user,
      loggedIn,
    };
  },
};
</script>
