/* global LMML */

// Set headers for vue-resource HTTP requests
$(function () {
  Vue.http.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content')
})

LMML.loadVueModel = function loadVueModel (model, options = {}) {
  // IIFE GLOBAL VARIABLES
  var data = {}
  var watch = {}
  if (!options.httpVerb) {
    options.httpVerb = 'put'
  }
  if (!options.updateUrl) {
    options.updateUrl = LMML.models_url(model)
  }

  // IIFE GLOBAL FUNCTIONS
  function debounce (func) {
    return _.debounce(func, 500)
  }

  // this should be resolved to Vue Model instance
  function updateHandler (response) {
    document.getElementById(model + '_preview').innerHTML = response.body.description
    this.id = response.body.model.id
    document.getElementById(model + '_errors').innerHTML = ''
  }
  function errorHandler (response) {
    LMML.httpErrorHandler(model)(response)
  }

  function loadFromDOM () {
    $('#' + model + ' input,select').each(function () {
      if (this.name && this.name.startsWith(model + '[') && this.name.endsWith(']')) {
        var fieldName = this.name.substring(model.length + 1, this.name.length - 1)
        var names = fieldName.split('][')
        var scopedData = data

        if (options.updateAll) {
          watch[names[0]] = {
            handler: function onChange (newValue, oldValue) {
              this.updateAll()
            },
            deep: true
          }
        } else {
          var joinedNames = names.join('.')
          var arrayIndex = names.findIndex(function (name) {
            return name.match(/^\w+\[[0-9]*]$/)
          })
          var anyArray = names.findIndex(function (name) {
            return name.match(/^[0-9]+$/)
          })
          if (anyArray !== -1 && this.getAttribute('deixis-data') === null) {
            // Those fields are array container and should be ignored as the
            // watcher for the whole array will be defined hereafter
          } else if (arrayIndex === -1 || this.getAttribute('deixis-data') !== null) {
            // Do not add watcher if the object is an ID, as an ID is not updatable.
            if (names[names.length - 1] !== 'id') {
              watch[joinedNames] = debounce(
                function onIndividualChange (newValue, oldValue) {
                  console.log(`Updating ${model}'s ${joinedNames} to: ${newValue}`)
                  var params = {}
                  var scopedParams = params
                  var scopedData = data
                  for (var i = 0; i < names.length - 1; i++) {
                    scopedParams[names[i]] = {}
                    scopedParams = scopedParams[names[i]]
                    scopedData = scopedData[names[i]]
                  }
                  scopedParams[names[names.length - 1]] = newValue
                  // Add ID so that rails update this record
                  if (scopedData.id) scopedParams.id = scopedData.id
                  // Add deixis if deixis is present (must be there for all parts with a right or left part)
                  if (scopedData.deixis) scopedParams.deixis = scopedData.deixis
                  this.$http[options.httpVerb](options.updateUrl, {[model]: params})
                  .then(function (response) {
                    if (scopedData.hasOwnProperty('deixis') && _.isEmpty(scopedData.id)) {
                      // Set ID of inner element from request (if not set)
                      var scopedResponseModel = response.body.model
                      for (var i = 0; i < names.length - 1; i++) {
                        var name = names[i]
                        if (i === names.length - 2) {
                          var changedModelIndex = scopedResponseModel.findIndex(function (rModel) {
                            return rModel.deixis === scopedData.deixis
                          })
                          name = '' + changedModelIndex
                        }
                        // Remove attributes affix (not there in JSON output)
                        var match = name.match(/(\w+)_attributes/)
                        if (match) {
                          name = match[1]
                        }
                        scopedResponseModel = scopedResponseModel[name]
                      }
                      scopedData.id = scopedResponseModel.id
                    }
                    updateHandler(response)
                  }, errorHandler)
                }
              )
            }
          } else {
            var arrayName = names[arrayIndex].match(/^(\w+)\[[0-9]*]$/)[1]
            arrayName = names.slice(0, arrayIndex).concat(arrayName).join('.')
            if (!watch[arrayName]) {
              watch[arrayName] = {
                handler: debounce(
                  function onArrayChange (newValue, oldValue) {
                    console.log(`Updating array ${arrayName}...`)
                    var params = { [model]: {} }
                    var scopedParams = params[model]
                    var scopedVueModel = this
                    arrayName.split('.').forEach(function buildParams (name, i, array) {
                      if (i === array.length - 1) {
                        scopedParams[name] = newValue
                      } else {
                        scopedParams[name] = {}
                        scopedParams = scopedParams[name]
                        scopedVueModel = scopedVueModel[name]
                        if (!_.isEmpty(scopedVueModel.id)) {
                          scopedParams.id = scopedVueModel.id
                        }
                      }
                    })
                    this.$http[options.httpVerb](options.updateUrl, params)
                    .then(updateHandler, errorHandler)
                  }
                ),
                deep: true
              }
            }
          }
        }
        for (var i = 0; i < names.length; i++) {
          var name = names[i]
          // Check if name is an array
          var arrayMatch = name.match(/^(\w+)\[([0-9]*)]$/)
          var index = null
          if (arrayMatch) {
            name = arrayMatch[1]
            index = arrayMatch[2]
            scopedData[name] = scopedData[name] || []
            scopedData = scopedData[name]
            name = index
            // edge case for empty array
            if (name === '') {
              continue
            }
          }
          if (i === names.length - 1) {
            if (this.type === 'checkbox') {
              scopedData[name] = this.checked
            } else {
              // Edge case for boolean/checkboxes
              if (this.value === 'false') {
                scopedData[name] = false
              } else if (this.value === 'true') {
                scopedData[name] = true
              } else {
                scopedData[name] = this.value
              }
            }
          } else {
            scopedData[name] = scopedData[name] || {}
            scopedData = scopedData[name]
          }
        }
      }
    })
  }

  // Start processing
  loadFromDOM()
  console.log(_.clone(watch))

  var methods = {
    updateAll: debounce(
      function () {
        console.log('Updating ' + model)
        this.$http[options.httpVerb](options.updateUrl, {[model]: data})
        .then(updateHandler, errorHandler)
      }
    )
  }
  if (options.data) {
    _.forOwn(options.data, function (value, key) {
      if (data[key] === undefined) data[key] = value
    })
  }
  if (options.methods) {
    _.forOwn(options.methods, function (value, key) {
      methods[key] = value
    })
  }

  var newModelVm = new Vue({
    el: '#' + model,
    data,
    watch,
    methods
  })
  if (options.updateAll) newModelVm.updateAll()
  LMML.vms[model] = newModelVm
  return newModelVm
}
