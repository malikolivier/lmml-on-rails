/* global LMML */

$(function () {
  if (document.getElementById('autopsy_filtering') !== null && document.getElementsByClassName('filtering_textarea') !== null) {
    LMML.loaders.autopsy_filtering()
  }
})

LMML.loaders.autopsy_filtering = function () {
  $('#autopsy_filtering').on('click', function () {
    if (document.getElementById('link') !== null) {
      $('#link').remove()
    }
    var number = $('#filterNumber').val()
    var examiner = $('#filterExaminer').val()
    var policeInspector = $('#filterPoliceInspector').val()
    var queryParam = window.location.search.substring(1)
    var order
    if (queryParam) {
      var query = queryParam.split('&')
      query.forEach(function (value) {
        if (value.split('=')[0] === 'order') {
          order = value
        }
      })
    } else {
      order = null
    }
    var a = $('<a>', {
      css: {display: 'none'},
      id: 'link',
      href: './autopsies?' + order + '&number=' + number + '&examiner_id=' + examiner + '&police_inspector_id=' + policeInspector
    })
    $('body').append(a)
    $('#link')[0].click()
  })
  $('.filtering_textarea').on('keypress', function (e) {
    if (e.keyCode === 13) {
      $('#autopsy_filtering')[0].click()
    }
  });
  (function () {
    var queryParam = window.location.search.substring(1)
    var number = null
    var examiner = null
    var policeInspector = null
    if (queryParam) {
      var query = queryParam.split('&')
      query.forEach(function (value) {
        param=value.split('=')
        if (param[0] === 'number') {
          $('#filterNumber').val(param[1])
        } else if (param[0] === 'examiner_id') {
          $('#filterExaminer').val(param[1])
        } else if (param[0] === 'police_inspector_id') {
          $('#filterPoliceInspector').val(param[1])
        }
      })
    }
  })()
}
