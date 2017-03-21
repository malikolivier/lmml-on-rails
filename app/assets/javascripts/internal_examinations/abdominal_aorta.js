/* global LMML */

$(function () {
  if (document.getElementById('internal_abdominal_aorta_examination') !== null) {
    LMML.loaders.internal_abdominal_aorta_examination()
  }
})

LMML.loaders.internal_abdominal_aorta_examination = function () {
  var model = 'internal_abdominal_aorta_examination'
  LMML.loadVueModel(model)
}
