/* global LMML */

$(function () {
  if (document.getElementById('analysis_uropaper') !== null) {
    LMML.loaders.analysis_uropaper()
  }
})

LMML.loaders.analysis_uropaper = function () {
  var model = 'analysis_uropaper'
  LMML.loadVueModel(model)
}
