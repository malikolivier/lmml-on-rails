var LMML = LMML || {};

// Set headers for vue-resource HTTP requests
$(function() {
  Vue.http.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
});

LMML.loadVueModel = function(model) {
  var data = {};
  var watch = {};
  var onChange = function onChange(newValue) {
    this.updatePreview();
  }
  $('#new_' + model + ' input').each(function(index) {
    var field_name = this.name.substring(model.length + 1, this.name.length - 1);
    data[field_name] = this.value;
    watch[field_name] = onChange;
  });
  var methods = {
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
  };

  var newModelVm = new Vue({
    el: '#new_' + model,
    data: data,
    watch: watch,
    methods: methods
  });
  newModelVm.updatePreview();
  window[model + 'Vm'] = function () {
    return newModelVm;
  }
  return newModelVm;
}
