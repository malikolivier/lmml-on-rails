var LMML = LMML || {};

// Set headers for vue-resource HTTP requests
$(function() {
  Vue.http.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
});

LMML.loadVueModel = function(model, options = {}) {
  var data = {};
  var watch = {};
  var onChange = function onChange(newValue, oldValue) {
    this.updatePreview();
  }
  $('#new_' + model + ' input,select').each(function(index) {
    if (this.name.startsWith(model + '[') && this.name.endsWith(']')) {
      var field_name = this.name.substring(model.length + 1, this.name.length - 1);
      var names = field_name.split('][');
      var scoped_data = data;
      watch[names[0]] = {
        handler: onChange,
        deep: true
      };
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
  if (options.additionalProp) {
    options.additionalProp.forEach(function(prop) {
      data[prop] = null;
    })
  }

  var newModelVm = new Vue({
    el: '#new_' + model,
    data: data,
    watch: watch,
    methods: {
      updatePreview: _.debounce(
        function () {
          console.log("Updating " + model)
          this.$http.post('preview', {[model]: data}).then(function(response) {
            document.getElementById('preview').innerHTML = response.body;
          }, function(response) {
            console.error(response)
          });
        },
        500
      )
    }
  });
  newModelVm.updatePreview();
  window[model + 'Vm'] = function () {
    return newModelVm;
  }
  return newModelVm;
}
