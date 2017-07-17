/* global LMML */

LMML.pluralize = function pluralize (word) {
  if (word.endsWith('y')) {
    return word.replace(/^(.*)y$/, '$1ies')
  } else if (word === 'livor_mortis') {
    return 'livores_mortis'
  } else if (word === 'rigor_mortis') {
    return 'rigores_mortis'
  } else if (word.endsWith('is')) {
    return word.replace(/^(.*)is$/, '$1es')
  } else {
    return `${word}s`
  }
}
