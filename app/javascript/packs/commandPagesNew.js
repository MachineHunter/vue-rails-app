import Vue from 'vue'
import CommandPagesNew from '../roots/CommandPagesNew.vue'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import "./custom.scss"

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

const vueMountListener = () => {
  const vueHook = document.getElementById("vue-hook")
  if(vueHook){
    const currentUserId = Number(vueHook.dataset.current_user_id)
    const commandPagesNew = new Vue({
      render: h => h(CommandPagesNew, {props: {currentUserId}})
    }).$mount()
    document.body.replaceChild(commandPagesNew.$el, vueHook)
  }

}

document.addEventListener('turbolinks:load', vueMountListener)
