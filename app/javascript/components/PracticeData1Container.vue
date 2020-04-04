<template>
  <div id="practice-data1-container">
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
import Axios from "axios";

export default {
  props: {
    paramId: {
      type: Number,
      required: true,
      validator: function(value) {
        return 1 <= value && value <= 3;
      }
    }
  },
  data: function() {
    return {
      data: {}
    };
  },
  created: function() {
    this.getData();
  },
  methods: {
    getData: function() {
      Axios.get(`/api/practice/practice/index/${this.paramId}`).then(res => {
        this.data = res.data;
      });
    }
  }
};
</script>

<style>
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