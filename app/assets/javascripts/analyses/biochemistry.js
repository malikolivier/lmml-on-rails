/* global LMML */

$(function () {
  if (document.getElementById('analysis_biochemistry') !== null) {
    LMML.loaders.analysis_biochemistry()
  }
  var elements = document.getElementsByClassName('biochemical_analysis')
  LMML.vms.biochemical_analyses = {}
  for (var i = 0; i < elements.length; i++) {
    LMML.loaders.biochemical_analysis(elements[i])
  }
})

LMML.loaders.analysis_biochemistry = function () {
  var model = 'analysis_biochemistry'
  LMML.loadVueModel(model)
}

LMML.loaders.biochemical_analysis = function (element) {
  var model = 'analysis_biochemistry'
  var id = element.getAttribute('data-id')
  Vue.http.get(`/biochemical_analyses/${id}`)
  .then(function (response) {
    var data = response.body.biochemical_analysis
    data.biochemical_analysis_results_attributes = data.biochemical_analysis_results
    delete data.biochemical_analysis_results
    var updater = LMML.debounce(
      function onChange () {
        this.$http.put(`/biochemical_analyses/${id}`, {
          biochemical_analysis: data
        }, LMML.httpErrorHandler(model))
      }
    )
    LMML.vms.biochemical_analyses[id] = new Vue({
      el: element,
      data,
      watch: {
        contract_institution_id: updater,
        biochemical_analysis_type_id: updater,
        date: updater,
        biochemical_analysis_results_attributes: {
          deep: true,
          handler: updater
        }
      },
      methods: {
        add_biochemical_analysis_result () {
          this.$http.post('/biochemical_analysis_results', {
            biochemical_analysis_result: { biochemical_analysis_id: this.id }
          }).then(function (response) {
            this.biochemical_analysis_results_attributes.push(response.body)
          }, LMML.httpErrorHandler(model))
        },
        delete_biochemical_analysis_result (result) {
          this.$http.delete(`/biochemical_analysis_results/${result.id}`)
          .then(function () {
            var i = this.biochemical_analysis_results_attributes.findIndex(function (submodel) {
              return submodel.id === result.id
            })
            this.biochemical_analysis_results_attributes.splice(i, 1)
          }, LMML.httpErrorHandler(model))
        }
      }
    })
  })
}
