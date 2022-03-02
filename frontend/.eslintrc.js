module.exports = {
  parser: 'vue-eslint-parser',
  parserOptions: {
    parser: '@babel/eslint-parser',
  },
  extends: [
    'airbnb-base',
    'plugin:vue/recommended',
    'plugin:cypress/recommended',

  ],
  plugins: [
    'cypress',
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
          ['@', './src'],
        ],
      },
      node: {
        paths: ['./src'],
        extensions: ['.js', '.vue'],
      },
    },
  },
};
