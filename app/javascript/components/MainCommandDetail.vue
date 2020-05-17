<template>
  <div id="main-command-detail" class="main-center-100">
    <div class="d-flex justify-content-between">
      <h2>{{commandData.command.title}}</h2>
      <div>
        <span>作成者：</span>
        <b-link :href="`/user_pages/${commandData.owner.id}`">
          {{commandData.owner.name}}
        </b-link>
      </div>
    </div>
    <div class="d-flex justify-content-between flex-y-center mb-2">
      <div>
        <command-tag tagType="genre" :tagId="commandData.command.genre_id"/>
        <command-tag tagType="commandType" :tagId="commandData.command.command_type_id"/>
      </div>
      <command-dropdown
        :commandId="commandId"
        :inDetail="true"
        :isMine="isMine"
        :indexUrl="commandData.indexUrl"
        @open-update-form="$bvModal.show('modal-for-update')"
      />
    </div>

    <command-explorer
      :fileTree="commandData.fileTree"
      :fileContents="commandData.fileContents"
      class="mb-3"
    />

    <b-card title="description">
      <p>{{commandData.command.description}}</p>
    </b-card>

    <b-modal
      v-if="isMine"
      id="modal-for-update"
      title="コマンドの編集"
      centered
      hide-backdrop
      content-class="shadow"
      hide-footer
      size="xl"
    >
      <command-update-form :prevCommand="commandData.command"/>
    </b-modal>
  </div>
</template>

<script>
import {mapState} from "vuex"
import CommandExplorer from "./CommandExplorer"
import CommandTag from "./CommandTag"
import CommandDropdown from "./CommandDropdown"
import CommandUpdateForm from "./CommandUpdateForm"

export default {
  components: {
    CommandExplorer,
    CommandTag,
    CommandDropdown,
    CommandUpdateForm
  },
  computed: {
    ...mapState(["commandId", "currentUserId", "commandData"]),
    isMine() {
      return this.commandData.command.user_id === this.currentUserId
    }
  }
}
</script>

<style scoped>

</style>