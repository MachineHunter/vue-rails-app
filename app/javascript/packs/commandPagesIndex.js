import Vue from 'vue'
import CommandPagesIndex from '../roots/CommandPagesIndex.vue'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import "./custom.scss"

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

const vueMountListener = () => {
  const commandPagesIndex = new Vue({
    render: h => h(CommandPagesIndex)
  }).$mount()
  const vueHook = document.getElementById("vue-hook")
  if(vueHook){
    document.body.replaceChild(commandPagesIndex.$el, vueHook)
  }

}

document.addEventListener('turbolinks:load', vueMountListener)
