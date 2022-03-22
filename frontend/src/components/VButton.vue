<template>
  <button
    class="py-2 px-8 rounded-2xl font-bold flex items-center justify-center space-x-2"
    :class="buttonClasses"
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
    primary: {
      type: Boolean,
      default: true,
    },
  },
  computed: {
    buttonClasses() {
      return this.primary ? 'bg-saffron' : 'border border-inset border-oxfordBlue';
    },
  },
};
</script>
