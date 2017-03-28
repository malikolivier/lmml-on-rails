/* global LMML */

$(function () {
  if (document.getElementById('internal_back_examination') !== null) {
    LMML.loaders.internal_back_examination()
  }
})

LMML.loaders.internal_back_examination = function () {
  var model = 'internal_back_examination'
  LMML.loadVueModel(model)
}
