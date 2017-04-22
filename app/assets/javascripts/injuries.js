/* global LMML */

$(function () {
  if (document.getElementById('injury_app') !== null) {
    LMML.loaders.injury()
  }
})

LMML.loaders.injury = function () {
  function emitUpdate(attribute) {
    return function(newValue) {
      this.$emit('update', {
        id: this.id,
        [attribute]: newValue
      })
    }
  }

  var inBodyOrientation = {
    id: null,
    coordinate_system: '',
    x: null,
    y: null,
    distance: null,
    angle: null
  }

  Vue.component('in-body-orientation-component', {
    template: '#in_body_orientation_component',
    data: function () {
      return inBodyOrientation
    },
    methods: {
      recomputeXY: function () {
        if (this.angle !== null && this.distance !== null) {
          var radAngle = this.angle * Math.PI / 180
          this.x = LMML.utils.round(this.distance * Math.cos(radAngle))
          this.y = LMML.utils.round(this.distance * Math.sin(radAngle))
        }
      },
      recomputeDistanceAngle: function () {
        var angle
        if (this.x !== null && this.y !== null) {
          this.distance = LMML.utils.round(Math.sqrt(this.x ** 2 + this.y ** 2))
          if (this.x === 0 && this.y !== 0) {
            angle = Math.PI / 2
          } else {
            angle = Math.atan2(this.y, this.x)
          }
          if (this.y < 0) {
            angle -= Math.PI
          }
          this.angle = LMML.utils.round(angle / Math.PI * 180)
        }
      },
      updateCoordinateSystem: function () {
        this.$emit('coordinate-system-update', this.coordinate_system)
      }
    },
    watch: {
      coordinate_system: emitUpdate('coordinate_system'),
      x: emitUpdate('x'),
      y: emitUpdate('y')
    }
  })

  var injury = {
    id: null,
    time_sustained: '',
    injury_type: '',
    body_area_attributes: {
      id: null,
      body_reference_id: null
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
    },
    error: null
  }

  Vue.component('injury-component', {
    template: '#injury_component',
    data: function () {
      return injury
    },
    methods: {
      updateCoordinateSystem: function (newCoordinateSystem) {
        if (LMML.isEmpty(this.injury_size_attributes.coordinate_system)) {
          this.injury_size_attributes.coordinate_system = newCoordinateSystem
        }
      },
      saveBodyOrientation: function (attributes) {
        this._save({
          injury: {
            body_area_attributes: {
              id: this.body_area_attributes.id,
              in_body_orientation_attributes: attributes
            }
          }
        })
      },
      _save: function (object) {
        var url
        if (LMML.isEmpty(this.id)) {
          url = document.getElementById('injury_app').getAttribute('url')
          this.$http.post(url, object).then(this._setIds, this._logError)
        } else {
          url = `/injuries/${this.id}`
          this.$http.patch(url, object).then(this._setIds, this._logError)
        }
      },
      _setIds: function (response) {
        var injury = response.body.injury
        this.id = injury.id
        this.body_area_attributes.id = injury.body_area_id
        inBodyOrientation.id = injury.body_area && injury.body_area.in_body_orientation_id
        this.injury_size_attributes.id = injury.injury_size_id
        this.injury_depth_attributes.id = injury.injury_depth_id
        console.log('Update success!!')
      },
      _logError: function (errorResponse) {
        this.error = errorResponse
      }
    }
  })

  var data = {}
  /* eslint-disable no-new */
  new Vue({
    el: '#injury_app',
    data
  })
}
