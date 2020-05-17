<template>
  <div class="command-file-tree">
    <ul>
      <li
        v-for="child in children"
        :key="child.name"
      >
        <p
          class="file-name mb-0 pl-1"
          @click="onClickFile(child)"
        >
          <b-icon-file-text v-if="child.isfile" />
          <b-icon-folder v-else />
          {{child.name}}
        </p>
        
        <b-collapse
          v-if="!child.isfile"
          :id="`children-${child.path}`"
        >
          <command-file-tree
            :children="child.children"
            @clickFile="$emit('clickFile', $event)"
          />
        </b-collapse>
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
    }
  },
  methods: {
    onClickFile(file) {
      if(file.isfile) {
        this.$emit('clickFile', {path: file.path, name: file.name})
      } else {
        this.$root.$emit('bv::toggle::collapse', `children-${file.path}`)
      }
    }
  }
}
</script>

<style scoped>
ul {
  padding-left: 0;
  margin-bottom: 0;
}
ul ul {
  padding-left: 1rem;
}
li {
  list-style: none;
  margin: 0;
  padding: 4px;
}
li li {
  margin: 4px;
  padding: 0;
}
.file-name {
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
  cursor: pointer;
}
.file-name:hover {
  background-color: #eee;
}
</style>