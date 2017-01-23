/* global LMML */

$(function () {
  if (document.getElementById('external_anus_examination') !== null) {
    LMML.loaders.external_anus_examination()
  }
})

LMML.loaders.external_anus_examination = function () {
  var model = 'external_anus_examination'
  LMML.loadVueModel(model)
}
