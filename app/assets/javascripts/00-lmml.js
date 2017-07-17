// Define global object for this app: LMML
var LMML = {
  vms: {},
  loaders: {},
  get autopsy_id () {
    return document.getElementById('autopsy_id').value
  },
  isEmpty: function isLmmlObjectEmpty (object) {
    return object === null || object === '' || object === undefined
  },
  get locale () {
    var match = window.location.href.match(/locale=(\w+)/)
    if (match) {
      return match[1]
    } else {
      return ''
    }
  },
  debounce: function debounce (func) {
    return _.debounce(func, 500)
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
    return `/autopsies/${LMML.autopsy_id}/${model}?locale=${LMML.locale}`
  },
  add_: function addNestedModel (nestedModel, modelPath, attributes = {}) {
    var nestedModelPlural = LMML.pluralize(nestedModel)
    if (!_.isArray(modelPath)) {
      modelPath = [modelPath]
    }
    var model = modelPath[0]
    return function () {
      return new Promise((resolve, reject) => {
        if (this.id !== '') {
          resolve()
        } else {
          var params = {}
          if (!_.isEmpty(this.deixis)) {
            params.deixis = this.deixis
          }
          this.$http.post(LMML.models_url(model), params)
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
          var scopedVueModel = this
          for (var i = 1; i < modelPath.length; i++) {
            scopedVueModel = scopedVueModel[`${modelPath[i]}_attributes`]
            scopedVueModel.id = response.body[`${modelPath[i]}_id`]
          }
          scopedVueModel[`${nestedModelPlural}_attributes`].push(response.body)
        }, LMML.httpErrorHandler(model))
    }
  },
  delete_: function deleteNestedModel (nestedModel, modelPath) {
    var nestedModelPlural = LMML.pluralize(nestedModel)
    if (!_.isArray(modelPath)) {
      modelPath = [modelPath]
    }
    var model = modelPath[0]
    return function (nestedModelVal) {
      this.$http.delete(`/${nestedModelPlural}/${nestedModelVal.id}`)
      .then(function (response) {
        var scopedVueModel = this
        for (var j = 1; j < modelPath.length; j++) {
          scopedVueModel = scopedVueModel[`${modelPath[j]}_attributes`]
        }
        var i = scopedVueModel[`${nestedModelPlural}_attributes`].findIndex(function (submodel) {
          return submodel.id === nestedModelVal.id
        })
        scopedVueModel[`${nestedModelPlural}_attributes`].splice(i, 1)
      }, LMML.httpErrorHandler(model))
    }
  }
}
