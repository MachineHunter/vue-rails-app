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
  }
}
</script>

<style scoped>
</style>