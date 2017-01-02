// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var autopsyVm = LMML.loadVueModel('autopsy', {
    data: {
      new_examiner: false
    }
  });

  /*
  // Scrap autocomplete for now (not a priority)
  autopsyVm.$http.get('/people?order_by=autopsies_examiner_count')
  .then(function(response) {
    this.examiner_autocomplete = response.body;
  });
  */
})
