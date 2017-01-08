/* global LMML */

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  if (document.getElementById('external_outline_examination') !== null) {
    LMML.loaders.external_outline_examination()
  }
})

LMML.loaders.external_outline_examination = function() {
  LMML.loadVueModel('external_outline_examination', {
    updateUrl: 'external_outline_examinations',
    data: {
      livores_mortis_attributes: [] // Initialize value if not set
    },
    methods: {
      add_livor_mortis: function (event) {
        event.preventDefault()
        this.$http.post('/livores_mortis', {
          external_outline_examination_id: this.id
        }).then(function (response) {
          this.livores_mortis_attributes.push(response.body)
        }, function (response) {
          console.error(response)
          var errorElement = document.getElementById('external_outline_examination_errors')
          if (response.body.errors) {
            errorElement.innerHTML = response.body.errors
          } else {
            errorElement.innerHTML = response.body
          }
        })
      },
      delete_livor_mortis: function (livorMortis) {
        this.$http.delete(`/livores_mortis/${livorMortis.id}`)
        .then(function (response) {
          var i = this.livores_mortis_attributes.findIndex(function (livor) {
            return livor.id === livorMortis.id
          })
          this.livores_mortis_attributes.splice(i, 1)
        }, function (response) {
          console.error(response)
          var errorElement = document.getElementById('external_outline_examination_errors')
          if (response.body.errors) {
            errorElement.innerHTML = response.body.errors
          } else {
            errorElement.innerHTML = response.body
          }
        })
      }
    }
  })
}
