<template>
  <div>
    <!--    表格区域-->
    <el-table class="table" :data="cate" style="width: 100%" stripe border>
      <el-table-column type="index" label="#" width="50"></el-table-column>
      <el-table-column prop="r_type_name" label="分类名"></el-table-column>
      <el-table-column prop="room_deposit" label="押金"></el-table-column>
      <el-table-column prop="room_price" label="房间价格"></el-table-column>
      <el-table-column prop="r_type_introduction" label="分类描述"></el-table-column>
      <el-table-column label="操作" width="200">
        <template v-slot="scope">
          <el-tooltip effect="dark" content="编辑信息" placement="top" :enterable="false">
            <el-button :icon="ElIconEdit" type="primary" size="mini" @click="editMes(scope.$index)"></el-button>
          </el-tooltip>
          <el-tooltip effect="dark" content="移除" placement="top" :enterable="false">
            <el-button :icon="ElIconDelete" type="danger" size="mini" @click="deleted(scope.$index)"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
    <cate_editDialog :isShow="isShow" @isFalse="isFalse" :userMes="onlyUser" @editUserMes="editUserMes" />
  </div>
</template>

<script>
import {
  Edit as ElIconEdit,
  Delete as ElIconDelete,
  Setting as ElIconSetting,
} from '@element-plus/icons'
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
import cate_editDialog from './cate_table_editDialog'
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
  name: 'cate_table',
  components: {
    cate_editDialog,
  },
  mixins: [pagination],
  props: {
    cate: {
      type: Array,
      default() {
        return []
      },
    },
    cateMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {
    async deleted(index) {
      const confirm = await this.$confirm(
        '此操作将永久删除该, 是否继续?',
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
        }
      ).catch((err) => err)
      if (confirm !== 'confirm') return this.$message.info('已取消删除')
      console.log(this.cate);
      $emit(this, 'reGet', this.cate, index)
    },
    editMes(index) {
      const { id,
r_type_name,
room_deposit,
room_price,
r_type_introduction, } = this.cate[index]
      this.onlyUser = { id,
r_type_name,
room_deposit,
room_price,
r_type_introduction,}
      this.isShow = true
    },
    isFalse() {
      this.isShow = false
    },
    isFalses() {
      this.showRole = false
    },
    editUserMes(cateMes) {
      $emit(this, 'editUserMes', cateMes)
      setTimeout(() => {
        this.isFalse()
      }, 300)
    },
    async addRoles(mes) {
      this.twoName = mes
      const { data } = await this.$http.get('role/find')
      console.log(data);
      if (data.status !== 200)
        return this.$message.error('获取角色列表失败！')
      this.rolesList = data.data
      this.showRole = true
    },
    async finish(newRoleId) {
      const { data } = await this.$http.put(
        `admin/assign`,
        {
          id: this.twoName.id,
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
  emits: ['reGet', 'editUserMes', 'updateMes'],
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
