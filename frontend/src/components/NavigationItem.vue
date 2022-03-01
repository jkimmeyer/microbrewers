<template>
  <li
    class="font-serif text-xl"
  >
    <router-link :to="navigationLink">
      {{ navigationText }}
    </router-link>
  </li>
</template>

<script>
export default {
  name: 'NavigationItem',
  props: {
    navigationLink: {
      type: String,
      required: true,
    },
    navigationText: {
      type: String,
      required: true,
    },
  },
};
</script>
