/* global LMML */

$(function () {
  var injuryApp = document.getElementById('injury_app')
  if (injuryApp !== null) {
    LMML.loaders.injury(injuryApp.getAttribute('data-injury-id'),
                        injuryApp.getAttribute('data-examination-type'))
  }

  var injuriesApps = document.getElementsByClassName('injuries-form')
  for (var injuriesApp of injuriesApps) {
    LMML.loaders.injuries(injuriesApp)
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

LMML.loaders.injuries = function(injuriesApp) {
  return LMML.components.loadInjuryComponents()
    .then(function(store) {
      var url = injuriesApp.getAttribute('data-url')
      return new Vue({
        el: injuriesApp,
        data: {
          toggled: false,
          injuries: [],
          error: null,
          examination_type: injuriesApp.getAttribute('data-examination-type')
        },
        methods: {
          toggleInjuries() {
            this.toggled = !this.toggled
            if (!this.toggled) return
            this.$http.get(url).then(function (response) {
              this.injuries = response.body.injuries
            }, this._logError)
          },
          addInjury() {
            this.$http.post(url).then(function (response) {
              this.injuries.push(response.body.injury)
            }, this._logError)
          },
          _logError(errorResponse) {
            this.error = errorResponse
            console.error(errorResponse)
          }
        },
        store
      })
    })
}
