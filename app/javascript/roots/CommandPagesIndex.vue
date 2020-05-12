<template>
  <div id="command-pages-index" class="root-component">
    <common-header :signedIn="signedIn" activeTab="account"></common-header>
    <div>
      <label>user id<input type="number" v-model.number="userId"></label>
      <button type="button" @click="getCommands">change id</button>
    </div>
    <div v-if="!signedIn" class="flex-column flex-x-center flex-y-center my-2">
      <span class="text-center">自分のコマンドを確認するにはログインが必要です</span>
      <b-link href="/users/sign_in">ログイン</b-link>
      <b-link href="/users/sign_up">ユーザー登録</b-link>
    </div>
    <user-commands
      v-if="signedIn"
      :commands="commands"
      :currentUserId="currentUserId"
    />
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
  props: {
    currentUserId: {
      type: Number,
      required: true
    }
  },
  data: function() {
    return {
      commands: null,
      userId: 1
    }
  },
  created: function() {
    this.getCommands()
  },
  computed: {
    signedIn: function() {
      return this.currentUserId !== -1
    }
  },
  methods: {
    getCommands: function() {
      Axios.get(`/api/command/index/${this.userId}`).then(res => {
        const longCommand = {
          id: -1,
          title: "long title ".repeat(10),
          description: "long description ".repeat(30),
          user_id: 1, genre_id: 1, command_type_id: 1
        }
        this.commands = [longCommand, ...res.data.command];
      }).catch(err => {
        console.log(err);
      })
    }
  }
}
</script>

<style scoped>
</style>