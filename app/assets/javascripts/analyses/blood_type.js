/* global LMML */

$(function () {
  if (document.getElementById('analysis_blood_type') !== null) {
    LMML.loaders.analysis_blood_type()
  }
})

LMML.loaders.analysis_blood_type = function () {
  var model = 'analysis_blood_type'
  LMML.loadVueModel(model, {
    methods: {
      updateConclusion () {
        if (this.anti_a === 'positive' && this.anti_b === 'positive') {
          this.blood_type = 'AB'
        } else if (this.anti_a === 'positive' && this.anti_b === 'negative') {
          this.blood_type = 'A'
        } else if (this.anti_a === 'negative' && this.anti_b === 'positive') {
          this.blood_type = 'B'
        } else if (this.anti_a === 'negative' && this.anti_b === 'negative') {
          this.blood_type = 'O'
        }
      }
    }
  })
}
