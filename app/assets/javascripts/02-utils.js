/* global LMML */

LMML.utils = {
  round: function (float, n = 2) {
    var precision = 10 ** n
    return Math.round(float * precision) / precision
  }
}
