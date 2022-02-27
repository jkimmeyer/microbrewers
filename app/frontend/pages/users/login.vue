<template>
  <div>
    <h1>{{ $t('user.login') }}</h1>
    <InputField
      :label="$t('user.email')"
      input-id="input-email"
    >
      <input
        id="input-email"
        type="email"
      >
    </InputField>

    <InputField
      :label="$t('user.password')"
      input-id="input-password"
    >
      <input
        id="input-password"
        type="password"
      >
    </InputField>
    <router-link to="/user/registration">
      {{ $t('user.registration') }}
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'UsersLogin',
};
</script>
