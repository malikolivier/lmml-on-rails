/* global LMML */

$(function () {
  if (document.getElementById('internal_intestines_examination') !== null) {
    LMML.loaders.internal_intestines_examination()
  }
})

LMML.loaders.internal_intestines_examination = function () {
  var model = 'internal_intestines_examination'
  LMML.loadVueModel(model)
}
