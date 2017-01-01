// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  var model = 'autopsy';
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

  Vue.nextTick(function() {
    var newAutopsyVm = new Vue({
      el: '#new_autopsy',
      data: data,
      watch: watch,
      methods: methods
    });
    window.vm = function () {
      return newAutopsyVm
    }

  });
})
