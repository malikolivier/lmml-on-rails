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
  var updateUrl, httpVerb, updateAll
  if (actionNameElement !== null && actionNameElement.innerHTML === 'new') {
    updateUrl = `/api/autopsies/preview?locale=${LMML.locale}`
    httpVerb = 'post'
    updateAll = true
  } else {
    updateUrl = `/api/autopsies/${LMML.autopsy_id}?locale=${LMML.locale}`
    httpVerb = 'patch'
    updateAll = false
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
      switch_new_place () {
        this.new_place = !this.new_place
        if (!this.new_place) {
          this.place_attributes.name = ''
          this.place_attributes.address = ''
          this.place_attributes.autopsy_room = ''
        }
      },
      switch_new_police_inspector () {
        this.new_police_inspector = !this.new_police_inspector
        if (!this.new_police_inspector) {
          this.police_inspector_attributes.name = ''
        }
      },
      switch_new_judge () {
        this.new_judge = !this.new_judge
        if (!this.new_judge) {
          this.judge_attributes.name = ''
        }
      },
      switch_new_examiner () {
        this.new_examiner = !this.new_examiner
        if (!this.new_examiner) {
          this.examiner_attributes.name = ''
        }
      },
      add_participation: LMML.add_('participation', model),
      delete_participation: LMML.delete_('participation', model)
    }
  })
}
