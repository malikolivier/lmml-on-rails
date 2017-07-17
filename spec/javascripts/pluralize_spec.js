/* eslint-env jasmine */
/* global LMML */

describe('Pluralize', function () {
  it('inflects latin plural', function () {
    expect(LMML.pluralize('livor_mortis')).toBe('livores_mortis')
  })
  it('inflects autopsy', function () {
    expect(LMML.pluralize('autopsy')).toBe('autopsies')
  })
  it('inflects external_examination', function () {
    expect(LMML.pluralize('external_examination')).toBe('external_examinations')
  })
  it('inflects biochemical_analysis', function () {
    expect(LMML.pluralize('biochemical_analysis')).toBe('biochemical_analyses')
  })
})
