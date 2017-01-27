/* global LMML */

$(function () {
  if (document.getElementById('internal_brain_examination') !== null) {
    LMML.loaders.internal_brain_examination()
  }
})

LMML.loaders.internal_brain_examination = function () {
  var model = 'internal_brain_examination'
  LMML.loadVueModel(model)
}
