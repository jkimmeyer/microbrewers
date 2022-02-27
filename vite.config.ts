import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import RubyPlugin from 'vite-plugin-ruby';
import path from 'path';

export default defineConfig({
  plugins: [
    RubyPlugin(),
    vue(),
  ],
  resolve: {
    alias: [{
      find: '@', replacement: path.resolve(__dirname, './app/frontend'),
    }],
  },
});
