/* global LMML */

$(function () {
  if (document.getElementById('analysis_triage') !== null) {
    LMML.loaders.analysis_triage()
  }
})

LMML.loaders.analysis_triage = function () {
  var model = 'analysis_triage'
  LMML.loadVueModel(model, {
    methods: {
      add_triage_drug_result:
        LMML.add_('triage_drug_result', model),
      delete_triage_drug_result:
        LMML.delete_('triage_drug_result', model)
    }
  })
}
