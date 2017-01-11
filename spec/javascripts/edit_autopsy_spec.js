/* eslint-env jasmine */
/* global MagicLamp, LMML */

describe('Edit empty autopsy', function () {

  beforeEach(function () {
    MagicLamp.load('autopsies/edit_empty')
  })

  describe('Edit external_outline_examination', function () {

    var outlineVm;
    beforeEach(function () {
      LMML.loaders.external_outline_examination()
      outlineVm = LMML.vms.external_outline_examination
    })

    it('Id is set within 1s after first update', function (done) {
      outlineVm.weight = '35.1'
      setTimeout(function () {
        expect(outlineVm.id).not.toBe('')
        done()
      }, 1000)
    })

    it('Has empty livores_mortis array after init', function () {
      expect(outlineVm.livores_mortis_attributes).toEqual([])
    })

    it('Can add livores mortis', function (done) {
      outlineVm.add_livor_mortis();
      setTimeout(function () {
        outlineVm.livores_mortis_attributes[0].color = 'white'
        done();
      }, 1000)
    })
  })
})
