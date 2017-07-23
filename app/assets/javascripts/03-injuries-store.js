/* global LMML */

(function () {
  var store = null
  var loadingStore = false

  LMML.stores = {
    get injuryStore () {
      return new Promise(function (resolve, reject) {
        function wait () {
          if (store) resolve(store)
          else setTimeout(wait, 500)
        }

        if (store) resolve(store)
        else if (loadingStore) {
          wait()
        } else {
          loadingStore = true
          Vue.http.get('/api/injuries/store').then(function loadInjuriesStore (response) {
            const state = response.body
            store = new Vuex.Store({
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
                  if (state[examinationType]) return state[examinationType].body_references
                  else {
                    console.error(`Examination type not found! ${examinationType}`)
                    return []
                  }
                }
              }
            })
            resolve(store)
          }, reject)
        }
      })
    }
  }
})()
