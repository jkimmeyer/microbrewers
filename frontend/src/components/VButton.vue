<template>
  <button
    class="bg-saffron py-2 px-8 rounded-2xl font-bold flex items-center space-x-2"
    :type="buttonType"
  >
    <slot />
  </button>
</template>

<script>
export default {
  props: {
    buttonType: {
      type: String,
      required: true,
    },
  },
};
</script>
