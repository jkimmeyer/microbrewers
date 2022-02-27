<template>
  <div>
    <router-link
      class="m-8"
      to="/craft_beers/new"
    >
      {{ $t('brewer.addCraftBeer') }}
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'Index',
};
</script>
