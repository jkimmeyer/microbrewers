<template>
  <li
    class="font-serif text-xl"
  >
    <router-link
      v-if="navigationLink"
      class="py-4"
      :to="navigationLink"
    >
      <slot>
        <span>{{ navigationText }}</span>
      </slot>
    </router-link>
    <button
      v-else
      class="py-4"
    >
      <slot>
        <span> {{ navigationText }}</span>
      </slot>
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
      default: null,
    },
  },
};
</script>
