<template>
  <b-badge class="px-2 py-1 ml-2 h-auto">{{tagName}}</b-badge>
</template>

<script>
import {mapState} from "vuex"

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
      type: Number
    }
  },
  computed: {
    ...mapState(["genres", "commandTypes"]),
    tagName: function() {
      if(this.genres.length === 0
         || this.commandTypes.length === 0
         || this.tagId === undefined
      ) return " "
      return this[`${this.tagType}s`][this.tagId - 1].name
    }
  }
}
</script>

<style scoded>

</style>