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
      add_livor_mortis: function () {
        new Promise((resolve, reject) => {
          if (this.id !== '') {
            resolve()
          } else {
            this.$http.post(LMML.models_url(model))
            .then(function (response) {
              this.id = response.body.model.id
              resolve()
            }, reject)
          }
        })
        .then(() => {
          return this.$http.post('/livores_mortis', {
            external_outline_examination_id: this.id
          })
        })
        .then((response) => {
          this.livores_mortis_attributes.push(response.body)
        }, LMML.httpErrorHandler(model))
      },
      delete_livor_mortis: function (livorMortis) {
        this.$http.delete(`/livores_mortis/${livorMortis.id}`)
        .then(function (response) {
          var i = this.livores_mortis_attributes.findIndex(function (livor) {
            return livor.id === livorMortis.id
          })
          this.livores_mortis_attributes.splice(i, 1)
        }, LMML.httpErrorHandler(model))
      },
      add_rigor_mortis: function () {
        throw new Error('Not implemented')
      },
      delete_rigor_mortis: function (rigorMortis) {
        throw new Error('Not implemented')
      }
    }
  })
}
