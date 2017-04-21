/* global LMML */

$(function () {
  if (document.getElementById('injury_app') !== null) {
    LMML.loaders.injury()
  }
})

LMML.loaders.injury = function () {
  var injury = {
    time_sustained: '',
    injury_type: '',
    body_area_attributes: {
      id: null,
      body_reference_id: null,
      in_body_orientation_attributes: {
        coordinate_system: '',
        x: null,
        y: null,
        distance: null,
        angle: null
      }
    },
    injury_size_attributes: {
      shape: '',
      length: null,
      width: null,
      coordinate_system: '',
      angle: null
    },
    injury_depth_attributes: {
      depth: null,
      reached_organ_id: null
    }
  }
  /* eslint-disable no-new */
  new Vue({
    el: '#injury_app',
    data: injury
  })
}
