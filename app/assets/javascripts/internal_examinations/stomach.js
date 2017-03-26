/* global LMML */

$(function () {
  if (document.getElementById('internal_stomach_examination') !== null) {
    LMML.loaders.internal_stomach_examination()
  }
})

LMML.loaders.internal_stomach_examination = function () {
  var model = 'internal_stomach_examination'
  LMML.loadVueModel(model)
}
