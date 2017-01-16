/* eslint no-extend-native: 0 */
String.prototype.pluralize = function pluralize() {
  if (this.endsWith('y')) {
    return this.replace(/^(.*)y$/, '$1ies')
  } else if (this.toString() === 'livor_mortis') {
    return 'livores_mortis'
  } else if (this.toString() === 'rigor_mortis') {
    return 'rigores_mortis'
  } else {
    return `${this}s`
  }
}
