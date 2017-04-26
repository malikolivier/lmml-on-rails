/* global LMML */

LMML.components = {
  loadInjuryComponents () {
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
          return {
            distance: null,
            angle: null
          }
        },
        props: {
          id: Number,
          coordinate_system: String,
          x: String,
          y: String
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

      Vue.component('injury-component', {
        template: '#injury_component',
        data: function () {
          return { error: null }
        },
        props: {
          examination_type: String,
          injury: Object
        },
        methods: {
          updateCoordinateSystem (newCoordinateSystem) {
            if (LMML.isEmpty(this.injury_size_attributes.coordinate_system)) {
              this.injury_size_attributes.coordinate_system = newCoordinateSystem
            }
          },
          saveBodyOrientation (attributes) {
            this._save({
              injury: {
                body_area_attributes: {
                  id: this.body_area_attributes.id,
                  in_body_orientation_attributes: attributes
                }
              }
            })
          },
          _save (object) {
            var url
            if (LMML.isEmpty(this.id)) {
              var url = this._fullUrl
              this.$http.post(url, object).then(this._setIds, this._logError)
            } else {
              url = `/injuries/${this.id}`
              this.$http.patch(url, object).then(this._setIds, this._logError)
            }
          },
          _setIds (response) {
            var injury = response.body.injury
            this.id = injury.id
            this.body_area_attributes.id = injury.body_area_id
            inBodyOrientation.id = injury.body_area && injury.body_area.in_body_orientation_id
            this.injury_size_attributes.id = injury.injury_size_id
            this.injury_depth_attributes.id = injury.injury_depth_id
            console.log('Update success!!')
          },
          _logError (errorResponse) {
            this.error = errorResponse
          },
          _bodyReferenceProperty(propName) {
            return this.injury.body_area_attributes
              .in_body_orientation_attributes[propName]
          }
        },
        watch: {
          injury:  {
            handler: function onChange (newValue, oldValue) {
              LMML.debounce(function () {
                this._save(this.injury)
              })
            },
            deep: true
          }
        },
        computed: {
          reachableOrgans() {
            return this.$store.getters
              .getReachableOrgans(this.examination_type)
          },
          expectedBodyReferences() {
            return this.$store.getters
              .getExpectedBodyReferences(this.examination_type)
          },
          bodyReferenceCoordinateSystem() {
            return this._bodyReferenceProperty('coordinate_system')
          },
          bodyReferenceX() {
            return this._bodyReferenceProperty('x')
          },
          bodyReferenceY() {
            return this._bodyReferenceProperty('x')
          },
          _fullUrl () {
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
