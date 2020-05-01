<template>
  <div id="user-commands" class="main-center">
    <h2>コマンド一覧</h2>
    
    <div class="overflow-auto">
      <b-table
        id="commands-table"
        :items="commands"
        :fields="fields"
        :per-page="perPage"
        :current-page="currentPage"
        small
      />
      <b-pagination
        v-model="currentPage"
        :total-rows="rows"
        :per-page="perPage"
        aria-controls="commands-table"
      />
    </div>
  </div>
</template>

<script>
export default {
  props: {
    commands: {
      type: Array,
      required: true
    }
  },
  data: function() {
    return {
      fields: ["title", "description", "user_id", "genre_id", "command_type_id"],
      currentPage: 1,
      perPage: 5
    }
  },
  computed: {
    rows() {
      return this.commands.length
    }
  }
}
</script>

<style scoped>

</style>