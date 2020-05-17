import Vue from 'vue'

import Vuex from 'vuex'
Vue.use(Vuex)

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import "./custom.scss"

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

import Axios from "axios"
const baseStoreSeed = {
  state: {
    cookies: {},
    genres: [],
    commandTypes: []
  },
  getters: {
  },
  mutations: {
    loadCookies(state) {
      const cookiesString = document.cookie
      const cookies = cookiesString.split(";").reduce((acc, cookie) => {
        const [key, value] = cookie.split("=")
        if(value === undefined) return acc
        return {...acc, [key.trim()]: value.trim()}
      }, {})
      state.cookies = cookies
    },
    setGenres(state, value) {
      state.genres = value
    },
    setCommandTypes(state, value) {
      state.commandTypes = value
    }
  },
  actions: {
    requestTagData({commit}) {
      Axios.get("/api/command/new").then(res => {
        commit("setGenres", res.data.genres)
        commit("setCommandTypes", res.data.command_types)
      }).catch(err => {
        console.log(err)
      })
    }
  }
}

export default (rootComponent, dataHandler=(h)=>({}), storeSeed={}) => {
  for(let prop in storeSeed) {
    Object.assign(baseStoreSeed[prop], storeSeed[prop])
  }  
  
  const vueMountListener = () => {
    const vueHook = document.getElementById("vue-hook")
    if(vueHook){
      const data = dataHandler(vueHook)
      Object.assign(baseStoreSeed.state, data)
      const store = new Vuex.Store(baseStoreSeed)

      const vm = new Vue({
        render: h => h(rootComponent),
        store
      }).$mount()
      // document.body.appendChild(vm.$el)
      document.body.replaceChild(vm.$el, vueHook)
    }
  }
  
  document.addEventListener('turbolinks:load', vueMountListener)
}

