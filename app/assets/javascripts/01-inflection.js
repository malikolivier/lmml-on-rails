/* global LMML */

LMML.pluralize = function pluralize (word) {
  if (word.endsWith('y')) {
    return word.replace(/^(.*)y$/, '$1ies')
  } else if (word.toString() === 'livor_mortis') {
    return 'livores_mortis'
  } else if (word.toString() === 'rigor_mortis') {
    return 'rigores_mortis'
  } else {
    return `${word}s`
  }
}
