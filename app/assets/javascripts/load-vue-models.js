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
    if (this.name.startsWith(model + '[') && this.name.endsWith(']')) {
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
        watch[joinedNames] = _.debounce(
          function onIndividualChange(newValue, oldValue) {
            console.log(`Updating ${model}'s ${joinedNames} to: ${newValue}`);
            var params = {}
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
      }
      for (var i = 0; i < names.length; i++) {
        var name = names[i];
        if (i === names.length - 1) {
          scoped_data[name] = this.value;
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
      data[key] = value;
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
