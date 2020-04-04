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
    <button
      type="button"
      class="form-open-button"
      @click="openForm"
    >Registser New Data</button>

    <div class="popup-cover" v-show="isShownForm">
      <div class="popup-window">
        <form action="">
          <div class="form-header">
            <h3 class="form-title">Register New Data</h3>
            <button
              type="button"
              class="form-close-button"
              @click="closeForm"
            >close</button>
          </div>
          <div class="title">
            <label for="title">title:</label>
            <input type="text" id="title">
          </div>
          <div class="description">
            <label for="description">description:</label>
            <input type="text" id="description">
          </div>
          <div class="contents">
            <label for="contents">contents:</label>
            <input type="text" id="contents">
          </div>
          <div class="form-footer">
            <input type="submit" value="register">
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import Axios from "axios";

export default {
  data: function() {
    return {
      isShownForm :false,
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
    },
    openForm: function() {
      this.isShownForm = true;
    },
    closeForm: function() {
      this.isShownForm = false;
    }
  }
};
</script>

<style scoped>
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

.form-open-button {
  margin: 0.5rem;
}

.popup-cover {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.411);

  display: flex;
  justify-content: center;
  align-items: center;
}
.popup-window {
  width: 70%;
  background-color: #fff;

  padding: 1rem;
}
.form-header {
  display: grid;
  grid-template-columns: 10% 80% 10%;
  justify-items: center;
}
.form-title {
  grid-column: 2;
  margin :0.1rem;
}
.form-close-button {
  grid-column: 3;
}
.form-footer {
  display: grid;
  justify-content: center;

  margin-top: 0.5rem;
}
</style>