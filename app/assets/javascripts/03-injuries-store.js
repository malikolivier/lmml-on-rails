(function() {
  LMML.stores = {
    get injuryStore() {
      return new Promise(function(resolve, reject) {
        Vue.http.get('/injuries/store').then(function loadInjuriesStore(response) {
          const state = response.body
          var store = new Vuex.Store({
            state,
            getters: {
              getReachableOrgans: (state, getters) => (examinationType) => {
                if (state[examinationType]) return state[examinationType].reachable_organs
                else {
                  console.error(`Examination type not found! ${examinationType}`)
                  return []
                }
              },
              getExpectedBodyReferences: (state, getters) => (examinationType) => {
                if (state[examinationType]) return state[examinationType].expected_body_references
                else {
                  console.error(`Examination type not found! ${examinationType}`)
                  return []
                }
              }
            }
          })
          resolve(store)
        }, reject)
      })
    }
  }
})()
