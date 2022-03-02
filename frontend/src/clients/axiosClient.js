import axios from 'axios';

const baseURL = `/api/v1`;

export default axios.create({
  baseURL,
});
