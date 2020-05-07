<template>
  <div id="command-explorer">
    <header>
      <button @click="hidden = !hidden">三</button>
      explorer
    </header>
    <div class="command-explorer">
      <div :class="{'sidebar': true, 'hide': hidden}">
        <command-file-tree
          :children="[fileTree]"
          @clickFile="filename=$event; hideSidebarWhenNarrow()"
        />

      </div>
      <div :class="{'dummy-sidebar': true, 'hide': hidden}">
        <command-file-tree
          :children="[fileTree]"
        />

      </div>
      <div class="file-content">
        {{filename}}
        <pre><code>{{fileContents[filename]}}</code></pre>
      </div>
    </div>
  </div>
</template>

<script>
import CommandFileTree from "./CommandFileTree"

export default {
  components: {
    CommandFileTree
  },
  props: {
    fileTree: {
      type: Object,
      required: true
    },
    fileContents: {
      type: Object,
      required: true
    }
  },
  data: function() {
    return {
      hidden: false,
      filename: ""
    }
  },
  methods: {
    hideSidebarWhenNarrow() {
      if(window.matchMedia("(max-width: 500px)").matches) {
        this.hidden = true
      }
    }
  }
}
</script>

<style scoped>
#command-explorer {
  border: 1px solid #666;
}
header {
  border-bottom: 1px solid #666;
}
.command-explorer {
  overflow: hidden;
  position: relative;
  display: flex;
}
.sidebar,
.dummy-sidebar{
  width: 200px;
  transition: all 0.5s;

  background-color: #fefefe;
}
.sidebar {
  position: absolute;
  height: 100vh;
}
.dummy-sidebar {
  visibility: hidden;
}
@media(max-width: 500px) {
  .dummy-sidebar {
    width: 0;
  }
}
.sidebar.hide {
  transform: translateX(-100%);
}
.dummy-sidebar.hide {
  width: 0px;
}
.file-content {
  flex-grow: 1;
  padding: 0.5rem;
}
pre {
  background-color: #eee;
  padding: 1rem;
}
</style>