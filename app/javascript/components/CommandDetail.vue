<template>
  <div id="command-detail" class="main-center-100">
    <h2>{{command.title}}</h2>
    <div class="d-flex justify-content-between flex-y-center mb-2">
      <div>
        <command-tag tagType="genre" :tagId="command.genre_id"/>
        <command-tag tagType="commandType" :tagId="command.command_type_id"/>
      </div>
      <command-dropdown :commandId="commandId" :outlined="true"/>
    </div>

    <command-explorer
      :fileTree="fileTree"
      :fileContents="fileContents"
      class="mb-3"
    />

    <b-card title="description">
      <p>{{command.description}}</p>
    </b-card>
  </div>
</template>

<script>
import Axios from "axios"
import CommandExplorer from "./CommandExplorer"
import CommandTag from "./CommandTag"
import CommandDropdown from "./CommandDropdown"

export default {
  components: {
    CommandExplorer,
    CommandTag,
    CommandDropdown
  },
  props: {
    commandId: {
      type: Number,
      required: true
    }
  },
  data: function() {
    return {
      command: {},
      fileTree: {},
      fileContents: {}
    }
  },
  created: function() {
    this.getCommandData()
  },
  methods: {
    getCommandData: function() {
      Axios.get(`/api/command/${this.commandId}`).then(res => {
        this.command = res.data.command
        this.fileTree = res.data.filetree
        this.fileContents = res.data.filedatas
      }).catch(err => {
        console.log(err);
      })
    }
  }
}
</script>

<style scoped>

</style>