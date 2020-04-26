<template>
  <header id="common-header">
    <b-navbar type="dark" variant="primary" toggleable="md">
      <b-navbar-brand href="#">コマンド投稿ゲーム(仮)</b-navbar-brand>
      <b-navbar-toggle target="nav-items"></b-navbar-toggle>
      <b-collapse is-nav id="nav-items">
        <b-navbar-nav>
          <b-nav-item>TOP</b-nav-item>
          <b-nav-item>リクエスト広場</b-nav-item>
          <b-nav-item>ランキング</b-nav-item>
          <b-nav-item-dropdown text="アカウント" :disabled="!signed_in">
            <b-dropdown-item href="/user_pages/index">プロフィール</b-dropdown-item>
            <b-dropdown-item href="/users/edit">設定</b-dropdown-item>
            <b-dropdown-item
              href="/users/sign_out"
              rel="nofollow"
              data-method="delete"
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
    signed_in: {
      type: Boolean,
      default: false
    }
  }
}
</script>

<style>

</style>