export function removeEmpty(obj) {
  // eslint-disable-next-line no-unused-vars
  return Object.fromEntries(Object.entries(obj).filter(([_key, v]) => v != null && v !== ''));
}
