<template>
  <common-layout
    :currentUserId="currentUserId"
    activeTab="account"
  >
    <command-detail
      :commandId="commandId"
      :currentUserId="currentUserId"
    />
  </common-layout>
</template>

<script>
import CommonLayout from "../components/CommonLayout"
import CommandDetail from "../components/CommandDetail"

export default {
  components: {
    CommonLayout,
    CommandDetail
  },
  props: {
    currentUserId: {
      type: Number,
      required: true
    },
    commandId: {
      type: Number,
      required: true
    }
  }
}
</script>

<style scoped>
</style>