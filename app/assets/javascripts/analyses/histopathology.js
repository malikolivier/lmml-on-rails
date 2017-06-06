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
      add_analysis_histopathology_on_organ:
        LMML.add_('analysis_histopathology_on_organ', model),
      delete_analysis_histopathology_on_organ:
        LMML.delete_('analysis_histopathology_on_organ', model)
    }
  })
}
