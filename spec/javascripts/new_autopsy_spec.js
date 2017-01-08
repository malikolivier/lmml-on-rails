/* eslint-env jasmine */
/* global MagicLamp */

describe('New autopsy', function () {
  beforeEach(function () {
    MagicLamp.load('autopsies/new')
  })

  it('has an autopsy form', function () {
    var element = document.getElementById('autopsy')
    expect(element).not.toBe(null)
  })
})
