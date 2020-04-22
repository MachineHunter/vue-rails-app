import Vue from 'vue'
import UserPagesIndex from '../roots/UserPagesIndex.vue'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
import "./custom.scss"

document.addEventListener('DOMContentLoaded', () => {
  const userPagesIndex = new Vue({
    render: h => h(UserPagesIndex)
  }).$mount()
  document.body.appendChild(userPagesIndex.$el)
})
