<template>
  <common-layout
    :currentUserId="currentUserId"
    activeTab="account"
  >
    <main-command-detail
      :commandId="commandId"
      :currentUserId="currentUserId"
    />
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