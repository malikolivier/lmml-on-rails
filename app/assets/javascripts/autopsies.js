// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var autopsyVm = LMML.loadVueModel('autopsy', {
    additionalProp: ['examiner_autocomplete']
  });

  autopsyVm.$http.get('/people?order_by=autopsies_examiner_count')
  .then(function(response) {
    this.examiner_autocomplete = response.body;
    $("#autopsy_examiner_name").select2();
  });
})
