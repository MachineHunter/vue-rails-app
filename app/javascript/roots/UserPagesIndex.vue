<template>
  <div id="user-pages-index">
    <common-header></common-header>
    <div id="user-profile" class="px-5">
      <b-media>
        <template v-slot:aside>
          <b-img
            blank
            blank-color="#ccc"
            width="100%"
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
      <div class="my-2">
      </div>
      <div class="mt-3">
        <header>
          <h5 class="d-inline">人気のコマンド</h5>
          <b-link class="align-top ml-2">もっと見る</b-link>
        </header>
        <b-card-group deck>
          <b-card
            v-for="i in 3"
            :key="`command${i}`"
            :title="`commoand${i}`"
          >
            <b-card-text>
              description here description here description here
            </b-card-text>
          </b-card>
        </b-card-group>
      </div>
    </div>
    <common-footer></common-footer>
  </div>
</template>

<script>
import Axios from "axios"
import CommonHeader from "../components/CommonHeader"
import CommonFooter from "../components/CommonFooter"

export default {
  components: {
    CommonHeader,
    CommonFooter
  },
  data: function() {
    return {
      user: {}
    }
  },
  created: function() {
    this.getUserData()
  },
  methods: {
    getUserData: function() {
      Axios.get("/api/user_pages/index").then(res => {
        this.user = res.data.user;
      }).catch(err => {
        console.log(err);
        
      });
    }
  }
}
</script>

<style>
#user-profile {
  max-width: 1080px;
  margin: 1rem auto;
}
</style>