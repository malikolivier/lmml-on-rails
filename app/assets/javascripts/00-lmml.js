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
  }
}
