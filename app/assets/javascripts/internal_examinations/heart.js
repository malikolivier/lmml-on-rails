/* global LMML */

$(function () {
  if (document.getElementById('internal_heart_examination') !== null) {
    LMML.loaders.internal_heart_examination()
  }
})

LMML.loaders.internal_heart_examination = function () {
  var model = 'internal_heart_examination'
  LMML.loadVueModel(model)
}
