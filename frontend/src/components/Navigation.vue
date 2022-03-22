<template>
  <nav
    id="navigation"
    class="flex items-center justify-between mx-16"
  >
    <h1 class="font-serif text-3xl">
      <RouterLink
        to="/"
        class="flex items-center space-x-4"
      >
        <Logo />
        <span>{{ $t('microbrewers') }}</span>
      </RouterLink>
    </h1>
    <ul class="flex items-center space-x-8 py-2">
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
        class="pl-32"
        navigation-link="/cart"
        v-if="user?.account_type !== 'Brewery'"
        :aria-label="$t('navigation.cart')"
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

      <NavigationItem
        class="pl-32"
        navigation-link="/users/craft_beers"
        v-else
        :aria-label="$t('navigation.craftBeers')"
      >
        <div class="flex items-center flex-col">
          <Icon
            icon="beer"
            width="32"
            height="32"
          />
        </div>
      </NavigationItem>

      <NavigationItem
        v-if="loggedIn"
        navigation-link="/dashboard"
        :aria-label="$t('navigation.profile')"
      >
        <Icon
          icon="person"
          width="32"
          height="32"
        />
      </NavigationItem>
    </ul>
  </nav>
</template>

<script>
import Icon from '@/components/Icon.vue';
import Logo from '@/components/Logo.vue';
import NavigationItem from '@/components/NavigationItem.vue';
import { useAuth } from '@/composables/useAuth';
import { useRouter } from 'vue-router';
import { useCart } from '@/composables/useCart';

export default {
  components: {
    Icon,
    Logo,
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
