/* global LMML */

$(function () {
  if (document.getElementById('analysis_poisoning') !== null) {
    LMML.loaders.analysis_poisoning()
  }
})

LMML.loaders.analysis_poisoning = function () {
  var model = 'analysis_poisoning'
  LMML.loadVueModel(model, {
    methods: {
      add_found_poison: LMML.add_('found_poison', model),
      delete_found_poison: LMML.delete_('found_poison', model)
    }
  })
}
