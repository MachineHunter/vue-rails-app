<template>
  <div id="app">
  <button v-on:click="changeMsg">change message</button>
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
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
p {
  font-size: 2em;
  text-align: center;
}
</style>
