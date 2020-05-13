<template>
  <common-layout
    :currentUserId="currentUserId"
    activeTab="account"
    signedInOnly
  >
    <command-create/>
  </common-layout>
</template>

<script>
import CommonLayout from "../components/CommonLayout"
import CommandCreate from "../components/CommandCreate"

export default {
  components: {
    CommonLayout,
    CommandCreate
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