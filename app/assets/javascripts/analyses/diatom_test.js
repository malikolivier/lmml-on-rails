/* global LMML */

$(function () {
  if (document.getElementById('analysis_diatom_test') !== null) {
    LMML.loaders.analysis_diatom_test()
  }
})

LMML.loaders.analysis_diatom_test = function () {
  var model = 'analysis_diatom_test'
  LMML.loadVueModel(model)
}
