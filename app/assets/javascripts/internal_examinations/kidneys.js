/* global LMML */

$(function () {
  if (document.getElementById('internal_kidneys_examination_left') !== null) {
    LMML.loaders.internal_kidneys_examination()
  }
})

LMML.loaders.internal_kidneys_examination = function () {
  var model = 'internal_kidneys_examination'
  for (var deixis of ['left', 'right']) {
    LMML.loadVueModel(model, { deixis })
  }
}
