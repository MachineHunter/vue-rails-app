<template>
  <div id="command-pages-index" class="root-component">
    <common-header :signed-in="!noCommands" activeTab="account"></common-header>
    <div v-if="noCommands" class="flex-column flex-x-center flex-y-center my-2">
      <span class="text-center">自分のコマンドを確認するにはログインが必要です</span>
      <b-link href="/users/sign_in">ログイン</b-link>
      <b-link href="/users/sign_up">ユーザー登録</b-link>
    </div>
    <user-commands v-if="commandsExist" :commands="commands"></user-commands>
    <common-footer></common-footer>
  </div>
</template>

<script>
import Axios from "axios"
import CommonHeader from "../components/CommonHeader"
import CommonFooter from "../components/CommonFooter"
import UserCommands from "../components/UserCommands"

export default {
  components: {
    CommonHeader,
    CommonFooter,
    UserCommands
  },
  data: function() {
    return {
      commands: [],
      finishedRequestingCommands: false
    }
  },
  created: function() {
    this.getCommands()
  },
  computed: {
    noCommands: function() {
      return this.commands.length === 0 && this.finishedRequestingCommands
    },
    commandsExist: function() {
      return this.commands.length > 0 && this.finishedRequestingCommands
    }
  },
  methods: {
    getCommands: function() {
      Axios.get("/api/command/index").then(res => {
        this.commands = res.data.command;
      }).catch(err => {
        console.log(err);
        
      }).finally(() => {
        this.finishedRequestingCommands = true
      });
    }
  }
}
</script>

<style scoped>
</style>