/* global LMML */

$(function () {
  if (document.getElementById('internal_neck_organs_examination') !== null) {
    LMML.loaders.internal_neck_organs_examination()
  }
})

LMML.loaders.internal_neck_organs_examination = function () {
  var model = 'internal_neck_organs_examination'
  LMML.loadVueModel(model)
}
