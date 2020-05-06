<template>
  <div id="command-detail">
    {{commandId}}
  </div>
</template>

<script>
export default {
  props: {
    commandId: {
      type: Number,
      required: true
    }
  }
}
</script>

<style scoped>

</style>