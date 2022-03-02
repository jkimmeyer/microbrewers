<template>
  <ErrorHint
    :error-code="401"
    :error-title="$t('navigation.unauthorized.title')"
    :error-description="$t('navigation.unauthorized.description')"
    error-route="/users/login"
    :error-route-title="$t('navigation.login')"
  />
</template>

<script>
import ErrorHint from '@/components/ErrorHint.vue';

export default {
  name: 'NotFound',
  components: {
    ErrorHint,
  },
};
</script>
