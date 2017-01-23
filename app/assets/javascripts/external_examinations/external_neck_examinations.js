/* global LMML */

$(function () {
  if (document.getElementById('external_neck_examination') !== null) {
    LMML.loaders.external_neck_examination()
  }
})

LMML.loaders.external_neck_examination = function () {
  var model = 'external_neck_examination'
  LMML.loadVueModel(model)
}
