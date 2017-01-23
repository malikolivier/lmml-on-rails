/* global LMML */

$(function () {
  if (document.getElementById('external_genitalia_examination') !== null) {
    LMML.loaders.external_genitalia_examination()
  }
})

LMML.loaders.external_genitalia_examination = function () {
  var model = 'external_genitalia_examination'
  LMML.loadVueModel(model)
}
