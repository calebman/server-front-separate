<template>
  <div class="hello">
    <h1 v-if="loading">{{ '正在加载用户信息' }}</h1>
    <h1 v-else-if="errMsg">{{ errMsg }}</h1>
    <div v-else>
      <p>username: {{userInfo.username}}</p>
      <p>roles: {{userInfo.roles}}</p>
      <p>depts: {{userInfo.depts}}</p>
      <p>menus: {{userInfo.menus}}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'HelloWorld',
  data () {
    return {
      loading: false,
      userInfo: {
        username: '',
        roles: [],
        depts: [],
        menus: []
      },
      errMsg: null
    }
  },
  created () {
    this.loading = true
    axios.get('/api/user/me').then(response => {
      this.userInfo = response.data
    }).catch(err => {
      console.error(err)
      this.errMsg = err
    }).finally(() => { this.loading = false })
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,
h2 {
  font-weight: normal;
}
</style>
