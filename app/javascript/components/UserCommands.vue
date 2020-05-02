<template>
  <div id="user-commands" class="main-center-100">
    <h2>コマンド一覧</h2>
    
    <b-overlay :show="commands.length === 0" rounded="sm">
      <div>
        <b-pagination
          v-model="currentPage"
          :total-rows="rows"
          :per-page="perPage"
          aria-controls="commands-table"
          align="center"
          first-number
          last-number
        />

        <div>
          <command
            v-for="command in commandsToDisplay"
            :key="command.id"
            :command="command"
            class="my-1"
          />
        </div>

        <b-pagination
          v-model="currentPage"
          :total-rows="rows"
          :per-page="perPage"
          aria-controls="commands-table"
          align="center"
          first-number
          last-number
          class="mt-3"
        />
      </div>
      <template v-slot:overlay>
        <div class="text-center">
          投稿したコマンドはまだありません
        </div>
      </template>
    </b-overlay>
  </div>
</template>

<script>
import Command from "./Command"

export default {
  components: {
    Command
  },
  props: {
    commands: {
      type: Array,
      required: true
    }
  },
  data: function() {
    return {
      currentPage: 1,
      perPage: 5
    }
  },
  computed: {
    rows() {
      return this.commands.length
    },
    commandsToDisplay() {
      const start = (this.currentPage - 1) * this.perPage
      return [...this.commands].splice(start, this.perPage)
    }
  }
}
</script>

<style scoped>

</style>