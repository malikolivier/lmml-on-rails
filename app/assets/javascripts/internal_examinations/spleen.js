/* global LMML */

$(function () {
  if (document.getElementById('internal_spleen_examination') !== null) {
    LMML.loaders.internal_spleen_examination()
  }
})

LMML.loaders.internal_spleen_examination = function () {
  var model = 'internal_spleen_examination'
  LMML.loadVueModel(model)
}
