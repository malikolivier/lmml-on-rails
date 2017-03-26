/* global LMML */

$(function () {
  if (document.getElementById('internal_pancreas_examination') !== null) {
    LMML.loaders.internal_pancreas_examination()
  }
})

LMML.loaders.internal_pancreas_examination = function () {
  var model = 'internal_pancreas_examination'
  LMML.loadVueModel(model)
}
