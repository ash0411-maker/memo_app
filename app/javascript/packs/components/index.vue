<template>
  <div id="app">
    <h1>{{ memo_title }}</h1>
    <ul>
      <li v-for="memo in memos" :key="memo.id">
        {{ memo.title }}: {{ memo.description }} <button v-on:click="deleteMemo(memo.id)">Delete Memo</button>
      </li>
    </ul>
    <div>
      <input v-model="title" placeholder="title">
      <input v-model="description" placeholder="description">
      <button v-on:click="addMemo">Add Memo</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      memo_title: "HOMEWORK",
      memos: [],
      title: "",
      description: ""
    }
  },
  mounted () {
    this.setMemo();
  },
  methods: {
    setMemo: function() {
      axios.get("/api/memos").then(response => {
        this.memos = response.data
        console.log(this.memos)
      })
    },
    addMemo: function() {
      axios.post("/api/memos", {
        title: this.title,
        description: this.description
      })
      .then(response => {
        this.setMemo()
      })
    },
    deleteMemo: function(id) {
    console.log(id)
      axios.delete(`/api/memos/${id}`, {
      })
      .then(response => {
        this.setMemo()
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
