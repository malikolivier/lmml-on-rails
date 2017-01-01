// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {
  var data = {
    number: document.getElementById('autopsy_number').value,
    suspect_name: document.getElementById('autopsy_suspect_name').value,
    victim_name: document.getElementById('autopsy_victim_name').value,
    starting_time: document.getElementById('autopsy_starting_time').value
  }
  var newAutopsyVm = new Vue({
    el: '#new_autopsy',
    data: data,
    watch: {
      number: function (newNumber) {
        this.updatePreview()
      },
      suspect_name: function (newSuspectName) {
        this.updatePreview()
      },
      victim_name: function(newVictimName) {
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
