<template>
  <div id="main-command-list" class="main-center-100">
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
        <h4>filter</h4>
        <b-form-group label="genre">
          <b-form-checkbox-group
            v-model="filterOptions.genreIds"
            :options="genreOptions"
          />
        </b-form-group>
        
        <b-form-group label="command type">
          <b-form-checkbox-group
            v-model="filterOptions.commandTypeIds"
            :options="commandTypeOptions"
          />
        </b-form-group>
        <h4>sort</h4>
        <b-form-group>
          <b-form-radio-group v-model="sortOptions.key">
            <b-form-radio value="id">id</b-form-radio>
            <b-form-radio value="title">title</b-form-radio>
          </b-form-radio-group>
        </b-form-group>
        <b-form-group>
          <b-form-radio-group v-model="sortOptions.ascending">
            <b-form-radio :value="true">ascending</b-form-radio>
            <b-form-radio :value="false">descending</b-form-radio>
          </b-form-radio-group>
        </b-form-group>
      </div>
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
import Axios from "axios"
import {mapState} from "vuex"
import Command from "./Command"

export default {
  components: {
    Command
  },
  data: function() {
    return {
      commands: null,
      userId: 0,
      currentPage: 1,
      perPage: 5,
      filterOptions: {
        genreIds: [],
        commandTypeIds: []
      },
      sortOptions: {
        key: "id", // "id" or "title"
        ascending: true
      }
    }
  },
  computed: {
    ...mapState(["genres", "commandTypes"]),
    noCommands() {
      if(!this.commands) return false
      return this.commands.length === 0
    },
    optionForFilterByUser() {
      const userId = this.cookies["user_id"]
      return userId ? [Number(userId)] : [-1] //[-1] means all
    },
    noUserFilter() {
      if(!this.optionForFilterByUser) return false
      return this.optionForFilterByUser[0] === -1
    },
    genreOptions: function() {
      return this.genres.map(genre => (
        {
          text: genre.name,
          value: genre.id
        }
      ))
    },
    commandTypeOptions: function() {
      return this.commandTypes.map(type => (
        {
          text: type.name,
          value: type.id
        }
      ))
    },
    computedCommands() {
      if(!this.commands) return []
      const filteredCommands = this.commands.filter(command => {
        let result = true
        result = this.noUserFilter ?
          result : (result && this.optionForFilterByUser.includes(command.owner.id))
        return result &&
          this.filterOptions.genreIds.includes(command.genre_id) &&
          this.filterOptions.commandTypeIds.includes(command.command_type_id)
      })
      const sortedFilteredCommands = filteredCommands.sort((command1, command2) => {
        let result = 0
        if(command1[this.sortOptions.key] < command2[this.sortOptions.key]) {
          result = -1
        } else if(command1[this.sortOptions.key] === command2[this.sortOptions.key]) {
          result = 0
        } else {
          result = 1
        }
        return this.sortOptions.ascending ? result : (-result)
      })
      return sortedFilteredCommands
    },
    rows() {
      if(!this.computedCommands) return 0
      return this.computedCommands.length
    },
    commandsToDisplay() {
      if(!this.computedCommands) return []
      const start = (this.currentPage - 1) * this.perPage
      return [...this.computedCommands].splice(start, this.perPage)
    },
    cookies() {
      return this.$store.state.cookies
    }
  },
  created: function() {
    this.getCommands()
    this.getRememberedPage()
  },
  methods: {
    getCommands: function() {
      Axios.get("/api/command").then(res => {
        this.commands = res.data.command
      }).catch(err => {
        console.log(err)
      })
    },
    getRememberedPage() {
      const cookies = this.cookies
      
      if(cookies["keep_page"] && cookies["current_page"]) {
        this.currentPage = Number(cookies["current_page"])
      }
      // document.cookie = "keep_page=;max-age=0;path=/"
    }
  },
  watch: {
    currentPage: function(newValue, oldValue) {
      document.cookie = `current_page=${newValue};path=/`
    },
    genres: function(newValue, oldValue) {
      this.filterOptions.genreIds = newValue.map(genre => genre.id)
    },
    commandTypes: function(newValue, oldValue) {
      this.filterOptions.commandTypeIds = newValue.map(commandType => commandType.id)
    }
  }
}
</script>

<style scoped>

</style>