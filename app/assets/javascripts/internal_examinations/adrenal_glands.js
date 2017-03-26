/* global LMML */

$(function () {
  if (document.getElementById('internal_adrenal_glands_examination_left') !== null) {
    LMML.loaders.internal_adrenal_glands_examination()
  }
})

LMML.loaders.internal_adrenal_glands_examination = function () {
  var model = 'internal_adrenal_glands_examination'
  for (var deixis of ['left', 'right']) {
    LMML.loadVueModel(model, { deixis })
  }
}
