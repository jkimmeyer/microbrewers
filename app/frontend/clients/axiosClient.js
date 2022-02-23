import axios from 'axios';

const baseDomain = 'http://localhost:3000';
const baseURL = `${baseDomain}/api/v1`; // Incase of /api/v1;

// ALL DEFUALT CONFIGURATION HERE

export default axios.create({
  baseURL,
  headers: {
    // "Authorization": "Bearer xxxxx"
  },
});
