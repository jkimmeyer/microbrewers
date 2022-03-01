<template>
  <ErrorHint
    :error-code="404"
    :error-title="$t('navigation.notFound.title')"
    :error-description="$t('navigation.notFound.description')"
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
