<template>
  <div
    id="map"
    class="map rounded-3xl"
  />
</template>

<script>
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import { onMounted } from 'vue';

export default {
  setup() {
    onMounted(() => {
      mapboxgl.accessToken = 'pk.eyJ1IjoiamtpbW1leWVyIiwiYSI6ImNqYTQ1ODFhbmEwangzM3M0N3F5MnI2MzAifQ.Cioxdl3kozpPOKAL9vxMQA';
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/light-v9',
      });
      map.on('load', () => {
      // TODO: Here we want to load a layer
      // TODO: Here we want to load/setup the popup
      });
    });
    return {};
  },
};
</script>

<style>
.map {
  height: 800px;
}
</style>
