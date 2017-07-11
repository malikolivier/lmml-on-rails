/* global LMML */

$(function () {
  if (document.getElementById('analysis_ethanol') !== null) {
    LMML.loaders.analysis_ethanol()
  }
})

LMML.loaders.analysis_ethanol = function () {
  var model = 'analysis_ethanol'
  LMML.loadVueModel(model)
}
