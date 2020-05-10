<template>
  <b-dropdown
    size="sm"
    :variant="inDetail ? 'outline-dark' : 'link'"
    no-caret
    right
    v-b-hover="onHover"
    :toggle-class="hoverd && !inDetail ? 'bg-light' : ''"
  >
    <template v-slot:button-content>
      <b-icon-three-dots-vertical/>
    </template>
    <b-dropdown-item :href="`/command_pages/download/${this.commandId}`">
      ダウンロード(zip)
    </b-dropdown-item>
    <b-dropdown-item-button
      v-if="inDetail"
      @click="$emit('open-update-form')"
    >
      このコマンドを編集する
    </b-dropdown-item-button>
    <b-dropdown-item-button
      variant="danger"
      @click.stop="$bvModal.show(`modal-for-delete-${commandId}`)"
    >
      このコマンドを消去する
    </b-dropdown-item-button>
    <b-modal
      :id="`modal-for-delete-${commandId}`"
      title="このコマンドを消去する"
      content-class="bg-danger text-white"
    >
      <p class="my-4">本当に消去しますか？この操作は取り消せません</p>
      <template v-slot:modal-footer="{close}">
        <b-button @click="close()" variant="light">戻る</b-button>
        <b-button @click="deleteCommand" variant="outline-warning">消去する</b-button>
      </template>
    </b-modal>
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
    inDetail: {
      type: Boolean,
      required: true
    },
    indexUrl: {
      type: String,
      required: true
    }
  },
  data: function() {
    return {
      hoverd: false
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
        window.location.href = this.indexUrl
        setTimeout(()=>{}, 10000)
        // ここで待たないとmodalが閉じて
        // GET /api/command/[今消したコマンドのid]
        // が呼ばれてしまう
      }).catch(err => {
        console.log(err)
      })
    },
    onHover(isHovered) {
      this.hoverd = isHovered
    }
  }
}
</script>

<style scoped>

</style>