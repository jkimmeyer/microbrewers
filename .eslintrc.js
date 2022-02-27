module.exports = {
  parser: 'vue-eslint-parser',
  parserOptions: {
    parser: '@babel/eslint-parser',
  },
  extends: [
    'airbnb-base',
    'plugin:vue/recommended',
  ],
  env: {
    browser: true,
  },
  rules: {
    'import/prefer-default-export': 'off', // Prefer named exports where possible
    'vue/multi-word-component-names': 'off', // Single word components are fine
  },
  settings: {
    'import/resolver': {
      alias: {
        map: [
          ['@', './app/frontend'],
        ],
      },
      node: {
        paths: ['./app/frontend'],
        extensions: ['.js', '.vue'],
      },
    },
  },
};
