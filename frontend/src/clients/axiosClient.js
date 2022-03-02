import axios from 'axios';

const baseURL = import.meta.env.MODE === 'development' ? 'http://localhost:3000/api/v1' : '/api/v1';
const ACCESS_TOKEN_KEY = 'access-token';
const CLIENT_KEY = 'client';
const UID_KEY = 'uid';

const ACCESS_TOKEN = 'ACCESS_TOKEN';
const CLIENT = 'CLIENT';
const UID = 'UID';

const axiosClient = axios.create({
  baseURL,
});

// Add a request interceptor
axiosClient.interceptors.request.use((config) => {
  const updatedConfig = config;
  updatedConfig.headers[ACCESS_TOKEN_KEY] = window.localStorage.getItem(ACCESS_TOKEN);
  updatedConfig.headers[CLIENT_KEY] = window.localStorage.getItem(CLIENT);
  updatedConfig.headers[UID_KEY] = window.localStorage.getItem(UID);

  return updatedConfig;
});

// Add a response interceptor
axiosClient.interceptors.response.use((response) => {
  if (response.headers[ACCESS_TOKEN_KEY] !== null && response.headers[ACCESS_TOKEN_KEY] !== '' && response.headers[ACCESS_TOKEN_KEY] !== undefined) {
    window.localStorage.setItem(ACCESS_TOKEN, response.headers[ACCESS_TOKEN_KEY]);
    window.localStorage.setItem(CLIENT, response.headers[CLIENT_KEY]);
    window.localStorage.setItem(UID, response.headers[UID_KEY]);
  }

  return response;
});

export default axiosClient;
