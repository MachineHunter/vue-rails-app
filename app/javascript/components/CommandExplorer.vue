<template>
  <div id="command-explorer">
    <header>
      <button class="button-for-sidebar" @click="hidden = !hidden">
        <b-icon-list/>
      </button>
      {{fileName}}
    </header>
    <div class="command-explorer">
      <div :class="{'sidebar': true, 'hide': hidden}" id="sidebar">
        <command-file-tree
          :children="[fileTree]"
          @clickFile="clickFile($event)"
        />

      </div>
      <div :class="{'dummy-sidebar': true, 'hide': hidden}" id="dummy-sidebar">
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
    fileName: {
      type: String,
      required: true
    },
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
      filename: "",
      mediaQueryList: null
    }
  },
  created: function() {
    this.mediaQueryList = window.matchMedia("(max-width: 500px)")
    this.mediaQueryList.addListener(this.onBreakPointChange)
  },
  methods: {
    clickFile(event) {
      this.filename = event
      if(this.mediaQueryList.matches) {
        this.hidden = true
      }
    },
    onBreakPointChange(mql) {
      if(mql.matches) {
        this.hidden = true
      }
    }
  }
}
</script>

<style scoped>
#command-explorer {
  border: 1.5px solid #aaa;
  border-radius: 4px;
  overflow: hidden;
}
header {
  border-bottom: 1px solid #aaa;
  background-color: #f6f6f6;

  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}
.button-for-sidebar {
  background-color: transparent;
  border: 1px solid #999;
  border-radius: 4px;
  margin: 4px;
}
.button-for-sidebar:hover {
  background-color: rgba(80, 80, 80, 0.192);
}
.command-explorer {
  overflow: hidden;
  position: relative;
  display: flex;
}
.sidebar,
.dummy-sidebar{
  /* max-width: 50%; */
  width: 200px;
  transition: all 0.5s;
}
.sidebar {
  position: absolute;
  height: 100vh;

  background-color: #ccc;
  box-shadow: 0 0 4px 4px rgba(49, 49, 49, 0.3);
}
.dummy-sidebar {
  visibility: hidden;
  flex-shrink: 0;
}
@media(max-width: 500px) {
  .sidebar {
    max-width: 100%;
  }
  .dummy-sidebar {
    max-width: 0;
  }
}
.sidebar.hide {
  transform: translateX(calc(-100% - 8px));
}
.dummy-sidebar.hide {
  width: 0;
}
.file-content {
  flex-grow: 1;
  padding: 0.5rem;
  overflow-x: scroll;
}
pre {
  background-color: #eee;
  padding: 1rem;
}
</style>