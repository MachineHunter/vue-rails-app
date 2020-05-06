import Vue from 'vue'
import CommandPagesShow from '../roots/CommandPagesShow.vue'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import "./custom.scss"

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

const vueMountListener = () => {
  const vueHook = document.getElementById("vue-hook")
  if(vueHook){
    const commandId = Number(vueHook.dataset.commandid)
    const commandPagesShow = new Vue({
      render: h => h(CommandPagesShow, {props: {commandId}})
    }).$mount()
    document.body.replaceChild(commandPagesShow.$el, vueHook)
  }

}

document.addEventListener('turbolinks:load', vueMountListener)
