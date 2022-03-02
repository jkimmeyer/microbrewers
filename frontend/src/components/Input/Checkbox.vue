<template>
  <div class="flex items-center mb-2">
    <slot class="mr-2" />

    <label
      class="block mr-2 text-lg"
      :for="inputId"
    >
      {{ label }}
    </label>
  </div>
</template>

<script>
export default {
  name: 'InputCheckbox',
  props: {
    label: {
      type: String,
      required: true,
    },
    inputId: {
      type: String,
      required: true,
    },
  },
};
</script>
