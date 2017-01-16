/* eslint no-extend-native: 0 */
String.prototype.pluralize = function pluralize () {
  if (this.endsWith('y')) {
    return this.replace(/^(.*)y$/, '$1ies')
  } else {
    return `${this}s`
  }
}
