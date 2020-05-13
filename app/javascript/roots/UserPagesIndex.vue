<template>
  <div id="user-pages-index" class="root-component">
    <common-header :signed-in="signedIn" activeTab="account"></common-header>
    <div v-if="!signedIn" class="flex-column flex-x-center flex-y-center my-2">
      <span class="text-center">プロフィールを確認するにはログインが必要です</span>
      <b-link href="/users/sign_in">ログイン</b-link>
      <b-link href="/users/sign_up">ユーザー登録</b-link>
    </div>
    <user-profile v-if="signedIn"></user-profile>
    <common-footer></common-footer>
  </div>
</template>

<script>
import CommonHeader from "../components/CommonHeader"
import CommonFooter from "../components/CommonFooter"
import UserProfile from "../components/UserProfile"

export default {
  components: {
    CommonHeader,
    CommonFooter,
    UserProfile
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
    signedIn() {
      return this.currentUserId !== -1
    }
  },
  methods: {
  }
}
</script>

<style scoped>
</style>