<template>
  <div>
    <router-link
      class="text-limeGreen"
      to="/craft_beers/new"
    >
      {{ $t("brewer.create") }}
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'Dashboard',
};
</script>
