<template>
  <div class="flex items-center mb-2">
    <slot class="input-radio mr-2 sr-only" />

    <label
      class="input-label border-oxfordBlue border bg-white block mr-2 px-4 py-2 text-lg rounded-lg"
      :for="inputId"
    >
      <div>
        <span class="font-medium">{{ label }}</span>
        <ul class="benefits">
          <li class="benefits--item">Verkaufe deine Biere regional!</li>
          <li class="benefits--item">Verwalte alles online.</li>
          <li class="benefits--item">Biete individuelle Support-Pakete an.</li>
          <li class="benefits--item">Wachse mit deiner Brauerei!</li>
        </ul>
      </div>
    </label>
  </div>
</template>

<script>
export default {
  name: 'InputRadio',
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

<style scoped>
.input-radio:checked + .input-label {
  @apply text-white bg-oxfordBlue;
}

.input-radio:hover + .input-label,
.input-radio:active + .input-label {
  @apply text-white bg-oxfordBlue;
}

.benefits--item::before {
  @apply text-limeGreen font-extrabold;
  content: '\\';
  display: inline;
  margin-right: 5px;
}
</style>
