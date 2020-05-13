<template>
  <common-layout
    :currentUserId="currentUserId"
    activeTab="account"
  >
    <user-commands
      :currentUserId="currentUserId"
    />
  </common-layout>
</template>

<script>
import CommonLayout from "../components/CommonLayout"
import UserCommands from "../components/UserCommands"

export default {
  components: {
    CommonLayout,
    UserCommands
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