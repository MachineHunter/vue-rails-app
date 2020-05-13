<template>
  <common-layout
    :currentUserId="currentUserId"
    activeTab="account"
    signedInOnly
  >
    <user-profile/>
  </common-layout>
</template>

<script>
import CommonLayout from "../components/CommonLayout"
import UserProfile from "../components/UserProfile"

export default {
  components: {
    CommonLayout,
    UserProfile
  },
  props: {
    currentUserId: {
      type: Number,
      required: true
    }
  }
}
</script>

<style scoped>
</style>