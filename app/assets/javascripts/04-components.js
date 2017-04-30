/* global LMML */

LMML.components = {
  loadInjuryComponents () {
    return LMML.stores.injuryStore.then(function (store) {
      function emitUpdate (attribute) {
        return function (newValue) {
          this.$emit('update', {
            [attribute]: newValue
          })
        }
      }

      Vue.component('in-body-orientation-component', {
        template: '#in_body_orientation_component',
        data: function () {
          return {
            coordinate_system: this.initial_coordination_system || '',
            x: this.initial_x,
            y: this.initial_y,
            distance: null,
            angle: null
          }
        },
        props: {
          initial_coordinate_system: String,
          initial_x: Number,
          initial_y: Number
        },
        methods: {
          recomputeXY () {
            if (this.angle !== null && this.distance !== null) {
              var radAngle = this.angle * Math.PI / 180
              this.x = LMML.utils.round(this.distance * Math.cos(radAngle))
              this.y = LMML.utils.round(this.distance * Math.sin(radAngle))
            }
          },
          recomputeDistanceAngle () {
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
          updateCoordinateSystem () {
            this.$emit('coordinate-system-update', this.coordinate_system)
          }
        },
        watch: {
          coordinate_system: emitUpdate('coordinate_system'),
          x: emitUpdate('x'),
          y: emitUpdate('y')
        },
        mounted () {
          this.recomputeDistanceAngle()
        }
      })

      Vue.component('injury-component', {
        template: '#injury_component',
        props: {
          examination_type: String,
          injury_from_parent: Object
        },
        data () {
          return { error: null }
        },
        methods: {
          updateCoordinateSystem (newCoordinateSystem) {
            this.injury.injury_size_attributes.coordinate_system = newCoordinateSystem
          },
          saveBodyOrientation (attributes) {
            if (!this._bodyReference) return
            for (var property in attributes) {
              this._bodyReference[property] = attributes[property]
            }
            this.update()
          },
          update: LMML.debounce(function () {
            this._save({ injury: this.injury })
          }),
          onFileChange (event) {
            var files = event.target.files
            for (var file of files) {
              this._uploadPicture(file)
            }
          },
          _save (object) {
            if (LMML.isEmpty(this.injury.id)) {
              this.$http.post(this._url, object)
                .then(this._setIds, this._logError)
            } else {
              this.$http.patch(this._url, object)
                .then(this._setIds, this._logError)
            }
          },
          _setIds (response) {
            var injury = response.body.injury
            this.injury.id = injury.id
            this.injury.body_area_attributes.id = injury.body_area_id
            this.injury.body_area_attributes.in_body_orientation_attributes.id = injury.body_area && injury.body_area.in_body_orientation_id
            this.injury.injury_size_attributes.id = injury.injury_size_id
            this.injury.injury_depth_attributes.id = injury.injury_depth_id
            console.log('Update success!!')
          },
          _logError (errorResponse) {
            this.error = errorResponse
          },
          _bodyReferenceProperty (propName) {
            return this._bodyReference && this._bodyReference[propName]
          },
          _uploadPicture: function(file) {
            var formData = new window.FormData()
            formData.append('injury[photographs_attributes][picture]', file)
            var request
            if (LMML.isEmpty(this.injury.id)) {
              request = this.$http.post(this._url, formData)
            } else {
              request = this.$http.patch(this._url, formData)
            }
            request.then(function (response) {
              this.injury.photographs_attributes =
                response.body.injury.photographs_attributes
            }, this._logError)
          }
        },
        computed: {
          injury () {
            return this.injury_from_parent
          },
          reachableOrgans () {
            return this.$store.getters
              .getReachableOrgans(this.examination_type)
          },
          expectedBodyReferences () {
            return this.$store.getters
              .getExpectedBodyReferences(this.examination_type)
          },
          bodyReferenceCoordinateSystem () {
            return this._bodyReferenceProperty('coordinate_system')
          },
          bodyReferenceX () {
            return this._bodyReferenceProperty('x')
          },
          bodyReferenceY () {
            return this._bodyReferenceProperty('y')
          },
          _bodyReference () {
            return this.injury.body_area_attributes
              .in_body_orientation_attributes
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
          },
          _url () {
            if (LMML.isEmpty(this.injury.id)) {
              return this._fullUrl
            } else {
              return `/injuries/${this.injury.id}`
            }
          }
        },
        mounted () {
          // Replace null values with empty strings for enumerations
          // This allows to have the "Please select" visible
          if (!this.injury.time_sustained) {
            this.injury.time_sustained = ''
          }
          if (!this.injury.injury_type) {
            this.injury.injury_type = ''
          }
          if (!this.injury.body_area_attributes.body_reference_id) {
            this.injury.body_area_attributes.body_reference_id = ''
          }
          if (!this.injury.injury_size_attributes.shape) {
            this.injury.injury_size_attributes.shape = ''
          }
          if (!this.injury.injury_size_attributes.coordinate_system) {
            this.injury.injury_size_attributes.coordinate_system = ''
          }
          if (!this.injury.injury_depth_attributes.reached_organ_id) {
            this.injury.injury_depth_attributes.reached_organ_id = ''
          }
        }
      })
      return store
    })
  }
}
