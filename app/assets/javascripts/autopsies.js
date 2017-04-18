/* global LMML */

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  if (document.getElementById('autopsy') !== null) {
    LMML.loaders.autopsy()
  }
})

LMML.loaders.autopsy = function () {
  var model = 'autopsy'
  var actionNameElement = document.getElementById('autopsy_action_name')
  var updateUrl, httpVerb, updateAll, addParticipation, deleteParticipation,
      onVueReady
  if (actionNameElement !== null && actionNameElement.innerHTML === 'new') {
    updateUrl = `/autopsies/preview?locale=${LMML.locale}`
    httpVerb = 'post'
    updateAll = true
    addParticipation = function addParticipationWithoutServerUpdate () {
      this.participations_attributes.push({
        role: null,
        person_id: null
      })
    }
    deleteParticipation = function deleteParticipWithoutServer (participation) {
      var i = this.participations_attributes.findIndex(function (submodel) {
        return submodel.role === participation.role &&
          submodel.person_id === participation.person_id
      })
      this.participations_attributes.splice(i, 1)
    }
    onVueReady = function removeArrayEmptyAttribute() {
      console.log('VueJS READY!')
      var elem = document.getElementById('autopsy_participations_attributes[]')
      elem.parentNode.removeChild(elem);
    }
  } else {
    updateUrl = `/autopsies/${LMML.autopsy_id}?locale=${LMML.locale}`
    httpVerb = 'patch'
    updateAll = false
    addParticipation = LMML.add_('participation', model)
    deleteParticipation = LMML.delete_('participation', model)
    onVueReady = function doNothing() {}
  }
  LMML.loadVueModel(model, {
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
      },
      add_participation: addParticipation,
      delete_participation: deleteParticipation
    },
    mounted: onVueReady
  })

  /*
  // Scrap autocomplete for now (not a priority)
  autopsyVm.$http.get('/people?order_by=autopsies_examiners_count')
  .then(function(response) {
    this.examiner_autocomplete = response.body;
  });
  */
}
