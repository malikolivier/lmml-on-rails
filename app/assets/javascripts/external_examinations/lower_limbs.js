/* global LMML */

$(function () {
  if (document.getElementById('external_lower_limbs_examination') !== null) {
    LMML.loaders.external_lower_limbs_examination()
  }
})

LMML.loaders.external_lower_limbs_examination = function () {
  var model = 'external_lower_limbs_examination'
  LMML.loadVueModel(model)
}
