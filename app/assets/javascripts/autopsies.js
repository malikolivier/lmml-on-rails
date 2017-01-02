// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var autopsyVm = LMML.loadVueModel('autopsy');

  Vue.http.get('/people?order_by=autopsies_examiner_count')
  .then(function(response) {
  })
})
