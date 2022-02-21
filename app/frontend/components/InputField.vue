<template>
  <div class="input-field">
    <label
      class="input-field--label"
      :for="inputId"
    >
      {{ label }}
    </label>
    <slot />
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

<style>
  .input-field {
    margin-bottom: 16px;
  }

  .input-field--label {
    margin-right: 10px;
  }
</style>
