/* global LMML */

$(function () {
  if (document.getElementById('external_face_examination') !== null) {
    LMML.loaders.external_face_examination()
  }
})

LMML.loaders.external_face_examination = function () {
  var model = 'external_face_examination'
  LMML.loadVueModel(model, {
    methods: {
      add_foreign_fluid: LMML.add_('foreign_fluid', model),
      delete_foreign_fluid: LMML.delete_('foreign_fluid', model)
    }
  })
}
