/* global LMML */

$(function () {
  var injuryApp = document.getElementById('injury_app')
  if (injuryApp !== null) {
    LMML.loaders.injury(injuryApp.getAttribute('data-injury-id'),
                        injuryApp.getAttribute('data-examination-type'))
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
