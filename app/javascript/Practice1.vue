<template>
  <div id="practice1">
  <button v-on:click="changeMsg">change message</button>
  <p>{{ message }}</p>
  <p>id: {{data.id}}</p>
  <h2>title: {{data.title}}</h2>
  <p>description: {{data.description}}</p>
  <p>contents:</p>
  <table class="contents">
    <tr>
      <th>name</th>
      <th>age</th>
      <th>introduction</th>
    </tr>
    <tr v-for="content in data.contents" :key="content.name">
      <td>{{content.name}}</td>
      <td>{{content.age}}</td>
      <td>{{content.introduction}}</td>
    </tr>
  </table>
  </div>
</template>

<script>
import Axios from "axios"

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      data: {}
    }
  },
  created: function() {
    this.getData();
  },
  methods: {
    changeMsg: function () {
      this.message = 'Hi Rails!'
    },
    getData: function() {
      Axios.get("/api/practice/practice/index")
        .then(res => {
          this.data = res.data;
        })
    }
  }
}
</script>

<style scoped>
.contents {
  border: solid 1px black;
  border-collapse: collapse;
  text-align: center;
}
.contents th,
.contents td {
  border: solid 1px black;
  padding: 0.5rem;
}
</style>
