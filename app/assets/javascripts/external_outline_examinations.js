/* global LMML */

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  if (document.getElementById('external_outline_examination') !== null) {
    LMML.loaders.external_outline_examination()
  }
})

LMML.loaders.external_outline_examination = function () {
  var model = 'external_outline_examination'
  LMML.loadVueModel(model, {
    methods: {
      add_livor_mortis: LMML.add_('livor_mortis', model),
      delete_livor_mortis: LMML.delete_('livor_mortis', model),
      add_rigor_mortis: LMML.add_('rigor_mortis', model, { joint: 'chin' }),
      delete_rigor_mortis: LMML.delete_('rigor_mortis', model)
    }
  })
}
