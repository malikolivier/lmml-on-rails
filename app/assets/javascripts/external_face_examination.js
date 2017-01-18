/* global LMML */

$(function () {
  if (document.getElementById('external_face_examination') !== null) {
    LMML.loaders.external_face_examination()
  }
})

LMML.loaders.external_face_examination = function () {
  var model = 'external_face_examination'
  LMML.loadVueModel(model)
}
