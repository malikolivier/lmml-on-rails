/* global LMML */

$(function () {
  if (document.getElementById('internal_genitalia_examination') !== null) {
    LMML.loaders.internal_genitalia_examination()
  }
})

LMML.loaders.internal_genitalia_examination = function () {
  var model = 'internal_genitalia_examination'
  LMML.loadVueModel(model)
}
