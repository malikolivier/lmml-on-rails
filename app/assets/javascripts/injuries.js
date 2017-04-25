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
  return LMML.components.loadInjuryComponents()
    .then(function (store) {
      return new Vue({
        el: '#injury_app',
        store
      })
    })
}

LMML.loaders.external_head_examination_injuries = function () {
  var injuriesApp = document.getElementById('external_head_examination_injuries_app');
  return LMML.components.loadInjuryComponents()
    .then(function(store) {
      return new Vue({
        el: '#external_head_examination_injuries_app',
        data: {
          toggled: false,
          injuries: [],
          error: null,
          examination_type: 'external_head_examination'
        },
        methods: {
          toggleInjuries() {
            this.toggled = !this.toggled
            if (!this.toggled) return
            var url = injuriesApp.getAttribute('data-url')
            this.$http.get(url).then(function (response) {
              this.injuries = response.body.injuries
              setTimeout(function() {
                for (var i in this.$refs.injuryComponent) {
                  var injury = this.$refs.injuryComponent[i]
                  injury.setInjury(this.injuries[i])
                }
              }.bind(this))
            }, function(errorResponse) {
              this.error = errorResponse
            })
          }
        },
        store
    })
  })
}
