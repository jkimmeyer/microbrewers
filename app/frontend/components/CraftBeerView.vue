<template>
  <div class="craft-beer">
    <div
      v-for="(value, key) in craftBeer"
      :key="key"
    >
      {{ key + ': ' + value }}
    </div>
  </div>
</template>

<script>
export default {
  props: {
    craftBeer: {
      type: Object,
      required: true,
    },
  },
};
</script>

<style scoped>
.craft-beer {
  padding: 10px;
}
</style>
