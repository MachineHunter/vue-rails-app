<template>
  <div :class="`root-component${is100 ? '-100' : ''}`">
    <common-header :signedIn="signedIn" :activeTab="activeTab" />
    <div
      v-if="!signedIn && signedInOnly"
      class="flex-column flex-x-center flex-y-center my-2"
    >
      <span class="text-center">このページを閲覧するにはログインが必要です</span>
      <b-link href="/users/sign_in">ログイン</b-link>
      <b-link href="/users/sign_up">ユーザー登録</b-link>
    </div>
    <slot v-else :currentUserId="currentUserId"/>
    <common-footer />
  </div>
</template>

<script>
import CommonHeader from "./CommonHeader"
import CommonFooter from "./CommonFooter"

export default {
  components: {
    CommonHeader,
    CommonFooter
  },
  props: {
    currentUserId: {
      type: Number,
      required: true
    },
    activeTab: {
      type: String,
      validator: function(value) {
        return ["top", "requestPlaza", "ranking", "account", undefined].includes(value)
      }
    },
    signedInOnly: {
      type: Boolean,
      defeault: false
    },
    is100: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    signedIn() {
      return this.currentUserId !== -1
    }
  }
}
</script>

<style scoped>
</style>