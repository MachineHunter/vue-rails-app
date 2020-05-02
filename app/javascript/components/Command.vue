<template>
    <b-card class="command-card" @click="$bvModal.show(`command${command.id}-detail`)">
      <b-media no-body>
        <b-media-aside>
          <b-img blank blank-color="#ccc" width="64" alt="placeholder"></b-img>
        </b-media-aside>
        <b-media-body class="command-body pl-3">
          <div class="d-flex justify-content-between align-items-center mb-1">
            <h5 class="command-title mb-0 py-1">{{command.title}}</h5>
            <div class="d-flex justify-content-end align-items-center badges-sm-direction">
              <b-badge class="px-2 py-1 ml-2 h-auto badge-sm-mb">linux</b-badge>
              <b-badge class="px-2 py-1 ml-2 h-auto">自動化系</b-badge>
            </div>
          </div>
          <hr class="my-1">
          <p class="mb-0 command-description">
            {{command.description}}
          </p>
        </b-media-body>
      </b-media>
      <b-modal :id="`command${command.id}-detail`">Hello From My Modal!</b-modal>
    </b-card>
</template>

<script>
export default {
  props: {
    command: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped>
.command-card {
  cursor: pointer;
}
.command-card:hover {
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