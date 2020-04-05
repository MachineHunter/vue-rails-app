<template>
  <div id="practice-index3">
    <table class="practices-table">
      <tr>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>contents</th>
        <th></th>
      </tr>
      <tr v-for="practice in practices" :key="practice.id">
        <td>{{practice.id}}</td>
        <td>{{practice.title}}</td>
        <td>{{practice.description}}</td>
        <td>{{practice.contents}}</td>
        <td class="cell-for-checkbox">
          <label class="label-for-checkbox">
            <input
              type="checkbox"
              class="checkbox"
              :value="practice"
              v-model="selectedPractices"
            >
          </label>
        </td>
      </tr>
    </table>
    <button
      type="button"
      class="form-open-button"
      @click="openRegisterForm"
    >Registser New Data</button>
    <button
      type="button"
      class="form-open-button"
      @click="openUpdateForm"
    >Update Selected Data</button>
    <button
      type="button"
      class="delete-button"
      @click="deleteData"
    >Delete Selected Data</button>

    <div class="popup-cover" v-show="isShownForm">
      <div class="popup-window">
        <form @submit.prevent="submitData">
          <div class="form-header">
            <h3 class="form-title">
              {{
                formType === "register" ?
                "Register New Data" :
                formType === "update" ?
                `Update Data${selectedPractices[0].id}` : ""
              }}
            </h3>
            <button
              type="button"
              class="form-close-button"
              @click="closeForm"
            >close</button>
          </div>
          <div class="title">
            <label for="title">title:</label>
            <input
              type="text"
              id="title"
              v-model="newPractice.title"
            >
          </div>
          <div class="description">
            <label for="description">description:</label>
            <input
              type="text"
              id="description"
              v-model="newPractice.description"
            >
          </div>
          <div class="contents">
            <label for="contents">contents:</label>
            <input
              type="text"
              id="contents"
              v-model="newPractice.contents"
            >
          </div>
          <div class="form-footer">
            <input type="submit" :value="formType">
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import Axios from "axios";
const blankPractice = {
  title: "",
  description: "",
  contents: ""
}
const cloneObj = obj => Object.assign({}, obj);

export default {
  data: function() {
    return {
      isShownForm :false,
      formType: "", //"register" or "update"
      practices: [],
      newPractice: {
        title: "",
        description: "",
        contents: ""
      },
      selectedPractices: []
    };
  },
  created: function() {
    this.getPracticeModels();
  },
  mounted: function() {
    const token = document.querySelector("meta[name=csrf-token]").getAttribute("content");
    Axios.defaults.headers['X-CSRF-TOKEN'] = token;    
  },
  methods: {
    getPracticeModels: function() {
      Axios.get("/api/practice/practice/index3").then(res => {
        this.practices = res.data.practices;
      });
    },
    submitData: function() {
      if(this.formType === "register") {
        this.registerNewData();
      }else if(this.formType === "update") {
        this.updateData();
      }
    },
    registerNewData: function() {
      if(!this.newPractice.title && !this.newPractice.description && !this.newPractice.contents){
        this.isShownForm = false;
        return;
      }

      //よくわからんがObjectのままだと上手くいかない
      const params = new URLSearchParams();
      Object.entries(this.newPractice).forEach(([param, value]) =>{
        params.append(param, value);
      });
    
      Axios.post("/api/practice/practice/create", params).then(res => {
        this.practices.push(res.data);
        console.log("succeeded!", res);
        this.closeForm();
        this.resetForm();
      }).catch(error => {
        console.log(error)
      });
    },
    updateData: function() {
      if(!this.newPractice.title && !this.newPractice.description && !this.newPractice.contents){
        this.isShownForm = false;
        return;
      }

      const params = new URLSearchParams();
      Object.entries(this.newPractice).forEach(([param, value]) =>{
        params.append(param, value);
      });
    
      Axios.put("/api/practice/practice/update", params).then(res => {
        this.practices[this.newPractice.id - 1] = res.data;
        console.log("succeeded!", res);
        this.resetCheckbox();
        this.closeForm();
        this.resetForm();
      }).catch(error => {
        console.log(error)
      });
    },
    openRegisterForm: function() {
      this.formType = "register";
      this.isShownForm = true;
    },
    openUpdateForm: function() {
      if(this.selectedPractices.length !== 1) {
        alert("Select just 1 row when updating.")
        return;
      }
      this.formType = "update";
      this.newPractice = cloneObj(this.selectedPractices[0]);
      this.isShownForm = true;
    },
    closeForm: function() {
      this.isShownForm = false;
      if(this.formType === "update") {
        this.newPractice = cloneObj(blankPractice);
      }
    },
    resetForm: function() {
      this.newPractice = cloneObj(blankPractice);
    },
    resetCheckbox: function() {
      this.selectedPractices = [];
    },
    deleteData: function() {
      if(this.selectedPractices.length === 0) return;
      const idsToBeDeleted = this.selectedPractices.map(
        practice => practice.id
      );
      const message = idsToBeDeleted
        .sort((a,b) => a - b)
        .map(id => `Data${id}`)
        .join(", ")
        + " will be deleted.";
      if(confirm(message)) {
        // 今度はURLSearchParams()だとダメ
        Axios.delete("/api/practice/practice/destroy", {data: {id_list: idsToBeDeleted}})
          .then(res => {
            this.practices = this.practices.filter(
              practice => !idsToBeDeleted.includes(practice.id)
            );
            this.resetCheckbox();
            console.log("succeeded!", res);
          }).catch(error => {
            console.log(error)
          });
      }
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
.cell-for-checkbox {
  position: relative;
  width: 3ch;
}
.label-for-checkbox {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;

  display: flex;
  justify-content: center;
  align-items: center;

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