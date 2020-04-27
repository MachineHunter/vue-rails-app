import Vue from 'vue'
import UserPagesIndex from '../roots/UserPagesIndex.vue'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import "./custom.scss"

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

document.addEventListener('DOMContentLoaded', vueMountListener)
document.addEventListener('turbolinks:load', vueMountListener)
