<template>
  <div>
    <b-card>
      <b-media>
        <template v-slot:aside>
          <b-img blank blank-color="#ccc" width="64" alt="placeholder"></b-img>
        </template>
        <div class="d-flex justify-content-between">
          <h5 class="mt-0 mb-1">{{command.title}}</h5>
          <div>
            <b-badge class="px-2 py-1">linux</b-badge>
            <b-badge class="px-2 py-1">自動化系</b-badge>
          </div>
        </div>
        <hr>
        <p class="mb-0">
          {{command.description}}
        </p>
      </b-media>

    </b-card>

  </div>
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
</style>