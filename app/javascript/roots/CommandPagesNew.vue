<template>
  <common-layout
    :currentUserId="currentUserId"
    activeTab="account"
    signedInOnly
  >
    <main-command-create-form/>
  </common-layout>
</template>

<script>
import CommonLayout from "../components/CommonLayout"
import MainCommandCreateForm from "../components/MainCommandCreateForm"

export default {
  components: {
    CommonLayout,
    MainCommandCreateForm
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