<template>
  <div id="user-profile">
      <b-media>
        <template v-slot:aside>
          <b-img
            :blank="!icon"
            blank-color="#ccc"
            :src="icon"
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
          <b-link class="align-top ml-2">もっと見る</b-link>
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
export default {
    props: {
        user: {
            type: Object,
            required: true
        }
    },
    data: function() {
      return {
        icon: null
      }
    },
    created: function() {
      this.getIcon()
    },
    methods: {
      getIcon: function(){
        import(`images/avatars/${this.user.avatar}`).then(result => {
          this.icon = result.default
        }).catch(err => {
          console.log(err)
        });
      },
    }
}
</script>

<style scoped>

</style>