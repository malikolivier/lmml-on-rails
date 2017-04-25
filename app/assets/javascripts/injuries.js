/* global LMML */

$(function () {
  var injuryApp = document.getElementById('injury_app')
  if (injuryApp !== null) {
    LMML.loaders.injury(injuryApp.getAttribute('data-injury-id'),
                        injuryApp.getAttribute('data-examination-type'))
  }


  if (document.getElementById('external_head_examination_injuries_app') !== null) {
    LMML.loaders.external_head_examination_injuries()
  }
})

LMML.loaders.injury = function (injuryId, examinationType) {
  return LMML.components.loadInjuryComponents(injuryId, examinationType)
    .then(function (store) {
      return new Vue({
        el: '#injury_app',
        store
      })
    })
}

LMML.loaders.external_head_examination_injuries = function () {
  var injuriesApp = document.getElementById('external_head_examination_injuries_app');
  return new Vue({
    el: '#external_head_examination_injuries_app',
    data: {
      toggled: true,
      injuries: [],
      error: null
    },
    methods: {
      editInjuries() {
        this.toggled = !this.toggled
        var url = injuriesApp.getAttribute('data-url')
        this.$http.get(url).then(function (response) {
          this.injuries = response.body.injuries
        }, function(errorResponse) {
          this.error = errorResponse
        })
      }
    }
  })
}
