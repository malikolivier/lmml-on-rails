/* global LMML */

LMML.components = {
  loadInjuryComponents () {
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
      },
      error: null
    }

    var defaultInBodyOrientation = {
      id: null,
      coordinate_system: '',
      x: null,
      y: null,
      distance: null,
      angle: null
    }

    return LMML.stores.injuryStore.then(function (store) {
      function emitUpdate (attribute) {
        return LMML.debounce(function (newValue) {
          this.$emit('update', {
            id: this.id,
            [attribute]: newValue
          })
        })
      }

      Vue.component('in-body-orientation-component', {
        template: '#in_body_orientation_component',
        data: function () {
          return defaultInBodyOrientation
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

      function saveInjury () {
        return LMML.debounce(function () { this._save({ injury }) })
      }

      Vue.component('injury-component', {
        template: '#injury_component',
        data: function () {
          return defaultInjury
        },
        props: {
          examination_type: String
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
              var url = this._fullUrl
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
          },
          setInjury: function(injury) {
            this.id = injury.id
            this.time_sustained = injury.time_sustained
            this.injury_type = injury.injury_type
            this.body_area_attributes = injury.body_area
            this.injury_size_attributes = injury.injury_size
            this.injury_depth_attributes = injury.injury_depth
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
          reachableOrgans: function () {
            return this.$store.getters
              .getReachableOrgans(this.examination_type)
          },
          expectedBodyReferences: function () {
            return this.$store.getters
              .getExpectedBodyReferences(this.examination_type)
          },
          _fullUrl: function() {
            var id = `${this.examination_type}_injuries_app`
            var appElement = document.getElementById(id)
            if (appElement) {
              return appElement.getAttribute('data-url')
            } else {
              // Fall back to default ID
              appElement = document.getElementById('injury_app')
              return appElement.getAttribute('data-url')
            }
          }
        }
      })
      return store
    })
  }
}
