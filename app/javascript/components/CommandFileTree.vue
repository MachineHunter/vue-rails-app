<template>
  <div class="command-file-tree">
    <ul>
      <li
        v-for="child in children"
        :key="child.name"
        @click="$bvModal.show(`detail-${child.name}`)"
      >
        <p
          class="mb-0"
          @click="$root.$emit('bv::toggle::collapse', `children-${child.name}`)"
        >{{child.name}}</p>
        
        <b-collapse
          v-if="!child.isfile"
          :id="`children-${child.name}`"
        >
          <command-file-tree
            :children="child.children"
            :fileContents="fileContents"
          />
        </b-collapse>
        <b-modal
          v-else
          centered
          hide-backdrop
          content-class="shadow"
          size="xl"
          :id="`detail-${child.name}`"
          :title="child.name"
        >
          <pre><code>{{fileContents[child.name]}}</code></pre>
          <template v-slot:modal-footer="{close}">
            <b-button @click="close()">閉じる</b-button>
          </template>
        </b-modal>
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
    },
    fileContents: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped>
ul {
  padding-left: 0;
}
ul ul {
  padding-left: 1rem;
}
li {
  list-style: none;
  border: 1px black solid;
  margin: 4px;
  background-color: #fff;
}
li:hover {
  background-color: #eee;
}
pre {
  background-color: #eee;
  padding: 1rem;
}
</style>