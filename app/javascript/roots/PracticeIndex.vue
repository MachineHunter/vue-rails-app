<template>
  <div id="practice-index">
  <button v-on:click="changeMsg">change message</button>
  <p>{{ message }}</p>
  <p>↓click to change param</p>
  <button
    v-for="id in ids"
    :key="`button-${id}`"
    type="button"
    @click="setCurrentIdTo(id)"
  >
    {{id}}
  </button>
  <practice-data1-container 
    v-for="id in ids"
    :key="`container-${id}`"
    :paramId="id"
    v-show="currentId === id"
  />
  </div>
</template>

<script>
import PracticeData1Container from "../components/PracticeData1Container.vue"

export default {
  components: {
    PracticeData1Container
  },
  data: function () {
    return {
      message: "Hello Vue!",
      ids: [1,2,3],
      currentId: 1
    }
  },
  methods: {
    changeMsg: function () {
      this.message = 'Hi Rails!'
    },
    setCurrentIdTo: function (id) {
      this.currentId = id;
    }
  }
}
</script>

<style scoped>

</style>

