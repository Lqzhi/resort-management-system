<template>
  <div>
    <!--  面包屑导航区-->
    <breadcrumb>
      <template v-slot:one>
        <span>游客用户管理</span>
      </template>
      <template v-slot:two>
        <span>用户列表</span>
      </template>
    </breadcrumb>
    <!--  Main-->
    <el-card>
      <users_addUserInput
        @getUsersMes="getUsersMes"
        :usersMes="usersMes"
        @isShow="dialogVisible"
      />
      <users_table
        :users="users"
        :total="total"
        :usersMes="usersMes"
        @handleSizeChange="handleSizeChange"
        @handleCurrentChange="handleCurrentChange"
        @change="change"
        @reGet="reGet"
        @editUserMes="editUserMes"
        @updateMes="getUsersMes"
      />
    </el-card>
    <users_addDialog :isShow="isShow" @isFalse="isFalse" @commit="commit" />
  </div>
</template>

<script>
import breadcrumb from '@/components/common/breadcrumb'
import users_table from './childComponents/users_table'
import users_addDialog from './childComponents/users_addDialog'
import users_addUserInput from './childComponents/users_addUserInput'

export default {
  name: 'User',
  components: {
    breadcrumb,
    users_table,
    users_addDialog,
    users_addUserInput,
  },
  data() {
    return {
      usersMes: {
        query: '',
        pagenum: 1,
        pagesize: 5,
      },
      users: [],
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
      const { data } = await this.$http.get('tourist/find', {
        params:this.usersMes,
      })
      if (data.status !== 200)
        return this.$message.error(data.message||'获取用户列表失败！') ;
      console.log(data.data);
      this.users = data.data
      this.total = 100
    },
    //分类项一页显示多少数据///
    handleSizeChange(newSize) {
      this.usersMes.pagesize = newSize
      this.getUsersMes()
    },
    //分类项当前有多少页数据///
    handleCurrentChange(newPage) {
      this.usersMes.pagenum = newPage
      this.getUsersMes()
    },

    //状态改变事件
    async change(userInfo) {
      console.log(userInfo.state);
      const {data} = await this.$http.put(
        `tourist/updatestate`,{id:userInfo.id,state:userInfo.state}
      )
      if (data.status !== 200) {
        //更新失败后要保证状态未被改变
        userInfo.t.state = !userInfo.state
        return this.$message.error(data.message||'更新用户状态失败！')
       
      }
      this.$message.success('更新用户状态成功！')
    },
    //dialog是否显示
    dialogVisible() {
      this.isShow = true
    },
    isFalse() {
      this.isShow = false
    },
    //添加用户事件
    async commit(mes) {
      const {data} = await this.$http.post('tourist/add', mes)
      if (data.status !== 200) return this.$message.error(data.message||'添加用户失败！')
      this.$message.success('添加用户成功！')
      this.isShow = false
      await this.getUsersMes()
    },
    //移除用户事件
    async reGet(userInfo, index) {


      const { data } = await this.$http.delete(
        'tourist/del',{data:{id :userInfo[index].id}}
      )
      console.log(data);
      if (data.status !== 200) return this.$message.error('删除用户失败！')
      this.$message.success('删除用户成功！')
      this.users.splice(index, 1)
      await this.getUsersMes()
    },
    async editUserMes(userMes) {
      console.log(userMes);
      const { data } = await this.$http.put(`tourist/update`,userMes)
      console.log(data);
      if (data.status !== 200) return this.$message.error(data.message||'编辑用户信息失败！')
      this.$message.success('编辑用户信息成功！')
      await this.getUsersMes()
    },
  },
}
</script>
