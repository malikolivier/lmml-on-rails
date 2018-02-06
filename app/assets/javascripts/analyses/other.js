/* global LMML */

$(function () {
  if (document.getElementById('analysis_other') !== null) {
    LMML.loaders.analysis_other()
  }
})

LMML.loaders.analysis_other = function () {
  var data = {
    analysis_others: [],
    errors: null
  }
  var vm = new Vue({
    el: '#analysis_other',
    data,
    computed: {
      api () {
        return `/api/autopsies/${LMML.autopsy_id}/analysis_others`
      }
    },
    methods: {
      reload () {
        this.$http.get(this.api)
          .then(function (response) {
            this.analysis_others = response.body
          }, this._errorHandler)
      },
      _errorHandler (errorResponse) {
        this.errors = errorResponse.body
      }
    }
  })
  vm.reload()
}
