<template>
  <li
    class="font-serif text-xl"
  >
    <router-link
      v-if="navigationLink"
      :to="navigationLink"
    >
      {{ navigationText }}
    </router-link>
    <button v-else>
      {{ navigationText }}
    </button>
  </li>
</template>

<script>
export default {
  name: 'NavigationItem',
  props: {
    navigationLink: {
      type: String,
      default: null,
    },
    navigationText: {
      type: String,
      required: true,
    },
  },
};
</script>
