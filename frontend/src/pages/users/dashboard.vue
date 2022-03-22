<template>
  <div>
    <router-link
      v-if="user.account_type === 'Brewery'"
      class="text-limeGreen"
      to="/craft_beers/new"
    >
      {{ $t("brewery.create") }}
    </router-link>
  </div>
</template>

<script>
import { useAuth } from '@/composables/useAuth';

export default {
  name: 'Dashboard',
  setup() {
    const { user } = useAuth();
    return { user };
  },
};
</script>
