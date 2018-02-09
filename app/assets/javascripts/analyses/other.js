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
      },
      placementOfLast () {
        return this.analysis_others.reduce(function (max, analysis) {
          return analysis.placement
        }, 0)
      }
    },
    methods: {
      reload () {
        this.$http.get(this.api)
          .then(function (response) {
            this.analysis_others = response.body
          }, this._errorHandler)
      },
      addAnalysis () {
        this.$http.post(this.api, {
          analysis_other: { placement: this.placementOfLast + 1 }
        }).then(this.reload, this._errorHandler)
      },
      save: LMML.debounce(function updateAnalysis (analysis) {
        vm.$http.patch(`/api/analysis_others/${analysis.id}`, {
          analysis_other: analysis
        }).then(function () {}, this._errorHandler)
      }),
      deleteAnalysis (analysis) {
        this.$http.delete(`/api/analysis_others/${analysis.id}`)
          .then(this.reload, this._errorHandler)
      },
      _errorHandler (errorResponse) {
        this.errors = errorResponse.body
      }
    }
  })
  vm.reload()
}
