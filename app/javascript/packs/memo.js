import Vue from "vue/dist/vue.esm.js"
import Memo from "./components/index"

let app = new Vue({
  el: "#app",
  components: {
    'memo': Memo,
  }
})
