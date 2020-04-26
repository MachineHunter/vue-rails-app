/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import "./custom.scss"

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import Vue from 'vue'
import CommonHeader from '../components/CommonHeader.vue'
import CommonFooter from '../components/CommonFooter.vue'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)

const vueHeaderMountListener = () => {
  const commonHeader = new Vue({
    render: h => h(CommonHeader)
  }).$mount()
  const vueHeaderHook = document.getElementById("vue-header-hook")
  if(vueHeaderHook){
    document.body.replaceChild(commonHeader.$el, vueHeaderHook)
  }
}

const vueFooterMountListener = () => {
  const commonFooter = new Vue({
    render: h => h(CommonFooter)
  }).$mount()
  const vueFooterHook = document.getElementById("vue-footer-hook")
  if(vueFooterHook){
    document.body.replaceChild(commonFooter.$el, vueFooterHook)
  }
}

document.addEventListener('DOMContentLoaded', vueHeaderMountListener)
document.addEventListener('turbolinks:load', vueHeaderMountListener)

document.addEventListener('DOMContentLoaded', vueFooterMountListener)
document.addEventListener('turbolinks:load', vueFooterMountListener)

