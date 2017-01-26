/* global LMML */

$(function () {
  if (document.getElementById('sidebar') !== null) {
    LMML.setup_navbar()
  }
})

LMML.setup_navbar = function () {
  $('#sidebar').affix({
    offset: {
      top: 245
    }
  })

  var $body = $(document.body)
  var navHeight = $('.navbar').outerHeight(true) + 10

  $body.scrollspy({
    target: '#leftCol',
    offset: navHeight
  })
}
