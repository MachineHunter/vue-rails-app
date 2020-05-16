<template>
  <common-layout
    activeTab="account"
    :cookiesToDelete="['user_id']"
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
  },
  mounted: function() {
    this.$store.commit("loadCookies")
  }
}
</script>

<style scoped>
</style>