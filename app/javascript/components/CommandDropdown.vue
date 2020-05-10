<template>
  <b-dropdown
    size="sm"
    :variant="outlined ? 'outline-dark' : 'link'"
    no-caret
    right
  >
    <template v-slot:button-content>
      <b-icon-three-dots-vertical/>
    </template>
    <b-dropdown-item :href="`/command_pages/download/${this.commandId}`">
      ダウンロード(zip)
    </b-dropdown-item>
    <b-dropdown-item-button
      variant="danger"
      @click="deleteCommand"
    >
      このコマンドを消去する
    </b-dropdown-item-button>
  </b-dropdown>
</template>

<script>
import Axios from "axios"

export default {
  props: {
    commandId: {
      type: Number,
      required: true
    },
    outlined: {
      type: Boolean,
      required: true
    }
  },
  mounted: function() {
    const token = document.querySelector("meta[name=csrf-token]").getAttribute("content")
    Axios.defaults.headers["X-CSRF-TOKEN"] = token
  },
  methods: {
    downloadCommand() {
      window.location.href = `/command_pages/download/${this.commandId}`
    },
    deleteCommand() {
      Axios.delete(`/api/command/${this.commandId}`).then(res =>{
        window.location.href = res.request.responseURL
      }).catch(err => {
        console.log(err)
      })
    }
  }
}
</script>

<style scoped>

</style>