import Vue from 'vue'
import PracticeIndex2 from '../roots/PracticeIndex2.vue'

document.addEventListener('DOMContentLoaded', () => {
    const dataDiv = document.getElementById("practice3-div");
    const props = JSON.parse(dataDiv.getAttribute("data"));
    const practiceIndex2 = new Vue({
        render: h => h(PracticeIndex2, {props})
    }).$mount()
    document.body.appendChild(practiceIndex2.$el)

    console.log(practiceIndex2)
})
