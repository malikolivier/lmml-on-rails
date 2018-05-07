/* global LMML */

$(function () {
  if (document.getElementById('autopsy_filtering') !== null) {
    LMML.loaders.autopsy_filtering();
  }
})

LMML.loaders.autopsy_filtering = function () {
  $('#autopsy_filtering').on('click',function(){
    var number = $('#filterNumber').val();
    var examiner = $('#filterExaminer').val();
    var policeInspector = $('#filterPoliceInspector').val();
    var a = $('<a>',{
       css:{display:'none'},
       id:'link',
       href:'./autopsies?number='+number+'&examiner_id='+examiner+'&police_inspector_id='+policeInspector
    });
    $('body').append(a);
    $('#link')[0].click();
  });
}
