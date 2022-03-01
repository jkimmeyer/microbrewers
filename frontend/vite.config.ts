import vue from '@vitejs/plugin-vue';
import { defineConfig } from 'vite';
import path from 'path';

export default () => defineConfig({
  plugins: [
    vue(),
  ],
  define: {
    'process.env': process.env,
  },
  resolve: {
    alias: [{
      find: '@', replacement: path.resolve(__dirname, './src'),
    }],
  },
});
