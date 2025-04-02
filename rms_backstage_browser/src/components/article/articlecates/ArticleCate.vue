<template>
  <div>
    <!--  面包屑导航区-->
    <breadcrumb>
      <template v-slot:one>
        <span>文章管理</span>
      </template>
      <template v-slot:two>
        <span>文章分类</span>
      </template>
    </breadcrumb>
    <!--  Main-->
    <el-card>
      <cate_addUserInput
        @getUsersMes="getUsersMes"
        :cateMes="cateMes"
        @isShow="dialogVisible"
      />
      <cate_table
        :cate="cate"
        :cateMes="cateMes"
        @handleSizeChange="handleSizeChange"
        @handleCurrentChange="handleCurrentChange"
        @reGet="reGet"
        @editUserMes="editUserMes"
        @updateMes="getUsersMes"
      />
    </el-card>
    <cate_addDialog :isShow="isShow" @isFalse="isFalse" @commit="commit" />
  </div>
</template>

<script>
import breadcrumb from '@/components/common/breadcrumb'
import cate_table from './childComponents/cate_table'
import cate_addDialog from './childComponents/cate_addDialog'
import cate_addUserInput from './childComponents/cate_addInput'

export default {
  name: 'User',
  components: {
    breadcrumb,
    cate_table,
    cate_addDialog,
    cate_addUserInput,
  },
  data() {
    return {
      cateMes: {
        query: '',
        pagenum: 1,
        pagesize: 5,
      },
      cate: [],
      total: null,
      isShow: false,
    }
  },
  created() {
    this.getUsersMes()
  },
  methods: {
    //获取最新的数据
    async getUsersMes() {
      const { data } = await this.$http.get('article/cate')
      console.log(data);
      if (data.status !== 200)
        return this.$message.error(data.message||'获取列表失败！') ;
      this.cate = data.data
    },
    //分类项一页显示多少数据///
    handleSizeChange(newSize) {
      this.cateMes.pagesize = newSize
      this.getUsersMes()
    },
    //分类项当前有多少页数据///
    handleCurrentChange(newPage) {
      this.cateMes.pagenum = newPage
      this.getUsersMes()
    },

    //dialog是否显示
    dialogVisible() {
      this.isShow = true
    },
    isFalse() {
      this.isShow = false
    },
    //添加事件
    async commit(mes) {
      const {data} = await this.$http.post('article/cate', mes)
      if (data.status !== 200) return this.$message.error(data.message||'添加失败！')
      this.$message.success('添加成功！')
      this.isShow = false
      await this.getUsersMes()
    },
    //移除事件
    async reGet(userInfo, index) {


      const { data } = await this.$http.delete(
        'article/cate',{data:{id :userInfo[index].id}}
      )
      console.log(data);
      if (data.status !== 200) return this.$message.error('删除失败！')
      this.$message.success('删除成功！')
      this.cate.splice(index, 1)
      await this.getUsersMes()
    },
    async editUserMes(userMes) {
      console.log(userMes);
      const { data } = await this.$http.put(`article/cate`,userMes)
      console.log(data);
      if (data.status !== 200) return this.$message.error(data.message||'编辑信息失败！')
      this.$message.success('编辑信息成功！')
      await this.getUsersMes()
    },
  },
}
</script>
