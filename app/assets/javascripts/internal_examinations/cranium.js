/* global LMML */

$(function () {
  if (document.getElementById('internal_cranium_examination') !== null) {
    LMML.loaders.internal_cranium_examination()
  }
})

LMML.loaders.internal_cranium_examination = function () {
  var model = 'internal_cranium_examination'
  LMML.loadVueModel(model)
}
