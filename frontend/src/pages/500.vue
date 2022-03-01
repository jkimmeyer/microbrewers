<template>
  <ErrorHint
    :error-code="500"
    :error-title="$t('navigation.serverError.title')"
    :error-description="$t('navigation.serverError.description')"
    error-route="/"
    :error-route-title="$t('navigation.root')"
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
