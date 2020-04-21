<template>
  <div id="user-pages-index">
    <common-header></common-header>
    <p>bootstrap test</p>
    <div>
      <b-button variant="primary">Primary</b-button>
      <b-button variant="secondary">Secondary</b-button>
      <b-button variant="success">Success</b-button>
      <b-button variant="danger">Danger</b-button>
      <b-button variant="warning">Warning</b-button>
      <b-button variant="info">Info</b-button>
      <b-button variant="light">Light</b-button>
      <b-button variant="dark">Dark</b-button>
    </div>
    <div>
      <b-button variant="outline-primary">Primary</b-button>
      <b-button variant="outline-secondary">Secondary</b-button>
      <b-button variant="outline-success">Success</b-button>
      <b-button variant="outline-danger">Danger</b-button>
      <b-button variant="outline-warning">Warning</b-button>
      <b-button variant="outline-info">Info</b-button>
      <b-button variant="outline-light">Light</b-button>
      <b-button variant="outline-dark">Dark</b-button>
    </div>
    <common-footer></common-footer>
  </div>
</template>

<script>
import CommonHeader from "../components/CommonHeader"
import CommonFooter from "../components/CommonFooter"
export default {
  components: {
    CommonHeader,
    CommonFooter
  }
}
</script>

<style>

</style>