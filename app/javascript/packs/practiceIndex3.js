import Vue from 'vue'
import PracticeIndex3 from '../roots/PracticeIndex3.vue'

document.addEventListener('DOMContentLoaded', () => {
  const practiceIndex3 = new Vue({
    render: h => h(PracticeIndex3)
  }).$mount()
  document.body.appendChild(practiceIndex3.$el)
})