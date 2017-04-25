/* global LMML */

LMML.utils = {
  round (float, n = 2) {
    var precision = 10 ** n
    return Math.round(float * precision) / precision
  },
  railsifyObject (object) {
    var railsified = {}
    _.each(object, function (value, key) {
      if (value instanceof Object) {
        railsified[`${key}_attributes`] = railsifyObject(value)
      } else {
        railsified[key] = value
      }
    })
    return railsified
  }
}
