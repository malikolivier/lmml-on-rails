/* global LMML */

// Set headers for vue-resource HTTP requests
$(function () {
  Vue.http.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content')
})

LMML.loadVueModel = function loadVueModel (model, options = {}) {
  // IIFE GLOBAL VARIABLES
  var data = {}
  var watch = {}
  var elementId = options.deixis ? `${model}_${options.deixis}` : model
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
    $('#' + elementId + ' input,select').each(function () {
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
          var hasMultiData = this.getAttribute('deixis-data') !== null || this.getAttribute('multi-data') !== null
          if (anyArray !== -1 && !hasMultiData) {
            // Those fields are array container and should be ignored as the
            // watcher for the whole array will be defined hereafter
          } else if (arrayIndex === -1 || hasMultiData) {
            // Do not add watcher if the object is an ID, as an ID is not updatable.
            if (names[names.length - 1] !== 'id') {
              watch[joinedNames] = debounce(
                function onIndividualChange (newValue, oldValue) {
                  console.log(`Updating ${model}'s ${joinedNames} to: ${newValue}`)
                  var params = {}
                  var scopedParams = params
                  var scopedData = data
                  for (var i = -1; i < names.length - 1; i++) {
                    if (i > -1) {
                      scopedParams[names[i]] = {}
                      scopedParams = scopedParams[names[i]]
                      scopedData = scopedData[names[i]]
                    }
                    // Add ID so that rails update this record
                    if (scopedData.id) scopedParams.id = scopedData.id
                    // Add deixis if deixis is present (must be there for all parts with a right or left part)
                    if (scopedData.deixis) scopedParams.deixis = scopedData.deixis
                    // Add position if position is present (must be there for some parts like teeth)
                    if (scopedData.position) scopedParams.position = scopedData.position
                    // Add rank if rank is present (must be there for some parts like teeth)
                    if (scopedData.rank) scopedParams.rank = scopedData.rank
                    // Add category if category is present (must be there for some parts like heart chambers)
                    if (scopedData.category) scopedParams.category = scopedData.category
                  }
                  scopedParams[names[names.length - 1]] = newValue
                  this.$http[options.httpVerb](options.updateUrl, {[model]: params})
                  .then(function (response) {
                    var noId = _.isEmpty(scopedData.id)
                    if (noId) {
                      // Set ID of inner element from request (if not set)
                      var scopedResponseModel = response.body.model
                      for (var i = 0; i < names.length - 1; i++) {
                        var name = names[i]
                        var isLastNestedModel = i === names.length - 2
                        if (scopedData.hasOwnProperty('deixis') && isLastNestedModel) {
                          // Set right model for dual models
                          var changedDualIndex = scopedResponseModel.findIndex(function (rModel) {
                            return rModel.deixis === scopedData.deixis
                          })
                          name = '' + changedDualIndex
                        }
                        if (scopedData.hasOwnProperty('position') && scopedData.hasOwnProperty('rank') && isLastNestedModel) {
                          // Set right model for teeth
                          var changedToothIndex = scopedResponseModel.findIndex(function (rModel) {
                            return rModel.position === scopedData.position && rModel.rank === Number(scopedData.rank)
                          })
                          name = '' + changedToothIndex
                        }
                        // Remove attributes affix (not there in JSON output)
                        var match = name.match(/^(\w+)_attributes$/)
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
                    // Old value and new value do not work for arrays:
                    // https://forum-archive.vuejs.org/topic/4012/watch-array-mutations-newval-oldval-issue/3
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
                      }
                      if (!LMML.isEmpty(scopedVueModel.id)) {
                        scopedParams.id = scopedVueModel.id
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
    el: '#' + elementId,
    data,
    watch,
    methods
  })
  if (options.updateAll) newModelVm.updateAll()
  LMML.vms[model] = newModelVm
  return newModelVm
}
