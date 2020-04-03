import Vue from 'vue'
import Practice3 from '../Practice3.vue'

document.addEventListener('DOMContentLoaded', () => {
    const dataDiv = document.getElementById("practice3-div");
    const props = JSON.parse(dataDiv.getAttribute("data"));
    const practice3 = new Vue({
        render: h => h(Practice3, {props})
    }).$mount()
    document.body.appendChild(practice3.$el)

    console.log(practice3)
})
