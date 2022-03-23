<template>
  <div class="grid grid-cols-12 gap-4 py-4 border-b border-white w-full items-center">
    <div class="col-span-2 justify-self-center">
      <img
        class="text-center max-h-16"
        :src="craftBeer.craft_beer_image"
      >
    </div>

    <div class="col-span-3">
      <div class="leading-none">
        {{ craftBeerTypeName }}
      </div>
      <div class="text-4xl leading-none font-bold">
        {{ craftBeer.name }}
      </div>
      <div class="flex justify-between">
        <div class="text-xl">
          {{ craftBeer?.brewery }}
        </div>
      </div>
      <div v-if="crowdBrew">
        ETD: {{ estimatedDeliveryDate }}
      </div>
    </div>

    <div class="col-span-2 justify-self-center">
      <div
        v-if="crowdBrew"
        class="flex flex-col items-center justify-center"
      >
        <progress
          class="progress"
          :value="crowdBrew.amount * 0.8"
          :max="crowdBrew.amount"
        />

        <div>{{ crowdBrew.amount * 0.8 + ' von ' + crowdBrew.amount + ' Bieren' }}</div>
        <div>Produktion startet am: {{ producingAt }}</div>
        <div>CrowdBrew läuft bis: {{ crowdBrewUntil }}</div>
      </div>

      <div v-else>
        Kein aktives CrowdBrewing
      </div>
    </div>

    <div class="col-span-2 justify-self-center">
      <div
        v-if="crowdBrew"
        class="flex space-x-2"
      >
        <RouterLink to="/crowd_brews/new">
          {{ $t('crowdBrew.extend') }}
        </RouterLink>

        <RouterLink to="/crowd_brews/new">
          {{ $t('crowdBrew.abort') }}
        </RouterLink>
      </div>
      <RouterLink
        v-else
        to="/crowd_brews/new"
        class="p-2 cursor-pointer"
      >
        {{ $t('crowdBrew.start') }}
      </RouterLink>
    </div>

    <div class="col-span-1 justify-self-center" />

    <div class="col-span-1 justify-self-center">
      <div class="flex items-center space-x-2">
        <button
          :aria-label="$t('craftBeer.edit')"
          @click="$emit('editCraftBeer', index)"
        >
          <Icon
            icon="edit"
            height="24"
            width="24"
          />
        </button>

        <button
          :aria-label="$t('craftBeer.delete')"
          @click="$emit('deleteCraftBeer', index)"
        >
          <Icon
            icon="delete"
            height="24"
            width="24"
          />
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import Icon from '@/components/Icon.vue';
import { format } from 'date-fns';

export default {
  name: 'CraftBeerListView',
  components: {
    Icon,
  },
  props: {
    craftBeer: {
      type: Object,
      required: true,
    },
    craftBeerTypes: {
      type: Array,
      required: true,
    },
    crowdBrew: {
      type: Object,
      default: null,
    },
  },
  computed: {
    craftBeerTypeName() {
      return this.craftBeerTypes
        .find((craftBeerType) => craftBeerType.id === this.craftBeer.craft_beer_type_id)?.name;
    },
    estimatedDeliveryDate() {
      return format(this.crowdBrew?.estimatedDeliveryDate, 'dd/MM/yyyy');
    },
    producingAt() {
      return format(this.crowdBrew?.producingAt, 'dd/MM/yyyy');
    },
    crowdBrewUntil() {
      return format(this.crowdBrew?.crowdBrewUntil, 'dd/MM/yyyy');
    },
  },
};
</script>

<style scoped>
.progress[value]::-webkit-progress-bar {
  border-radius: 4px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.25) inset;
  background-color: rgb(255, 255, 255);
}

.progress[value]::-webkit-progress-value {
  border-radius: 4px;
  background-color: rgb(107, 212, 37);
}
</style>
