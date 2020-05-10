import Vue from 'vue'
import CommandPagesNew from '../roots/CommandPagesNew.vue'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import "./custom.scss"

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

const vueMountListener = () => {
  const commandPagesNew = new Vue({
    render: h => h(CommandPagesNew)
  }).$mount()
  const vueHook = document.getElementById("vue-hook")
  if(vueHook){
    document.body.replaceChild(commandPagesNew.$el, vueHook)
  }

}

document.addEventListener('turbolinks:load', vueMountListener)
