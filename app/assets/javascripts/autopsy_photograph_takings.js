/* global LMML */

$(function () {
  if (document.getElementById('autopsy_photograph_taking') !== null) {
    LMML.loaders.autopsy_photograph_taking()
  }
})

LMML.loaders.autopsy_photograph_taking = function () {
  var data = {
    autopsy_photograph_takings: [],
    errors: null
  }
  var vm = new Vue({
    el: '#autopsy_photograph_taking',
    data,
    computed: {
      frontTakings: function () {
        return this.autopsy_photograph_takings.filter(function (taking) {
          return taking.category === 'front'
        })
      },
      backTakings: function () {
        return this.autopsy_photograph_takings.filter(function (taking) {
          return taking.category === 'back'
        })
      },
      faceTakings: function () {
        return this.autopsy_photograph_takings.filter(function (taking) {
          return taking.category === 'face'
        })
      },
      otherTakings: function () {
        return this.autopsy_photograph_takings.filter(function (taking) {
          return taking.category === 'other'
        })
      },
    },
    methods: {
      reload: function () {
        this.$http.get(`/autopsies/${LMML.autopsy_id}/autopsy_photograph_takings`)
          .then(function (response) {
            console.log(response.body);
            this.autopsy_photograph_takings = response.body;
          }, function (errorResponse) {
            this.errors = JSON.stringify(errorResponse);
          });
      }
    }
  })
  vm.reload();
}
