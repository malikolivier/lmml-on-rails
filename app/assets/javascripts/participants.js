/* global LMML */

$(function () {
  if (document.getElementById('participants') !== null) {
    LMML.loaders.participants()
  }
})

LMML.loaders.participants = function () {
  var model = 'participants'
  LMML.loadVueModel(model)
}
