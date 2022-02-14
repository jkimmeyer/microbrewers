<template>
  <button @click="count++">Count is: {{ count }}</button>
</template>


<script>
export default {
  name: 'Index',
  data() {
    return {
      count: 0
    }
  }
}
</script>

<style scoped>
button {
  display: block;
}
</style>
