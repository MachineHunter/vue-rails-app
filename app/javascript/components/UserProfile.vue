<template>
  <div id="user-profile" class="main-center">
    <div>
      <label>user id<input type="number" v-model.number="userId"></label>
      <button type="button" @click="getUserData();getAvatar();">change id</button>
    </div>
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
          <b-link href="/command_pages/index" class="align-top ml-2">もっと見る</b-link>
        </header>
        <b-card-group deck>
          <b-card
            v-for="i in 3"
            :key="`command${i}`"
            :title="`command${i}`"
          >
            <b-card-text>
              description here description here description here
            </b-card-text>
          </b-card>
        </b-card-group>
      </div>
    </div>
</template>

<script>
import Axios from "axios"

export default {
    props: {
    },
    data: function() {
      return {
        userId: 0,
        user: {},
        avatar: null
      }
    },
    created: function() {
      this.getUserData()
      this.getAvatar()
    },
    methods: {
      getUserData: function() {
        Axios.get(`/api/user_pages/index/${this.userId}`).then(res => {
          this.user = res.data.user
        }).catch(err => {
          console.log(err)
        })
      },
      //Axiosを使わず<img src="/api/user_pages/avatar">でも可だが、
      //その場合読み込めたかった際の処理がうまくいかなかった
      getAvatar: function(){
        Axios.get(`/api/avatar/index/${this.userId}`, {responseType: "blob"}).then(res => {
          this.avatar = window.URL.createObjectURL(res.data)
        }).catch(err => {
          console.log(err)
        });
      }
    }
}
</script>

<style scoped>

</style>