<template>
  <div class="grid grid-cols-12 gap-4 py-4 border-b border-white w-full items-center">
    <div class="col-span-2 justify-self-center">
      <img
        class="text-center max-h-16"
        :src="craftBeer.craft_beer_image"
      >
    </div>

    <div class="col-span-5">
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
    </div>

    <div class="col-span-2 justify-self-center">
      <div class="flex items-center space-x-2" />
    </div>

    <div class="col-span-1 justify-self-center">
      {{ craftBeer.price }} €
    </div>

    <div class="col-span-2 justify-self-center" />
  </div>
</template>

<script>

export default {
  name: 'CraftBeerListView',
  props: {
    craftBeer: {
      type: Object,
      required: true,
    },
    craftBeerTypes: {
      type: Array,
      required: true,
    },
  },
  computed: {
    craftBeerTypeName() {
      return this.craftBeerTypes
        .find((craftBeerType) => craftBeerType.id === this.craftBeer.craft_beer_type_id)?.name;
    },
  },
};
</script>
