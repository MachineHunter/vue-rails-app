<template>
  <div id="practice-index3">
    <table class="practices-table">
      <tr>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>contents</th>
      </tr>
      <tr v-for="practice in practices" :key="practice.id">
        <td>{{practice.id}}</td>
        <td>{{practice.title}}</td>
        <td>{{practice.description}}</td>
        <td>{{practice.contents}}</td>
      </tr>
    </table>
  </div>
</template>

<script>
import Axios from "axios";

export default {
  data: function() {
    return {
      practices: []
    };
  },
  created: function() {
    this.getPracticeModels();
  },
  methods: {
    getPracticeModels: function() {
      Axios.get("/api/practice/practice/index3").then(res => {
        this.practices = res.data.practices;
      });
    }
  }
};
</script>

<style>
.practices-table {
  border: solid 1px black;
  border-collapse: collapse;
  text-align: center;
}
.practices-table th,
.practices-table td {
  border: solid 1px black;
  padding: 0.5rem;
}
</style>