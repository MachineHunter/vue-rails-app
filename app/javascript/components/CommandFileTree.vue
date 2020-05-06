<template>
  <div class="command-file-tree">
    <ul>
      <li
        v-for="child in children"
        :key="child.name"
      >
        {{child.name}}
        <command-file-tree
          v-if="!child.isfile"
          :children="child.children"
        />
      </li>
    </ul>
  </div>
</template>

<script>
import CommandFileTree from "./CommandFileTree"

export default {
  name: "CommandFileTree",
  components: {
    CommandFileTree
  },
  props: {
    children: {
      type: Array,
      required: true
    }
  }
}
</script>

<style scoped>

</style>