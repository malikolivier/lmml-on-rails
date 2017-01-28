/* global LMML */

$(function () {
  if (document.getElementById('internal_abdominal_wall_examination') !== null) {
    LMML.loaders.internal_abdominal_wall_examination()
  }
})

LMML.loaders.internal_abdominal_wall_examination = function () {
  var model = 'internal_abdominal_wall_examination'
  LMML.loadVueModel(model, {
    methods: {
      add_pleura_foreign_fluid: LMML.add_('pleura_foreign_fluid', model),
      delete_pleura_foreign_fluid: LMML.delete_('pleura_foreign_fluid', model),
      add_peritoneum_foreign_fluid: LMML.add_('peritoneum_foreign_fluid', model),
      delete_peritoneum_foreign_fluid: LMML.delete_('peritoneum_foreign_fluid', model)
    }
  })
}
