<template>
  <b-badge class="px-2 py-1 ml-2 h-auto">{{tagName}}</b-badge>
</template>

<script>
import Axios from "axios"

export default {
  props: {
    tagType: {
      type: String,
      required: true,
      validator: function(value) {
        return ["genre", "commandType"].includes(value)
      }
    },
    tagId: {
      type: Number,
      required: true
    }
  },
  data: function() {
    return {
      genres: [],
      commandTypes: []
    }
  },
  created: function() {
    this.getTagData()
  },
  computed: {
    tagName: function() {
      if(this.genres.length === 0 || this.commandTypes.length === 0) return null

      if(this.tagType === "genre") {
        return this.genres[this.tagId - 1].name
      } else {
        return this.commandTypes[this.tagId - 1].name
      }
    }
  },
  methods: {
    getTagData() {
        Axios.get("/api/command/new").then(res => {
        this.genres = res.data.genres
        this.commandTypes = res.data.command_types
        console.log("axios called");
        
      }).catch(err => {
        console.log(err);
      })
    },
  }
}
</script>

<style scoded>

</style>