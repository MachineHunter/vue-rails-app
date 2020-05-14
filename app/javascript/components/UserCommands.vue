<template>
  <div id="user-commands" class="main-center-100">
    <div>
      <label>user id<input type="number" v-model.number="userId"></label>
      <button type="button" @click="getCommands">change id</button>
    </div>
    <div class="d-flex justify-content-between align-items-center mb-2">
      <h2>コマンド一覧</h2>
      <b-button
        href="/command_pages/new"
        variant="primary"
        pill
        class="mr-2 font-weight-bolder"
      >
        新規コマンド投稿
      </b-button>
    </div>
    
    <b-overlay :show="noCommands" rounded="sm">
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
            :currentUserId="currentUserId"
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
import Axios from "axios"
import Command from "./Command"

export default {
  components: {
    Command
  },
  props: {
    currentUserId: {
      type: Number,
      required: true
    }
  },
  data: function() {
    return {
      commands: null,
      userId: 0,
      currentPage: 1,
      perPage: 5
    }
  },
  computed: {
    noCommands() {
      if(!this.commands) return false
      return this.commands.length === 0
    },
    rows() {
      if(!this.commands) return 0
      return this.commands.length
    },
    commandsToDisplay() {
      if(!this.commands) return []
      const start = (this.currentPage - 1) * this.perPage
      return [...this.commands].splice(start, this.perPage)
    }
  },
  created: function() {
    this.getCommands()
    this.getRememberedPage()
  },
  methods: {
    getCommands: function() {
      Axios.get(`/api/command/index/${this.userId}`).then(res => {
        const longCommand = {
          id: -1,
          title: "long title ".repeat(10),
          description: "long description ".repeat(30),
          user_id: 1, genre_id: 1, command_type_id: 1
        }
        this.commands = [longCommand, ...res.data.command];
      }).catch(err => {
        console.log(err);
      })
    },
    getRememberedPage() {
      const cookiesString = document.cookie
      const cookies = cookiesString.split(";").reduce((acc, cookie) => {
        const [key, value] = cookie.split("=")
        return {...acc, [key.trim()]: value.trim()}
      }, {})
      
      if(cookies["keep_page"] && cookies["current_page"]) {
        this.currentPage = Number(cookies["current_page"])
      }
      document.cookie = "keep_page=;max-age=0"
    }
  },
  watch: {
    currentPage: function(newValue, oldValue) {
      document.cookie = `current_page=${newValue}`
    }
  }
}
</script>

<style scoped>

</style>