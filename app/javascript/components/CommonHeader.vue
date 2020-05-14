<template>
  <header id="common-header">
    <b-navbar type="dark" variant="primary" toggleable="md">
      <b-navbar-brand href="/">コマンド投稿ゲーム(仮)</b-navbar-brand>
      <b-navbar-toggle target="nav-items"></b-navbar-toggle>
      <b-collapse is-nav id="nav-items">
        <b-navbar-nav>
          <b-nav-item
            :active="activeTab === 'top'"
          >
            TOP
          </b-nav-item>
          <b-nav-item
            :active="activeTab === 'requestPlaza'"
          >
            リクエスト広場
          </b-nav-item>
          <b-nav-item
            :active="activeTab === 'ranking'"
          >
            ランキング
          </b-nav-item>
        </b-navbar-nav>
        <b-navbar-nav class="ml-auto">
          <b-nav-item-dropdown
            text="アカウント"
            :disabled="!signedIn"
            right
            :class="{'text-white-important-parent': activeTab === 'account' && signedIn}"
          >
            <b-dropdown-item href="/user_pages/0">プロフィール</b-dropdown-item>
            <b-dropdown-item href="/users/edit">設定</b-dropdown-item>
            <b-dropdown-item
              href="/users/sign_out"
              rel="nofollow"
              data-method="delete"
              link-class="text-danger"
            >
              ログアウト
            </b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </header>
</template>

<script>
export default {
  props: {
    signedIn: {
      type: Boolean,
      default: false
    },
    activeTab: {
      type: String,
      validator: function(value) {
        return ["top", "requestPlaza", "ranking", "account", undefined].includes(value)
      }
    }
  }
}
</script>

<style>
.text-white-important-parent span {
  color: rgb(255, 255, 255, 1) !important;
}
</style>