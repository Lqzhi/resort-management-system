<template>
  <div id="app">
    <keep-alive include="Login">
      <router-view />
    </keep-alive>
  </div>
</template>

<script>
export default {
  name: 'App',
}
</script>

<style>
.el-table th.gutter {
  display: table-cell !important;
}
</style>
