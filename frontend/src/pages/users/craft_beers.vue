<template>
  <div>Index</div>
</template>
<script>
import Repository from '@/repositories/index';
import { useAuth } from '@/composables/useAuth';

const CraftBeerRepository = Repository.get('craftBeer');

export default {
  name: 'UsersCraftBeers',
  setup() {
    const { user } = useAuth();

    return { user };
  },
  mounted() {
    CraftBeerRepository.getCraftBeerByUser(this.user.id)
      .then((response) => {
        this.craftBeers = response.data;
      });
  },
};
</script>
