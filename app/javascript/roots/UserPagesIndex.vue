<template>
  <common-layout
    :currentUserId="currentUserId"
    activeTab="account"
  >
    <main-user-profile :userId="userId"/>
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
  props: {
    currentUserId: {
      type: Number,
      required: true
    },
    userId: {
      type: Number,
      required: true
    }
  }
}
</script>

<style scoped>
</style>