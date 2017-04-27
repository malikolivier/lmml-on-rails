/* global LMML */

$(function () {
  var injuryApp = document.getElementById('injury_app')
  if (injuryApp !== null) {
    LMML.loaders.injury(injuryApp)
  }

  var injuriesApps = document.getElementsByClassName('injuries-form')
  for (var injuriesApp of injuriesApps) {
    LMML.loaders.injuries(injuriesApp)
  }
})

LMML.loaders.injury = function (injuryApp) {
  var id = injuryApp.getAttribute('data-injury-id')
  var examinationType = injuryApp.getAttribute('data-examination-type')
  var actionPromise = id
    ? Vue.http.get(`/injuries/${id}`) : Vue.http.post(injuryApp.getAttribute('data-url'))
  return Promise.all([
    LMML.components.loadInjuryComponents(),
    actionPromise
  ]).then(function (results) {
    return new Vue({
      el: injuryApp,
      data: {
        injury: LMML.utils.railsifyObject(results[1].body.injury),
        examination_type: examinationType
      },
      store: results[0]
    })
  })
}

LMML.loaders.injuries = function (injuriesApp) {
  return LMML.components.loadInjuryComponents()
    .then(function (store) {
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
          toggleInjuries () {
            this.toggled = !this.toggled
            if (!this.toggled) return
            this.$http.get(url).then(function (response) {
              this.injuries = response.body.injuries.map(function (injury) {
                return LMML.utils.railsifyObject(injury)
              })
              // Add a blank injury to start filling
              if (this.injuries.length === 0) {
                this.addInjury()
              }
            }, this._logError)
          },
          addInjury () {
            this.$http.post(url).then(function (response) {
              var raisified = LMML.utils.railsifyObject(response.body.injury)
              this.injuries.push(raisified)
            }, this._logError)
          },
          deleteInjury (injuryId) {
            this.$http.delete(`/injuries/${injuryId}`).then(function () {
              var indexToRemove = this.injuries.findIndex(function (injury) {
                return injury.id === injuryId
              })
              this.injuries.splice(indexToRemove, 1)
            }, this._logError)
          },
          _logError (errorResponse) {
            this.error = errorResponse
            console.error(errorResponse)
          }
        },
        computed: {
          styleObject () {
            return {
              display: this.toggled ? 'block' : 'none'
            }
          }
        },
        store
      })
    })
}
