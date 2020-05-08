<template>
  <div id="command-detail" class="main-center-100">
    <h2>{{command.title}}</h2>
    <div class="mb-4">
      <command-tag tagType="genre" :tagId="2"/>
      <command-tag tagType="commandType" :tagId="2"/>
    </div>

    <command-explorer
      :fileName="fileName"
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

export default {
  components: {
    CommandExplorer,
    CommandTag
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