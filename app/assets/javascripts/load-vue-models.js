var LMML = LMML || {};

// Set headers for vue-resource HTTP requests
$(function() {
  Vue.http.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
});

LMML.loadVueModel = function(model, options = {}) {
  if (!options.http_verb) {
    options.http_verb = 'put';
  }
  var data = {};
  var watch = {};
  $('#' + model + ' input,select').each(function(index) {
    if (this.name && this.name.startsWith(model + '[') && this.name.endsWith(']')) {
      var field_name = this.name.substring(model.length + 1, this.name.length - 1);
      var names = field_name.split('][');
      var scoped_data = data;

      if (options.update_all) {
        watch[names[0]] = {
          handler: function onChange(newValue, oldValue) {
            this.updateAll();
          },
          deep: true
        };
      } else {
        var joinedNames = names.join('.');
        var array_index = names.findIndex(function(name) {
          return name.match(/^(\w+)\[([0-9]+)\]$/);
        });
        if (array_index == -1) {
          watch[joinedNames] = _.debounce(
            function onIndividualChange(newValue, oldValue) {
              console.log(`Updating ${model}'s ${joinedNames} to: ${newValue}`);
              var params = {};
              var scopedParams = params;
              var scopedData = data;
              for (var i = 0; i < names.length - 1; i++) {
                scopedParams[names[i]] = {};
                scopedParams = scopedParams[names[i]];
                scopedData = scopedData[names[i]];
              }
              scopedParams[names[names.length - 1]] = newValue;
              // Add ID so that rails update this record
              if (scopedData.id) scopedParams.id = scopedData.id;
              this.$http[options.http_verb](options.update_url, {[model]: params})
              .then(function(response) {
                document.getElementById(model + '_preview').innerHTML = response.body;
                document.getElementById(model + '_errors').innerHTML = '';
              }, function(response) {
                console.error(response)
                var errorElement = document.getElementById(model + '_errors');
                if (response.body.errors)
                  errorElement.innerHTML = response.body.errors;
                else
                  errorElement.innerHTML = response.body;
              });
            },
            500
          )
        } else {
          var array_name = names[array_index].match(/^(\w+)\[[0-9]+\]$/)[1];
          if (!watch[array_name]) {
            watch[array_name] = {
              handler: _.debounce(
                function onArrayChange(newValue, oldValue) {
                  console.log(`Updating array ${array_name}...`);
                  this.$http[options.http_verb](options.update_url, {
                    [model]: {
                      [array_name]: newValue
                    }
                  }).then(function(response) {
                    document.getElementById(model + '_preview').innerHTML = response.body;
                    document.getElementById(model + '_errors').innerHTML = '';
                  }, function(response) {
                    console.error(response)
                    var errorElement = document.getElementById(model + '_errors');
                    if (response.body.errors)
                      errorElement.innerHTML = response.body.errors;
                    else
                      errorElement.innerHTML = response.body;
                  });
                },
                500
              ),
              deep: true
            };
          }
        }
      }
      for (var i = 0; i < names.length; i++) {
        var name = names[i];
        // Check if name is an array
        var array_match = name.match(/^(\w+)\[([0-9]+)\]$/);
        var index = null;
        if (array_match) {
          name = array_match[1];
          index = array_match[2];
          scoped_data[name] =  scoped_data[name] || [];
          scoped_data = scoped_data[name];
          name = index;
        }
        if (i === names.length - 1) {
          if (this.type == 'checkbox') {
            scoped_data[name] = this.checked;
          } else {
            scoped_data[name] = this.value;
          }
        } else {
          scoped_data[name] = scoped_data[name] || {};
          scoped_data = scoped_data[name];
        }
      }
    }
  });
  var methods = {
    updateAll: _.debounce(
      function () {
        console.log("Updating " + model)
        this.$http[options.http_verb](options.update_url, {[model]: data})
        .then(function(response) {
          document.getElementById(model + '_preview').innerHTML = response.body;
        }, function(response) {
          console.error(response)
          var errorElement = document.getElementById(model + '_errors');
          if (response.body.errors)
            errorElement.innerHTML = response.body.errors;
          else
            errorElement.innerHTML = response.body;
        });
      },
      500
    )
  };
  if (options.data) {
    _.forOwn(options.data, function(value, key) {
      if (data[key] === undefined) data[key] = value;
    });
  }
  if (options.methods) {
    _.forOwn(options.methods, function(value, key) {
      methods[key] = value;
    });
  }


  var newModelVm = new Vue({
    el: '#' + model,
    data,
    watch,
    methods
  });
  if (options.update_all) newModelVm.updateAll();
  window[model + 'Vm'] = function () {
    return newModelVm;
  }
  return newModelVm;
}
