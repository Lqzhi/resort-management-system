<template>
  <div>
    <breadcrumb>
      <template v-slot:one>
        <span>权限管理</span>
      </template>
      <template v-slot:two>
        <span>权限列表</span>
      </template>
    </breadcrumb>
    <el-card>
      <right_table :rightMes="rightMes" />
    </el-card>
  </div>
</template>

<script>
import breadcrumb from '@/components/common/breadcrumb'
import right_table from './childComponents/rights_table'
export default {
  name: 'Rights',
  components: {
    breadcrumb,
    right_table,
  },
  data() {
    return {
      rightMes: [],
    }
  },
  created() {
    this.getRightMes()
  },
  methods: {
    async getRightMes() {
      const { data } = await this.$http.get(`permission/find`)
      if (data.status !== 200)
        return this.$message.error('获取权限列表失败！')
      this.rightMes = data.data
      console.log(data);

    },
  },
}
</script>
