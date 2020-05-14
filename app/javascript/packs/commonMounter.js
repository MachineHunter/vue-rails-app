import Vue from 'vue'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import "./custom.scss"

import TurbolinksAdapter from 'vue-turbolinks'
Vue.use(TurbolinksAdapter)

export default (rootComponent, dataHandler) => {
  const vueMountListener = () => {
    const vueHook = document.getElementById("vue-hook")
    if(vueHook){
      const props = dataHandler(vueHook)
      const vm = new Vue({
        render: h => h(rootComponent, {props})
      }).$mount()
      // document.body.appendChild(vm.$el)
      document.body.replaceChild(vm.$el, vueHook)
    }
  }
  
  document.addEventListener('turbolinks:load', vueMountListener)
}

