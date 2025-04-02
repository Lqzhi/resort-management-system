<template>
  <el-breadcrumb separator-class="el-icon-arrow-right" class="el-breadcrumb">
    <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item><slot name="one"></slot></el-breadcrumb-item>
    <el-breadcrumb-item><slot name="two"></slot></el-breadcrumb-item>
  </el-breadcrumb>
</template>

<script>
export default {
  name: 'breadcrumb',
}
</script>

<style scoped>
.el-breadcrumb {
  font-size: 13px;
  margin-bottom: 15px;
}
</style>
