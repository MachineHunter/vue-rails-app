<template>
  <div class="main-center">
      <h2>新規コマンド投稿</h2>

      <b-form
        @submit.prevent="submitCommand"
        novalidate
        :validated="validated"
      >
        <b-form-group label="タイトル">
          <b-form-input
            v-model="command.title"
            id="title"
            required
          />
          <b-form-invalid-feedback>
            コマンドのタイトルを入力してください
          </b-form-invalid-feedback>
        </b-form-group>

        <b-form-group label="説明">
          <b-form-textarea
            v-model="command.description"
            id="description"
            required
            rows="3"
            max-rows="6"
          />
          <b-form-invalid-feedback>
            コマンドの説明を入力してください
          </b-form-invalid-feedback>
        </b-form-group>
        
        <b-form-group label="ジャンル">
          <b-form-radio-group
            v-model="command.genre_id"
            id="genre_id"
            :options="genreOptions"
            required
          >
            <b-form-invalid-feedback :state="stateOf(command.genre_id)">
              コマンドのジャンルを選択してください
            </b-form-invalid-feedback>
          </b-form-radio-group>
        </b-form-group>
        
        <b-form-group label="タイプ">
          <b-form-radio-group
            v-model="command.command_type_id"
            id="command_type_id"
            :options="commandTypeOptions"
            required
          >
            <b-form-invalid-feedback :state="stateOf(command.command_type_id)">
              コマンドのタイプを選択してください
            </b-form-invalid-feedback>
          </b-form-radio-group>
        </b-form-group>
                
        <b-form-group label="Zipファイル">
          <b-form-file
            v-model="command.zipdata"
            id="zipdata"
            accept="application/zip"
            required
            placeholder="ファイルを選択してください"
          >
          </b-form-file>
          <b-form-invalid-feedback :state="stateOf(command.zipdata)">
            投稿するファイルを選択してください
          </b-form-invalid-feedback>
        </b-form-group>

        <div class="flex-x-center">
          <b-button
            type="submit"
            variant="outline-primary"
            id="submit-command"
          >
            投稿
          </b-button>
        </div>
      </b-form>
    </div>
</template>

<script>
import Axios from "axios"

export default {
  data: function() {
    return {
      command: {
        title: "",
        description: "",
        genre_id: null,
        command_type_id: null,
        zipdata: null
      },
      genres: [],
      commandTypes: [],
      validated: false
    }
  },
  computed: {
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
    stateOf: function() {
      const self = this
      return function(value) {
        return self.validated ? !!value : null
      }
    },
    zipFileName: function() {
      return this.command.zipdata.name
    }
  },
  created: function() {
    this.getTagData()
  },
  mounted: function() {
    const token = document.querySelector("meta[name=csrf-token]").getAttribute("content")
    Axios.defaults.headers["X-CSRF-TOKEN"] = token
    Axios.defaults.headers["content-type"] = "multipart/form-data"
  },
  methods: {
    getTagData() {
        Axios.get("/api/command/new").then(res => {
        this.genres = res.data.genres
        this.commandTypes = res.data.command_types
      }).catch(err => {
        console.log(err)
      })
    },
    submitCommand() {
      this.validated = true
      const form = document.getElementsByTagName("form")[0]
      if(form.checkValidity() === false) return;

      const params = new FormData()
      Object.entries(this.command).forEach(([param, value]) =>{
        params.append(param, value)
      })
      params.append("filename", this.zipFileName)
      Axios.post("/api/command", params).then(res =>{
        window.location.href = res.request.responseURL
      }).catch(err => {
        console.log(err)
      })
    }
  }
}
</script>

<style scoped>
</style>