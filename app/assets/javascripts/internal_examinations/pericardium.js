/* global LMML */

$(function () {
  if (document.getElementById('internal_pericardium_examination') !== null) {
    LMML.loaders.internal_pericardium_examination()
  }
})

LMML.loaders.internal_pericardium_examination = function () {
  var model = 'internal_pericardium_examination'
  LMML.loadVueModel(model)
}
