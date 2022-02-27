<template>
  <div class="bg-lavenderWeb h-screen">
    <Navigation />
    <slot />
  </div>
</template>
<script>
import Navigation from '@/components/Navigation.vue';

export default {
  name: 'LayoutDefault',
  components: { Navigation },
};
</script>
