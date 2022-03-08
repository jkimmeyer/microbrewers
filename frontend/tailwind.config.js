module.exports = {
  content: [
    './src/**/*.{vue,js,ts,jsx,tsx}',
  ],
  theme: {
    colors: {
      saffron: '#F8C630',
      limeGreen: '#6BD425',
      oxfordBlue: '#101935',
      lavenderWeb: '#EEEEFF',
      white: '#FFFFFF',
      black: '#000000',
    },
    fontFamily: {
      sans: ['Darker Grotesque', 'sans-serif'],
      serif: ['Supermercado One', 'serif'],
    },
    extend: {
      blur: {
        '4xl': '100px',
      },
      borderRadius: {
        '4xl': '48px',
      },
      height: {
        320: '320px',
      },
      width: {
        320: '320px',
      },
      maxWidth: {
        320: '320px',
      },
    },
  },
  plugins: [],
};
