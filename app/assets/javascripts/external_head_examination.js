/* global LMML */

$(function () {
  if (document.getElementById('external_head_examination') !== null) {
    LMML.loaders.external_head_examination()
  }
})

LMML.loaders.external_head_examination = function () {
  var model = 'external_head_examination'
  LMML.loadVueModel(model)
}
