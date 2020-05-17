<template>
  <common-layout
    activeTab="account"
  >
    <main-user-profile/>
  </common-layout>
</template>

<script>
import CommonLayout from "../components/CommonLayout"
import MainUserProfile from "../components/MainUserProfile"

export default {
  components: {
    CommonLayout,
    MainUserProfile
  },
  created: function() {
    this.$store.dispatch("requestUserData", this.$store.state.userId)
    this.$store.dispatch("requestAvatar", this.$store.state.userId)
    this.$store.dispatch("requestTagData")
  }
}
</script>

<style scoped>
</style>