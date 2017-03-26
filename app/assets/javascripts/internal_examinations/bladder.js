/* global LMML */

$(function () {
  if (document.getElementById('internal_bladder_examination') !== null) {
    LMML.loaders.internal_bladder_examination()
  }
})

LMML.loaders.internal_bladder_examination = function () {
  var model = 'internal_bladder_examination'
  LMML.loadVueModel(model)
}
