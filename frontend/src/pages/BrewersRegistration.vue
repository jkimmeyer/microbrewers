<template>
  <div class="flex justify-center mt-96 items-center font-serif">
    <div class="w-1/3">
      <div class="flex items-end space-x-16 mb-36">
        <div class="text-8xl text-saffron">
          <img
            src="@/assets/beers.svg"
            alt="Biere"
          >
        </div>
        <div>
          <h1 class="text-6xl mb-8 text-saffron">
            {{ $t('user.registrationSuccess') }}
          </h1>
          <p class="text-4xl">
            {{ $t('user.registrationFollowUp') }}
          </p>
        </div>
      </div>

      <router-link
        class="block text-center text-4xl text-limeGreen cursor-pointer"
        to="/users/login"
      >
        {{ $t('user.toLogin') }}
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'BrewersRegistration',
};
</script>
