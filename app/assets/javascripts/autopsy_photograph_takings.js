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
      api: function () {
        return `/autopsies/${LMML.autopsy_id}/autopsy_photograph_takings`
      }
    },
    methods: {
      reload: function () {
        this.$http.get(this.api)
          .then(function (response) {
            this.autopsy_photograph_takings = response.body
          }, this._errorHandler)
      },
      _errorHandler: function (errorResponse) {
        this.errors = JSON.stringify(errorResponse)
      },
      onFileChange: function (category, event) {
        var files = event.target.files
        for (var file of files) {
          this._uploadPicture(category, file)
        }
      },
      _uploadPicture: function (category, file) {
        var formData = new window.FormData()
        formData.append('autopsy_photograph_taking[category]', category)
        formData.append('autopsy_photograph_taking[photograph_attributes][picture]', file)
        this.$http.post(this.api, formData)
          .then(function (response) {
            this.autopsy_photograph_takings.push(response.body)
          }, this._errorHandler)
      }
    }
  })
  vm.reload()
}
