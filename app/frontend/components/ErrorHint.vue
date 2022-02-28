<template>
  <div class="flex justify-center mt-96 items-center font-serif">
    <div class="w-1/3">
      <div class="flex items-end space-x-16 mb-36">
        <div class="text-8xl text-saffron">
          {{ errorCode }}
        </div>
        <div>
          <h1 class="text-6xl mb-8 text-saffron">
            {{ errorTitle }}
          </h1>
          <p class="text-4xl">
            {{ errorDescription }}
          </p>
        </div>
      </div>

      <router-link
        class="block text-center text-4xl text-limeGreen cursor-pointer"
        :to="errorRoute"
      >
        {{ errorRouteTitle }}
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ErrorHint',
  props: {
    errorCode: {
      type: Number,
      required: true,
    },
    errorTitle: {
      type: String,
      required: true,
    },
    errorDescription: {
      type: String,
      required: true,
    },
    errorRoute: {
      type: String,
      required: true,
    },
    errorRouteTitle: {
      type: String,
      required: true,
    },
  },
};
</script>
