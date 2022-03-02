<template>
  <nav class="flex items-center justify-between mx-16">
    <h1 class="font-serif text-3xl">
      {{ $t('microbrewers') }}
    </h1>
    <ul class="flex items-center space-x-8">
      <NavigationItem
        :navigation-text="$t('navigation.shop')"
        navigation-link="/shop"
      />
      <NavigationItem
        :navigation-text="$t('navigation.brewers')"
        navigation-link="/brewers"
      />
      <NavigationItem
        :navigation-text="$t('navigation.login')"
        navigation-link="/login"
      />
      <NavigationItem
        :navigation-text="$t('navigation.registration')"
        navigation-link="/registration"
      />
    </ul>
  </nav>
</template>

<script>
import NavigationItem from '@/components/NavigationItem.vue';

export default {
  components: {
    NavigationItem,
  },
};
</script>
