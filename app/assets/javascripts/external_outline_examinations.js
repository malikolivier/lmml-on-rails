// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  if (document.getElementById('external_outline_examination') === null) return;

  var autopsyVm = LMML.loadVueModel('external_outline_examination', {
    update_url: 'external_outline_examinations',
    data: {
    },
    methods: {
    }
  });

})
