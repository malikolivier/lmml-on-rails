/* global LMML */

$(function () {
  if (document.getElementById('external_back_examination') !== null) {
    LMML.loaders.external_back_examination()
  }
})

LMML.loaders.external_back_examination = function () {
  var model = 'external_back_examination'
  LMML.loadVueModel(model)
}
