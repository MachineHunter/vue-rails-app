<template>
  <b-badge class="px-2 py-1 ml-2 h-auto">{{tagName}}</b-badge>
</template>

<script>
import Axios from "axios"
import tagDataManager from "../util/tagDataManager"

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
      // required: true //axiosでロードされる前はundefinedのため
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
      if(this.genres.length === 0
         || this.commandTypes.length === 0
         || this.tagId === undefined
      ) return null

      if(this.tagType === "genre") {
        return this.genres[this.tagId - 1].name
      } else {
        return this.commandTypes[this.tagId - 1].name
      }
    }
  },
  methods: {
    getTagData() {
      document.body.addEventListener("tagdataready", () => {
        this.genres = tagDataManager.tagData.genres
        this.commandTypes = tagDataManager.tagData.commandTypes
      })
      tagDataManager.loadtagData()
    },
  }
}
</script>

<style scoded>

</style>