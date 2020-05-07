<template>
  <div id="command-detail" class="main-center">
    <h2>{{command.title}}</h2>
    <b-badge>genre{{command.genre_id}}</b-badge>
    <b-badge>type{{command.command_type_id}}</b-badge>

    <br/>
    <h5>{{fileName}}</h5>
    <command-file-tree :children="[fileTree]" :fileContents="fileContents"/>
    <p>{{fileContents}}</p>

    <br/>
    <p>description</p>
    <p>{{command.description}}</p>
  </div>
</template>

<script>
import Axios from "axios"
import CommandFileTree from "./CommandFileTree"

export default {
  components: {
    CommandFileTree
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
      fileName: "",
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
        this.fileName = res.data.filename
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