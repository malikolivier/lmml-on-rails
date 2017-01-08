// Define global object for this app: LMML
this.LMML = {
  vms: {},
  loaders: {},
  autopsy_id: function getAutopsyId () {
    return document.getElementById('autopsy_id').value
  }
}
