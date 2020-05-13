<template>
  <common-layout
    :currentUserId="currentUserId"
    activeTab="account"
  >
    <main-command-list
      :currentUserId="currentUserId"
    />
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