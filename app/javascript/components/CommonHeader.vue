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
          <b-nav-item-dropdown text="アカウント">
            <b-dropdown-item>プロフィール</b-dropdown-item>
            <b-dropdown-item>設定</b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </header>
</template>

<script>
export default {

}
</script>

<style>

</style>