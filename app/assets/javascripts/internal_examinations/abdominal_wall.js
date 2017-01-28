/* global LMML */

$(function () {
  if (document.getElementById('internal_abdominal_wall_examination') !== null) {
    LMML.loaders.internal_abdominal_wall_examination()
  }
})

LMML.loaders.internal_abdominal_wall_examination = function () {
  var model = 'internal_abdominal_wall_examination'
  LMML.loadVueModel(model)
}
