/* global LMML */

$(function () {
  var injuryApp = document.getElementById('injury_app')
  if (injuryApp !== null) {
    LMML.loaders.injury(injuryApp.getAttribute('data-injury-id'),
                        injuryApp.getAttribute('data-examination-type'))
  }
})

LMML.loaders.injury = function (injuryId, examinationType) {
  var defaultInjury = {
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
    }
  }

  function railsifyObject(object) {
    var railsified = {}
    _.each(object, function(value, key) {
      if (value instanceof Object) {
        railsified[`${key}_attributes`] = railsifyObject(value)
      } else {
        railsified[key] = value
      }
    });
    return railsified
  }

  var injuryPromise
  if (injuryId) {
    injuryPromise = Vue.http.get(`/injuries/${injuryId}`)
      .then(function(response) {
        var injury = railsifyObject(response.body.injury)
        return injury
      }, function(errorResponse) {
        return { error: errorResponse }
      })
  } else {
    injuryPromise = Promise.resolve(defaultInjury)
  }
  Promise.all([injuryPromise, LMML.stores.injuryStore]).then(function(results) {
    var injury = results[0]
    var store = results[1]
    var inBodyOrientation

    if (!injury.error) injury.error = null
    if (!injury.body_area_attributes) {
      injury.body_area_attributes = defaultInjury.body_area_attributes
    }
    if (!injury.injury_size_attributes) {
      injury.injury_size_attributes = defaultInjury.injury_size_attributes
    }
    if (!injury.injury_depth_attributes) {
      injury.injury_depth_attributes = defaultInjury.injury_depth_attributes
    }
    if (injury.body_area_attributes.in_body_orientation_attributes) {
      inBodyOrientation = injury.body_area_attributes.in_body_orientation_attributes
      delete injury.body_area_attributes.in_body_orientation_attributes
    } else {
      inBodyOrientation = {
        id: null,
        coordinate_system: '',
        x: null,
        y: null
      }
    }
    _.extend(inBodyOrientation, {
      distance: null,
      angle: null
    })

    function emitUpdate(attribute) {
      return LMML.debounce(function(newValue) {
        this.$emit('update', {
          id: this.id,
          [attribute]: newValue
        })
      })
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

    function saveInjury() {
      return LMML.debounce(function() { this._save({ injury }) })
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
            url = document.getElementById('injury_app').getAttribute('data-url')
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
      },
      watch: {
        time_sustained: saveInjury(),
        injury_type: saveInjury(),
        'body_area_attributes.body_reference_id': saveInjury(),
        'injury_size_attributes.shape': saveInjury(),
        'injury_size_attributes.length': saveInjury(),
        'injury_size_attributes.width': saveInjury(),
        'injury_size_attributes.coordinate_system': saveInjury(),
        'injury_size_attributes.angle': saveInjury(),
        'injury_depth_attributes.depth': saveInjury(),
        'injury_depth_attributes.reached_organ_id': saveInjury()
      },
      computed: {
        reachableOrgans: function() {
          return this.$store.getters.getReachableOrgans(examinationType)
        },
        expectedBodyReferences: function() {
          return this.$store.getters.getExpectedBodyReferences(examinationType)
        }
      }
    })

    return new Vue({
      el: '#injury_app',
      store
    })
  })
}
