/* global LMML */

$(function () {
  if (document.getElementById('internal_liver_examination') !== null) {
    LMML.loaders.internal_liver_examination()
  }
})

LMML.loaders.internal_liver_examination = function () {
  var model = 'internal_liver_examination'
  LMML.loadVueModel(model)
}
