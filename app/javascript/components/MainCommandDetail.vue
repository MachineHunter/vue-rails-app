<template>
  <div id="main-command-detail" class="main-center-100">
    <h2>{{command.title}}</h2>
    <div class="d-flex justify-content-between flex-y-center mb-2">
      <div>
        <command-tag tagType="genre" :tagId="command.genre_id"/>
        <command-tag tagType="commandType" :tagId="command.command_type_id"/>
      </div>
      <command-dropdown
        :commandId="commandId"
        :inDetail="true"
        :isMine="isMine"
        :indexUrl="indexUrl"
        @open-update-form="$bvModal.show('modal-for-update')"
      />
    </div>

    <command-explorer
      :fileTree="fileTree"
      :fileContents="fileContents"
      class="mb-3"
    />

    <b-card title="description">
      <p>{{command.description}}</p>
    </b-card>

    <b-modal
      v-if="isMine"
      id="modal-for-update"
      title="コマンドの編集"
      centered
      hide-backdrop
      content-class="shadow"
      hide-footer
      size="xl"
    >
      <command-update-form :prevCommand="command"/>
    </b-modal>
  </div>
</template>

<script>
import Axios from "axios"
import CommandExplorer from "./CommandExplorer"
import CommandTag from "./CommandTag"
import CommandDropdown from "./CommandDropdown"
import CommandUpdateForm from "./CommandUpdateForm"

export default {
  components: {
    CommandExplorer,
    CommandTag,
    CommandDropdown,
    CommandUpdateForm
  },
  props: {
    commandId: {
      type: Number,
      required: true
    },
    currentUserId: {
      type: Number,
      required: true
    }
  },
  data: function() {
    return {
      command: {},
      fileTree: {},
      fileContents: {},
      indexUrl: ""
    }
  },
  created: function() {
    this.getCommandData()
  },
  computed: {
    isMine() {
      if(!this.command.user_id) return null
      return this.command.user_id === this.currentUserId
    }
  },
  methods: {
    getCommandData: function() {
      Axios.get(`/api/command/${this.commandId}`).then(res => {
        this.command = res.data.command
        this.fileTree = res.data.filetree
        this.fileContents = res.data.filedatas
        this.indexUrl = res.data.index_url
      }).catch(err => {
        console.log(err);
      })
    }
  }
}
</script>

<style scoped>

</style>