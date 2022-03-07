<template>
  <div class="mb-2 w-full">
    <label
      class="block mr-2 text-lg"
      :for="inputId"
    >
      {{ label }}
    </label>
    <slot class="px-2 py-1 rounded-lg text-lg w-full" />
  </div>
</template>

<script>
export default {
  name: 'InputField',
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
