import _ from 'lodash';

export function removeEmpty(obj) {
  // eslint-disable-next-line no-unused-vars
  return Object.fromEntries(Object.entries(obj).filter(([_key, v]) => v != null && v !== ''));
}

export const camelize = (obj) => _.transform(obj, (acc, value, key, target) => {
  const camelKey = _.isArray(target) ? key : _.camelCase(key);

  acc[camelKey] = _.isObject(value) ? camelize(value) : value;
});
