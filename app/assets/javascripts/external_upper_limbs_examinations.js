/* global LMML */

$(function () {
  if (document.getElementById('external_upper_limbs_examination') !== null) {
    LMML.loaders.external_upper_limbs_examination()
  }
})

LMML.loaders.external_upper_limbs_examination = function () {
  var model = 'external_upper_limbs_examination'
  LMML.loadVueModel(model)
}
