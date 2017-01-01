// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  var data = {
    number: null,
    suspect_name: null,
    victim_name: null
  }
  var newAutopsyVm = new Vue({
    el: '#new_autopsy',
    data: data,
    watch: {
      number: function (newNumber) {
        this.updatePreview()
      },
      suspect_name: function (newNumber) {
        this.updatePreview()
      }
    },
    methods: {
      updatePreview: _.debounce(
        function () {
          console.log("GA")
          this.$http.post('preview', {autopsy: data}).then(function(response) {
            document.getElementById('preview').innerHTML = response.body;
          }, function(response) {
            console.error(response)
          });
        },
        500
      )
    }
  })
  window.vm = function () {
    return newAutopsyVm
  }
})
