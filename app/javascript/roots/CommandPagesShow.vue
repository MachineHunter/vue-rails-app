<template>
    <div id="command-pages-show" class="root-component">
    <common-header :signedIn="true"></common-header>
    <command-detail :commandId="commandId"></command-detail>
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
    }
  }
}
</script>

<style scoped>

</style>