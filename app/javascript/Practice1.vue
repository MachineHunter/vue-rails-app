<template>
  <div id="practice1">
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
  <test-data1-container 
    v-for="id in ids"
    :key="`container-${id}`"
    :paramId="id"
    v-show="currentId === id"
  />
  </div>
</template>

<script>
import TestData1Container from "./components/TestData1Container.vue"

export default {
  components: {
    TestData1Container
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

