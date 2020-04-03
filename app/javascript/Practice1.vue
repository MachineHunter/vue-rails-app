<template>
  <div id="practice1">
  <button v-on:click="changeMsg">change message</button>
  <p>{{ message }}</p>
  <test-data1-container
    :paramId="1"
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
      message: "Hello Vue!"
    }
  },
  methods: {
    changeMsg: function () {
      this.message = 'Hi Rails!'
    }
  }
}
</script>

<style scoped>

</style>
