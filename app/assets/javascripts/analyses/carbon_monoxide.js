/* global LMML */

$(function () {
  if (document.getElementById('analysis_carbon_monoxide') !== null) {
    LMML.loaders.analysis_carbon_monoxide()
  }
})

LMML.loaders.analysis_carbon_monoxide = function () {
  var model = 'analysis_carbon_monoxide'
  LMML.loadVueModel(model)
}
