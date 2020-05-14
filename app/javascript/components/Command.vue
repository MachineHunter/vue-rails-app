<template>
  <b-card class="command" @click="moveToDetail">
    <b-media no-body>
      <b-media-aside>
        <b-img blank blank-color="#ccc" width="64" alt="placeholder"></b-img>
      </b-media-aside>
      <b-media-body class="command-body pl-3">
        <div class="d-flex justify-content-between align-items-center mb-1">
          <h5 class="command-title mb-0 py-1">{{command.title}}</h5>
          <div class="d-flex">
            <div class="d-flex justify-content-end align-items-center badges-sm-direction">
              <command-tag tagType="genre" :tagId="command.genre_id" class=" badge-sm-mb"/>
              <command-tag tagType="commandType" :tagId="command.command_type_id"/>
            </div>
            <command-dropdown
              :commandId="command.id"
              :inDetail="false"
              :isMine="isMine"
              class="ml-1"
            />
          </div>
        </div>
        <div>
          <span>作成者：</span>
          <b-link :href="`/user_pages/${command.owner.id}`">
            {{command.owner.name}}
          </b-link>
        </div>
        <hr class="my-1">
        <p class="mb-0 command-description">
          {{command.description}}
        </p>
      </b-media-body>
    </b-media>
  </b-card>
</template>

<script>
import CommandTag from "./CommandTag"
import CommandDropdown from "./CommandDropdown"

export default {
  components: {
    CommandTag,
    CommandDropdown
  },
  props: {
    command: {
      type: Object,
      required: true
    },
    currentUserId: {
      type: Number,
      required: true
    }
  },
  computed: {
    isMine() {
      if(!this.command.user_id) return null
      return this.command.user_id === this.currentUserId
    }
  },
  methods: {
    moveToDetail() {
      document.location.href=`/command_pages/${this.command.id}`
    }
  }
}
</script>

<style scoped>
.command {
  cursor: pointer;
}
.command:hover {
  background-color: #f0f0f0;
}
.command-body {
  width: calc(100% - 64px);
}
.command-title {
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}
.command-description {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}
@media (max-width: 576px) {
  .badges-sm-direction {
    flex-direction: column;
    align-items: stretch !important;
  }
  .badge-sm-mb {
    margin-bottom: 0.3rem;
  }

}
</style>