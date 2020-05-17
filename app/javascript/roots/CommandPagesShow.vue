<template>
  <common-layout
    activeTab="account"
  >
    <main-command-detail/>
  </common-layout>
</template>

<script>
import CommonLayout from "../components/CommonLayout"
import MainCommandDetail from "../components/MainCommandDetail"

export default {
  components: {
    CommonLayout,
    MainCommandDetail
  },
  created: function() {
    document.cookie = "keep_page=true;path=/"
    this.$store.dispatch("requestTagData")
  }
}
</script>

<style scoped>
</style>