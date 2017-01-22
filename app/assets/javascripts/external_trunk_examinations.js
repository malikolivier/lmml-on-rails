/* global LMML */

$(function () {
  if (document.getElementById('external_trunk_examination') !== null) {
    LMML.loaders.external_trunk_examination()
  }
})

LMML.loaders.external_trunk_examination = function () {
  var model = 'external_trunk_examination'
  LMML.loadVueModel(model)
}
