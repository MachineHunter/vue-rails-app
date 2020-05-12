<template>
  <div id="user-pages-index" class="root-component">
    <common-header :signed-in="!noUser" activeTab="account"></common-header>
    <div>
      <label>user id<input type="number" v-model.number="userId"></label>
      <button type="button" @click="getUserData">change id</button>
    </div>
    <div v-if="noUser" class="flex-column flex-x-center flex-y-center my-2">
      <span class="text-center">プロフィールを確認するにはログインが必要です</span>
      <b-link href="/users/sign_in">ログイン</b-link>
      <b-link href="/users/sign_up">ユーザー登録</b-link>
    </div>
    <user-profile v-if="userExists" :user="user"></user-profile>
    <common-footer></common-footer>
  </div>
</template>

<script>
import Axios from "axios"
import CommonHeader from "../components/CommonHeader"
import CommonFooter from "../components/CommonFooter"
import UserProfile from "../components/UserProfile"

export default {
  components: {
    CommonHeader,
    CommonFooter,
    UserProfile
  },
  data: function() {
    return {
      user: {},
      finishedRequestingUser: false,
      userId: 1
    }
  },
  created: function() {
    this.getUserData()
  },
  computed: {
    noUser: function() {
      return Object.keys(this.user).length === 0 && this.finishedRequestingUser
    },
    userExists: function() {
      return Object.keys(this.user).length > 0 && this.finishedRequestingUser
    }
  },
  methods: {
    getUserData: function() {
      Axios.get(`/api/user_pages/index/${this.userId}`).then(res => {
        this.user = res.data.user;
      }).catch(err => {
        console.log(err);
        
      }).finally(() => {
        this.finishedRequestingUser = true
      });
    }
  }
}
</script>

<style scoped>
</style>