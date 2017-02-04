/* global LMML */

$(function () {
  if (document.getElementById('internal_thoracic_aorta_examination') !== null) {
    LMML.loaders.internal_thoracic_aorta_examination()
  }
})

LMML.loaders.internal_thoracic_aorta_examination = function () {
  var model = 'internal_thoracic_aorta_examination'
  LMML.loadVueModel(model)
}
