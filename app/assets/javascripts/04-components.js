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
            coordinate_system: this.initial_coordination_system,
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
        data: function () {
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
          _save (object) {
            var url
            if (LMML.isEmpty(this.injury.id)) {
              url = this._fullUrl
              this.$http.post(url, object).then(this._setIds, this._logError)
            } else {
              url = `/injuries/${this.injury.id}`
              this.$http.patch(url, object).then(this._setIds, this._logError)
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
          }
        }
      })
      return store
    })
  },
  modal: {
    props: {
      show: {
        type: Boolean,
        twoWay: true,
        default: false
      },
      title: {
        type: String,
        default: 'Modal'
      },
      small: {
        type: Boolean,
        default: false
      },
      large: {
        type: Boolean,
        default: false
      },
      full: {
        type: Boolean,
        default: false
      },
            // 为true时无法通过点击遮罩层关闭modal
      force: {
        type: Boolean,
        default: false
      },
            // 自定义组件transition
      transition: {
        type: String,
        default: 'modal'
      },
            // 确认按钮text
      okText: {
        type: String,
        default: 'OK'
      },
            // 取消按钮text
      cancelText: {
        type: String,
        default: 'Cancel'
      },
            // 确认按钮className
      okClass: {
        type: String,
        default: 'btn blue'
      },
            // 取消按钮className
      cancelClass: {
        type: String,
        default: 'btn red btn-outline'
      },
            // 点击确定时关闭Modal
            // 默认为false，由父组件控制prop.show来关闭
      closeWhenOK: {
        type: Boolean,
        default: false
      }
    },
    data () {
      return {
        duration: null
      }
    },
    computed: {
      modalClass () {
        return {
          'modal-lg': this.large,
          'modal-sm': this.small,
          'modal-full': this.full
        }
      }
    },
    created () {
      if (this.show) {
        document.body.className += ' modal-open'
      }
    },
    beforeDestroy () {
      document.body.className = document.body.className.replace(/\s?modal-open/, '')
    },
    watch: {
      show (value) {
          // 在显示时去掉body滚动条，防止出现双滚动条
        if (value) {
          document.body.className += ' modal-open'
        } else {
            // 在modal动画结束后再加上body滚动条
          if (!this.duration) {
            this.duration = window.getComputedStyle(this.$el)['transition-duration'].replace('s', '') * 1000
          }
          window.setTimeout(() => {
            document.body.className = document.body.className.replace(/\s?modal-open/, '')
          }, this.duration || 0)
        }
      }
    },
    methods: {
      ok () {
        this.$emit('ok')
        if (this.closeWhenOK) {
          this.show = false
        }
      },
      cancel () {
        this.$emit('cancel')
        this.show = false
      },
            // 点击遮罩层
      clickMask () {
        if (!this.force) {
          this.cancel()
        }
      }
    },
    template: `
        <div v-show="show" :transition="transition">
          <div class="modal" @click.self="clickMask">
              <div class="modal-dialog" :class="modalClass">
                  <div class="modal-content">
                      <!--Header-->
                      <div class="modal-header">
                          <slot name="header">
                              <a type="button" class="close" @click="cancel">x</a>
                              <h4 class="modal-title">
                                  <slot name="title">
                                      {{title}}
                                  </slot>
                              </h4>
                          </slot>
                      </div>
                      <!--Container-->
                      <div class="modal-body">
                          <slot></slot>
                      </div>
                      <!--Footer-->
                      <div class="modal-footer">
                          <slot name="footer">
                              <button type="button" :class="cancelClass" @click="cancel">{{cancelText}}</button>
                              <button type="button" :class="okClass" @click="ok">{{okText}}</button>
                          </slot>
                      </div>
                  </div>
              </div>
          </div>
          <div class="modal-backdrop in"></div>
      </div>
    `,
    style: `
      .modal {
          display: block;
      }
      .modal-transition {
          transition: all .6s ease;
      }
      .modal-leave {
          /* 样式没什么用，但可以让根标签的transitionEnd生效，以去掉modal-leave */
          border-radius: 1px !important;
      }
      .modal-transition .modal-dialog, .modal-transition .modal-backdrop {
          transition: all .5s ease;
      }
      .modal-enter .modal-dialog, .modal-leave .modal-dialog {
          opacity: 0;
          transform: translateY(-30%);
      }
      .modal-enter .modal-backdrop, .modal-leave .modal-backdrop {
          opacity: 0;
      }
    `
  }
}
