/* eslint-env jasmine */
/* global MagicLamp, LMML */

describe('Edit autopsy', function () {
  beforeEach(function () {
    MagicLamp.load('autopsies/edit_empty')
  })

  it('outline_examination got an id after first update', function (done) {
    LMML.loaders.external_outline_examination()
    LMML.vms.external_outline_examination.weight = '35.1'
    Vue.nextTick(function () {
      expect(LMML.vms.external_outline_examination.id).not.toBe('')
      done()
    })
  })
})
