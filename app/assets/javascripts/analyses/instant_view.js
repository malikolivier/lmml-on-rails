/* global LMML */

$(function () {
  if (document.getElementById('analysis_instant_view') !== null) {
    LMML.loaders.analysis_instant_view()
  }
})

LMML.loaders.analysis_instant_view = function () {
  var model = 'analysis_instant_view'
  LMML.loadVueModel(model, {
    methods: {
      add_instant_view_drug_result:
        LMML.add_('instant_view_drug_result', model),
      delete_instant_view_drug_result:
        LMML.delete_('instant_view_drug_result', model)
    }
  })
}
