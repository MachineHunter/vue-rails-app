<template>
  <div id="command-detail" class="main-center-100">
    <h2>{{command.title}}</h2>
    <div class="mb-4">
      <b-badge class="mr-1">genre{{command.genre_id}}</b-badge>
      <b-badge>type{{command.command_type_id}}</b-badge>
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

export default {
  components: {
    CommandExplorer
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