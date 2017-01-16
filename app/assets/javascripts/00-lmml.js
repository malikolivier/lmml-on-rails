// Define global object for this app: LMML
var LMML = {
  vms: {},
  loaders: {},
  autopsy_id: function getAutopsyId () {
    return document.getElementById('autopsy_id').value
  },
  httpErrorHandler: function httpErrorHandler (model) {
    return function httpErrorHandler (response) {
      console.error(response)
      var errorElement = document.getElementById(model + '_errors')
      if (response.body.errors) {
        errorElement.innerHTML = response.body.errors
      } else {
        errorElement.innerHTML = response.body
      }
    }
  },
  models_url: function getModelUrl (model) {
    return `/autopsies/${LMML.autopsy_id()}/${model.pluralize()}`
  },
  add_: function addNestedModel (nestedModel, model, attributes = {}) {
    var nestedModelPlural = nestedModel.pluralize()
    return function () {
      new Promise((resolve, reject) => {
        if (this.id !== '') {
          resolve()
        } else {
          this.$http.post(LMML.models_url(model))
            .then(function (response) {
              this.id = response.body.model.id
              resolve()
            }, reject)
        }
      })
        .then(() => {
          var newAttributes = _.clone(attributes)
          newAttributes[`${model}_id`] = this.id
          return this.$http.post(`/${nestedModelPlural}`, newAttributes)
        })
        .then((response) => {
          this[`${nestedModelPlural}_attributes`].push(response.body)
        }, LMML.httpErrorHandler(model))
    }
  },
  delete_: function deleteNestedModel (nestedModel, model) {
    var nestedModelPlural = nestedModel.pluralize()
    return function (nestedModelVal) {
      this.$http.delete(`/${nestedModelPlural}/${nestedModelVal.id}`)
      .then(function (response) {
        var i = this[`${nestedModelPlural}_attributes`].findIndex(function (submodel) {
          return submodel.id === nestedModelVal.id
        })
        this[`${nestedModelPlural}_attributes`].splice(i, 1)
      }, LMML.httpErrorHandler(model))
    }
  }
}
