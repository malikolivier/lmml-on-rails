/* global LMML */

// Set headers for vue-resource HTTP requests
$(function () {
  Vue.http.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content')
})

LMML.loadVueModel = function (model, options = {}) {
  if (!options.httpVerb) {
    options.httpVerb = 'put'
  }
  var data = {}
  var watch = {}
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
          return name.match(/^(\w+)\[([0-9]*)]$/)
        })
        if (arrayIndex === -1) {
          // Do not add watcher if the object is an ID, as an ID is not updatable
          if (names[names.length - 1] !== 'id') {
            watch[joinedNames] = _.debounce(
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
                this.$http[options.httpVerb](options.updateUrl, {[model]: params})
                .then(function (response) {
                  document.getElementById(model + '_preview').innerHTML = response.body.description
                  this.id = response.body.model.id
                  document.getElementById(model + '_errors').innerHTML = ''
                }, function (response) {
                  console.error(response)
                  var errorElement = document.getElementById(model + '_errors')
                  if (response.body.errors) {
                    errorElement.innerHTML = response.body.errors
                  } else { errorElement.innerHTML = response.body }
                })
              },
              500
            )
          }
        } else {
          var arrayName = names[arrayIndex].match(/^(\w+)\[[0-9]*]$/)[1]
          if (!watch[arrayName]) {
            watch[arrayName] = {
              handler: _.debounce(
                function onArrayChange (newValue, oldValue) {
                  console.log(`Updating array ${arrayName}...`)
                  this.$http[options.httpVerb](options.updateUrl, {
                    [model]: {
                      [arrayName]: newValue
                    }
                  }).then(function (response) {
                    document.getElementById(model + '_preview').innerHTML = response.body.description
                    this.id = response.body.model.id
                    document.getElementById(model + '_errors').innerHTML = ''
                  }, function (response) {
                    console.error(response)
                    var errorElement = document.getElementById(model + '_errors')
                    if (response.body.errors) { errorElement.innerHTML = response.body.errors } else {
                      errorElement.innerHTML = response.body
                    }
                  })
                },
                500
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
            scopedData[name] = this.value
          }
        } else {
          scopedData[name] = scopedData[name] || {}
          scopedData = scopedData[name]
        }
      }
    }
  })
  var methods = {
    updateAll: _.debounce(
      function () {
        console.log('Updating ' + model)
        this.$http[options.httpVerb](options.updateUrl, {[model]: data})
        .then(function (response) {
          document.getElementById(model + '_preview').innerHTML = response.body
        }, function (response) {
          console.error(response)
          var errorElement = document.getElementById(model + '_errors')
          if (response.body.errors) {
            errorElement.innerHTML = response.body.errors
          } else {
            errorElement.innerHTML = response.body
          }
        })
      },
      500
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
