/* eslint-env jasmine */

describe('Check libraries', function () {
  it('jQuery loaded', function () {
    expect(jQuery).toBeDefined()
  })

  it('Vue.js loaded', function () {
    expect(Vue).toBeDefined()
  })

  it('Lodash loaded', function () {
    expect(_).toBeDefined()
  })
})
