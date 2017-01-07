// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  if (document.getElementById('external_outline_examination') === null) return;

  var vm = LMML.loadVueModel('external_outline_examination', {
    update_url: 'external_outline_examinations',
    data: {
    },
    methods: {
      add_livor_mortis: function() {
        this.$http.post('/livor_mortis', {
          external_outline_examination_id: this.id
        }).then(function(response) {
          console.log(response);
        }, function(response) {
          console.error(response)
          var errorElement = document.getElementById('external_outline_examination_errors');
          if (response.body.errors)
            errorElement.innerHTML = response.body.errors;
          else
            errorElement.innerHTML = response.body;
        });
      }
    }
  });

})
