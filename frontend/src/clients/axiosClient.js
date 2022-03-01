import axios from 'axios';

const VUE_API_BASE_HOST = 'http://localhost:3000';
const baseURL = `${VUE_API_BASE_HOST}/api/v1`;

export default axios.create({
  baseURL,
});
