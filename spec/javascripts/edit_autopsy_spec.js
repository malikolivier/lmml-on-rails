/* eslint-env jasmine */
/* global MagicLamp, LMML */

describe('Edit autopsy', function () {
  beforeEach(function () {
    MagicLamp.load('autopsies/edit_empty')
  })

  it('outline_examination got an id within 1s after first update',
      function (done) {
    LMML.loaders.external_outline_examination()
    LMML.vms.external_outline_examination.weight = '35.1'
    setTimeout(function () {
      expect(LMML.vms.external_outline_examination.id).not.toBe('')
      done()
    }, LMML_TEST.timeout)
  })
})
