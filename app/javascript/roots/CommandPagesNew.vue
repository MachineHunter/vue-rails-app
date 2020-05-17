<template>
  <common-layout
    activeTab="account"
    signedInOnly
  >
    <main-command-create-form/>
  </common-layout>
</template>

<script>
import CommonLayout from "../components/CommonLayout"
import MainCommandCreateForm from "../components/MainCommandCreateForm"

export default {
  components: {
    CommonLayout,
    MainCommandCreateForm
  },
  created: function() {
    document.cookie = "keep_page=true;path=/"
    this.$store.dispatch("requestTagData")
  }
}
</script>

<style scoped>
</style>