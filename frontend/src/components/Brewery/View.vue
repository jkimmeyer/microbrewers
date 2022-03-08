<template>
  <div class="grid grid-cols-2 mx-32 items-center justify-center gap-8">
    <div class="col-span-1">
      <div class="w-64 m-auto">
        <img
          :src="breweryLogo"
        >
      </div>

      <h3 class="mb-2">
        <span class="block leading-none">{{ brewery.address.city }}</span>
        <span class="text-2xl font-bold block">{{ brewery.name }}</span>
      </h3>

      <VButton
        button-type="button"
        class="w-full"
        @click="$emit('support-brewery', brewery)"
      >
        Unterstützen
      </VButton>
      <RouterLink
        to="#"
        class="text-limeGreen block text-right"
      >
        Zu den Bieren
      </RouterLink>
    </div>

    <div class="col-span-1">
      {{ brewery.description }}
      <RouterLink
        to="#"
        class="text-limeGreen block text-right"
      >
        Mehr erfahren
      </RouterLink>
    </div>
  </div>
</template>

<script>
import VButton from '@/components/VButton.vue';

export default {
  components: {
    VButton,
  },
  props: {
    brewery: {
      type: Object,
      required: true,
    },
  },
  computed: {
    breweryLogo() {
      return this.brewery?.logo || new URL('../../assets/placeholder_logo.png', import.meta.url).href;
    },
  },
};
</script>
