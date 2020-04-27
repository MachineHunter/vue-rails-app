<template>
  <div id="user-pages-index" class="root-component">
    <common-header :signed-in="!noUser"></common-header>
    <div v-if="noUser" class="flex-column flex-x-center flex-y-center my-2">
      <span class="text-center">プロフィールを確認するにはログインが必要です</span>
      <b-link href="/users/sign_in">ログイン</b-link>
      <b-link href="/users/sign_up">ユーザー登録</b-link>
    </div>
    <user-profile v-else :user="user" class="px-3"></user-profile>
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
      user: {}
    }
  },
  created: function() {
    this.getUserData()
  },
  computed: {
    noUser: function() {
      return Object.keys(this.user).length === 0
    }
  },
  methods: {
    getUserData: function() {
      Axios.get("/api/user_pages/index").then(res => {
        this.user = res.data.user;
      }).catch(err => {
        console.log(err);
        
      });
    }
  }
}
</script>

<style>
#user-profile {
  max-width: 1080px;
  margin: 1rem auto;
}
</style>