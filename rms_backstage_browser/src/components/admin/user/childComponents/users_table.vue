<template>
  <div>
    <!--    表格区域-->
    <el-table class="table" :data="users" style="width: 100%" stripe border>
      <el-table-column type="index" label="#" width="50"></el-table-column>
      <el-table-column prop="account_number" label="账号"></el-table-column>
      <el-table-column prop="admin_name" label="名字"></el-table-column>
      <el-table-column prop="admin_nickname" label="昵称"></el-table-column>
      <el-table-column prop="create_time" label="创建时间">
        <template v-slot="scope">{{ dateFormat("YYYY-mm-dd HH:MM", scope.row.create_time) }}</template>
      </el-table-column>
      <el-table-column prop="update_time" label="更新时间">
        <template v-slot="scope">{{ dateFormat("YYYY-mm-dd HH:MM", scope.row.update_time) }}</template>
      </el-table-column>
      <el-table-column prop="admin_email" label="邮箱"></el-table-column>
      <el-table-column prop="admin_phone" label="电话"></el-table-column>
      <el-table-column prop="role_name" label="角色"></el-table-column>
      <el-table-column prop="admin_state" label="状态">
        <template v-slot="scope">
          <el-switch v-model="scope.row.admin_state" :inactive-value="1" :active-value="0"
            @change="change(scope.row)"></el-switch>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="200">
        <template v-slot="scope">
          <el-tooltip effect="dark" content="编辑信息" placement="top" :enterable="false">
            <el-button :icon="ElIconEdit" type="primary" size="mini" @click="editMes(scope.$index)"></el-button>
          </el-tooltip>
          <el-tooltip effect="dark" content="移除用户" placement="top" :enterable="false">
            <el-button :icon="ElIconDelete" type="danger" size="mini" @click="deleted(scope.$index)"></el-button>
          </el-tooltip>
          <el-tooltip effect="dark" content="分配角色" placement="top" :enterable="false">
            <el-button :icon="ElIconSetting" type="warning" size="mini" @click="addRoles(scope.row)"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
    <!--      分页区域-->
    <el-pagination class="el-pagination" @size-change="handleSizeChange" @current-change="handleCurrentChange"
      :current-page="usersMes.pagenum" :page-sizes="[1, 2, 5, 10]" :page-size="usersMes.pagesize"
      layout="total, sizes, prev, pager, next, jumper" :total="total">
    </el-pagination>
    <users_editDialog :isShow="isShow" @isFalse="isFalse" :userMes="onlyUser" @editUserMes="editUserMes" />
    <users_addRoles :showRole="showRole" @isFalse="isFalses" @finish="finish" :twoName="twoName" :rolesList="rolesList"
      @selectClose="selectClose" />
  </div>
</template>

<script>
import {
  Edit as ElIconEdit,
  Delete as ElIconDelete,
  Setting as ElIconSetting,
} from '@element-plus/icons'
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
import users_addRoles from './users_table_addRoles'
import users_editDialog from './users_table_editDialog'
import { pagination } from '@/common/mixin'
import { dateFormat } from '@/common/dateFormat'

export default {
  data() {
    return {
      isShow: false,
      isDelete: false,
      showRole: false,
      onlyUser: {},
      twoName: {},
      rolesList: [],
      ElIconEdit,
      ElIconDelete,
      ElIconSetting,
      dateFormat,
    }
  },
  name: 'users_table',
  components: {
    users_editDialog,
    users_addRoles,
  },
  mixins: [pagination],
  props: {
    users: {
      type: Array,
      default() {
        return []
      },
    },
    total: {
      type: Number,
      default: 0,
    },
    usersMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {

    change(userInfo) {
      $emit(this, 'change', userInfo)
    },
    async deleted(index) {
      const confirm = await this.$confirm(
        '此操作将永久删除该用户, 是否继续?',
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
        }
      ).catch((err) => err)
      if (confirm !== 'confirm') return this.$message.info('已取消删除')
      console.log( this.users);
      $emit(this, 'reGet', this.users, index)
    },
    editMes(index) {
      const { id, admin_name, admin_nickname, admin_email, admin_phone } = this.users[index]
      this.onlyUser = { id, admin_name, admin_nickname, admin_email, admin_phone }
      this.isShow = true
    },
    isFalse() {
      this.isShow = false
    },
    isFalses() {
      this.showRole = false
    },
    editUserMes(usersMes) {
      $emit(this, 'editUserMes', usersMes)
      setTimeout(() => {
        this.isFalse()
      }, 300)
    },
    async addRoles(mes) {
      this.twoName = mes
      const { data} = await this.$http.get('role/find')
      console.log(data);
      if (data.status !== 200)
        return this.$message.error('获取角色列表失败！')
      this.rolesList = data.data
      this.showRole = true
    },
    async finish(newRoleId) {
      const { data } = await this.$http.put(
        `admin/assign`,
        { id : this.twoName.id,
          role_id: newRoleId,
        }
      )
      if (data.status !== 200) return this.$message.error('更新角色失败！')
      this.$message.success('更新角色成功！')
      $emit(this, 'updateMes')
      this.showRole = false
    },
    selectClose() {
      this.twoName = {}
    },
  },
  emits: ['change', 'reGet', 'editUserMes', 'updateMes'],
}
</script>

<style scoped>
.table {
  margin-top: 15px;
  font-size: 13px;
}

.el-pagination {
  margin-top: 15px;
}
</style>
