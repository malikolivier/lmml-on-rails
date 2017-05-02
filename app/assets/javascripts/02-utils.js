/* global LMML */

LMML.utils = {
  round (float, n = 2) {
    var precision = 10 ** n
    return Math.round(float * precision) / precision
  },
  railsifyObject (object) {
    var railsified = {}
    _.each(object, function (value, key) {
      if (value instanceof Array) {
        railsified[`${key}_attributes`] = value.map(function (element) {
          return LMML.utils.railsifyObject(element)
        })
      } else if (value instanceof Object) {
        railsified[`${key}_attributes`] = LMML.utils.railsifyObject(value)
      } else {
        railsified[key] = value
      }
    })
    return railsified
  }
}
