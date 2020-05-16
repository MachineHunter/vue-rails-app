<template>
  <div id="main-user-profile" class="main-center-100">
      <b-media>
        <template v-slot:aside>
          <b-img
            :blank="!avatar"
            blank-color="#ccc"
            :src="avatar"
            width="200"
            alt="user-icon"
            fluid
            thumbnail
          />
        </template>
        <h3>{{user.name}}</h3>
        <hr>
        <h6>ステータス</h6>
        <b-list-group>
          <b-list-group-item
            v-for="(statusPoint, statusType) in user.status"
            :key="statusType"
            class="d-flex justify-content-between align-items-center"
          >
          {{statusType}}
          <b-badge variant="primary" pill>{{statusPoint}}</b-badge>
          </b-list-group-item>
        </b-list-group>

      </b-media>
      <div class="mt-3">
        <header class="mb-1">
          <h5 class="d-inline">人気のコマンド</h5>
          <b-link
            href="/command_pages"
            @click="clickSeeMore"
            class="align-top ml-2"
          >
            もっと見る
          </b-link>
        </header>
        <command
          v-for="command in popularCommands"
          :key="command.id"
          :command="command"
          class="mb-2"
        />
      </div>
    </div>
</template>

<script>
import Axios from "axios"
import Command from "./Command"

export default {
  components: {
    Command
  },
    data: function() {
      return {
        user: {},
        avatar: null,
        popularCommands: []
      }
    },
    created: function() {
      this.getUserData()
      this.getAvatar()
      this.getPopularCommands()
    },
    computed: {
      userId() {
        return this.$store.state.userId
      }
    },
    methods: {
      getUserData: function() {
        Axios.get(`/api/user_pages/${this.userId}`).then(res => {
          this.user = res.data.user
        }).catch(err => {
          console.log(err)
        })
      },
      //Axiosを使わず<img src="/api/user_pages/avatar">でも可だが、
      //その場合読み込めたかった際の処理がうまくいかなかった
      getAvatar: function(){
        Axios.get(`/api/avatar/${this.userId}`, {responseType: "blob"}).then(res => {
          this.avatar = window.URL.createObjectURL(res.data)
        }).catch(err => {
          console.log(err)
        });
      },
      getPopularCommands() {
        this.popularCommands = [1,2,3].map(i => (
          {
            id: -i,
            title: `dummy${i}`,
            description: `description${i} description${i}`,
            genre_id: 1,
            command_type_id: 1,
            owner: {name: "Mr. dummy", id: -i}
          }
        ))
      },
      clickSeeMore() {
        document.cookie = `user_id=${this.userId};path=/`
      }
    }
}
</script>

<style scoped>

</style>