import Vue from 'vue'
import UserPagesIndex from '../roots/UserPagesIndex.vue'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import "./custom.scss"

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

const vueMountListener = () => {
  const userPagesIndex = new Vue({
    render: h => h(UserPagesIndex)
  }).$mount()
  // document.body.appendChild(userPagesIndex.$el)
  const vueHook = document.getElementById("vue-hook")
  if(vueHook){
    document.body.replaceChild(userPagesIndex.$el, vueHook)
  }

}

document.addEventListener('turbolinks:load', vueMountListener)
