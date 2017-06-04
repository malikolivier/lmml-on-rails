/* global LMML */

$(function () {
  if (document.getElementById('analysis_histopathology') !== null) {
    LMML.loaders.analysis_histopathology()
  }
})

LMML.loaders.analysis_histopathology = function () {
  var model = 'analysis_histopathology'
  LMML.loadVueModel(model, {
    methods: {
    }
  })
}
