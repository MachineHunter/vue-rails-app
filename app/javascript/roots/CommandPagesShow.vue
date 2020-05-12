<template>
    <div id="command-pages-show" class="root-component">
    <common-header :signedIn="signedIn"></common-header>
    <command-detail
      :commandId="commandId"
      :currentUserId="currentUserId"
    />
    <common-footer></common-footer>
  </div>
</template>

<script>
import CommonHeader from "../components/CommonHeader"
import CommonFooter from "../components/CommonFooter"
import CommandDetail from "../components/CommandDetail"

export default {
  components: {
    CommonHeader,
    CommonFooter,
    CommandDetail
  },
  props: {
    commandId: {
      type: Number,
      required: true
    },
    currentUserId: {
      type: Number,
      required: true
    }
  },
  computed: {
    signedIn: function() {
      return this.currentUserId !== -1
    }
  },
  created: function() {
    document.cookie = "keep_page=true"
  }
}
</script>

<style scoped>

</style>