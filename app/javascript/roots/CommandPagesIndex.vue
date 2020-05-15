<template>
  <common-layout
    activeTab="account"
  >
    <main-command-list/>
  </common-layout>
</template>

<script>
import CommonLayout from "../components/CommonLayout"
import MainCommandList from "../components/MainCommandList"

export default {
  components: {
    CommonLayout,
    MainCommandList
  }
}
</script>

<style scoped>
</style>