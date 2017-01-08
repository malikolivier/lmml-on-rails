/* global LMML */

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  if (document.getElementById('autopsy') !== null) {
    LMML.loaders.autopsy();
  }
})

LMML.loaders.autopsy = function() {
  var actionNameElement = document.getElementById('autopsy_action_name')
  var updateUrl, httpVerb, updateAll
  if (actionNameElement !== null && actionNameElement.innerHTML === 'new') {
    updateUrl = '/autopsies/preview'
    httpVerb = 'post'
    updateAll = true
  } else {
    updateUrl = 'update'
    httpVerb = 'put'
    updateAll = false
    LMML.setup_navbar()
  }
  LMML.loadVueModel('autopsy', {
    updateUrl,
    httpVerb,
    updateAll,
    data: {
      new_place: false,
      new_examiner: false,
      new_judge: false,
      new_police_inspector: false
    },
    methods: {
      switch_new_place: function () {
        this.new_place = !this.new_place
        if (!this.new_place) {
          this.place_attributes.name = ''
          this.place_attributes.address = ''
          this.place_attributes.autopsy_room = ''
        }
      },
      switch_new_police_inspector: function () {
        this.new_police_inspector = !this.new_police_inspector
        if (!this.new_police_inspector) {
          this.police_inspector_attributes.name = ''
        }
      },
      switch_new_judge: function () {
        this.new_judge = !this.new_judge
        if (!this.new_judge) {
          this.judge_attributes.name = ''
        }
      },
      switch_new_examiner: function () {
        this.new_examiner = !this.new_examiner
        if (!this.new_examiner) {
          this.examiner_attributes.name = ''
        }
      }
    }
  })

  /*
  // Scrap autocomplete for now (not a priority)
  autopsyVm.$http.get('/people?order_by=autopsies_examiners_count')
  .then(function(response) {
    this.examiner_autocomplete = response.body;
  });
  */
}
