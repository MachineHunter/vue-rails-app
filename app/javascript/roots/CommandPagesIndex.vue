<template>
  <div id="command-pages-index" class="root-component">
    <common-header :signedIn="signedIn" activeTab="account"></common-header>
    <div v-if="!signedIn" class="flex-column flex-x-center flex-y-center my-2">
      <span class="text-center">自分のコマンドを確認するにはログインが必要です</span>
      <b-link href="/users/sign_in">ログイン</b-link>
      <b-link href="/users/sign_up">ユーザー登録</b-link>
    </div>
    <user-commands
      v-if="signedIn"
      :currentUserId="currentUserId"
    />
    <common-footer></common-footer>
  </div>
</template>

<script>
import CommonHeader from "../components/CommonHeader"
import CommonFooter from "../components/CommonFooter"
import UserCommands from "../components/UserCommands"

export default {
  components: {
    CommonHeader,
    CommonFooter,
    UserCommands
  },
  props: {
    currentUserId: {
      type: Number,
      required: true
    }
  },
  data: function() {
    return {
    }
  },
  created: function() {
  },
  computed: {
    signedIn: function() {
      return this.currentUserId !== -1
    }
  },
  methods: {
  }
}
</script>

<style scoped>
</style>