/* global LMML */

$(function () {
  if (document.getElementById('internal_lungs_examination_left') !== null) {
    LMML.loaders.internal_lungs_examination()
  }
})

LMML.loaders.internal_lungs_examination = function () {
  var model = 'internal_lungs_examination'
  for (var deixis of ['left', 'right']) {
    LMML.loadVueModel(model, {
      methods: {
        add_foreign_fluid: LMML.add_('foreign_fluid', model),
        delete_foreign_fluid: LMML.delete_('foreign_fluid', model)
      },
      deixis
    })
  }
}
