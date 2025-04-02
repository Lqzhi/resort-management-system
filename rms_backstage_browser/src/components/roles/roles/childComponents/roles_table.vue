<template>
  <div>
    <!--    表格区域-->
    <el-table class="table" :data="rolesMes" style="width: 100%" stripe border>
      <el-table-column type="expand">
        <template v-slot="scope">
          <el-row :key="tag.id" v-for="tag in scope.row.children" :class="['bBorder', index === 0 ? 'tBorder' : '']">
            <el-col :span="5">
              <el-tag closable @close="deletedIt(scope.$index, tag.id)">
                {{ tag.authName }}
              </el-tag>
              <el-icon><el-icon-caret-right /></el-icon>
            </el-col>
            <el-col :span="19">
              <el-row :key="tag1.id" v-for="(tag1, index1) in tag.children" :class="[index1 === 0 ? '' : 'tBorder']">
                <el-col :span="6">
                  <el-tag type="success" closable @close="deletedIt(scope.$index, tag1.id)">
                    {{ tag1.authName }}
                  </el-tag>
                  <el-icon><el-icon-caret-right /></el-icon>
                </el-col>
                <el-col :span="18">
                  <el-tag closable :key="tag2.id" v-for="tag2 in tag1.children" type="warning"
                    @close="deletedIt(scope.$index, tag2.id)">
                    {{ tag2.authName }}
                  </el-tag>
                </el-col>
              </el-row>
            </el-col>
          </el-row>
        </template>
      </el-table-column>
      <el-table-column type="index" label="#" width="50"></el-table-column>
      <el-table-column prop="role_name" label="角色名称"></el-table-column>
      <el-table-column prop="introduction" label="角色描述"></el-table-column>
      <el-table-column label="操作">
        <template v-slot="scope">
          <el-button :icon="ElIconEdit" type="primary" size="mini" @click="editMes(scope.row)">编辑</el-button>
          <el-button :icon="ElIconDelete" type="danger" size="mini" @click="deleted(scope.$index)">删除</el-button>
          <el-button :icon="ElIconSetting" type="warning" size="mini" @click="showDialog(scope.$index)">分配权限</el-button>
        </template>
      </el-table-column>
    </el-table>
    <roles_showDialog :dialogVisible="dialogVisible" :message="permissionMes" :arr="arr" @mesNull="mesNull" @isFalse="isFalse"
      @commit="editCommit" ref="showDialog" />
    <roles_editDialog :editShow="editShow" :editObj="editObj" @isFalse="isFalses" @editRoleMes="editRoleMes" />
  </div>
</template>

<script>
import {
  CaretRight as ElIconCaretRight,
  Edit as ElIconEdit,
  Delete as ElIconDelete,
  Setting as ElIconSetting,
} from '@element-plus/icons'
// 转换父子树函数
import {listTransTree as totree} from "@/common/totree"
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
import roles_editDialog from './roles_table_editDialog'
import roles_showDialog from './roles_table_showDialog'
export default {
  data() {
    return {
      dialogVisible: false,
      arr: [],
      currentId: '',
      editShow: false,
      editObj: {},
      ElIconEdit,
      ElIconDelete,
      ElIconSetting,
    }
  },
  components: {
    roles_showDialog,
    roles_editDialog,
    ElIconCaretRight,
  },
  name: 'roles_table',
  props: {
    rolesMes: {
      type: Array,
      default() {
        return []
      },
    },
  },
  methods: {

    totree,

    //删除用户按钮
    async deleted(index) {
      this.currentIndex = index
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
      $emit(this, 'reGet', this.rolesMes, index)
    },
    //删除权限按钮
    async deletedIt(index, id) {
      const confirm = await this.$confirm(
        '此操作将永久删除该权限, 是否继续?',
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
        }
      ).catch((err) => err)
      if (confirm !== 'confirm') return this.$message.info('已取消删除')
      $emit(this, 'deleteLimit', this.rolesMes[index].id, id, index)
    },
    //分配权限按钮
    async showDialog(index) {
      this.currentId = this.rolesMes[index].id
      const { data } = await this.$http.get('permission/find')
      console.log(data.data);
      this.permissionMes = totree(data.data,"permission_pid")
      console.log( this.permissionMes);
      this.dialogVisible = true
      // console.log(rolesMes[index].children);
      // for(let item of this.rolesMes[index].children){
      //   for(let item1 of item.children){
      //     for(let item2 of item1.children){
      //       this.arr.push(item2.id)
      //     }
      //   }
      // }
    },
    isFalse() {
      this.dialogVisible = false
    },
    isFalses() {
      this.editShow = false
    },
    mesNull() {
      this.arr = []
    },
    //分配权限确认按钮
    async editCommit(idStr) {
      const { data: res } = await this.$http.post(
        `roles/${this.currentId}/rights`,
        { rids: idStr }
      )
      if (res.meta.status !== 200) return this.$message.error('分配权限失败！')
      this.$message.success('分配权限成功！')
      $emit(this, 'updateMes')
      this.isFalse()
    },
    editMes(user) {
      this.editShow = true
      const { id } = user
      this.editObj = { id, role_name: '', introduction: '' }
    },
    editRoleMes(obj) {
      $emit(this, 'editRoleMes', obj)
      this.editShow = false
    },
  },
  emits: ['reGet', 'deleteLimit', 'editRoleMes', 'updateMes'],
}
</script>

<style scoped>
.table {
  margin-top: 15px;
  font-size: 13px;
}

.el-row {
  display: flex;
  align-items: center;
}

.el-tag {
  margin: 7px;
}

.tBorder {
  border-top: 1px solid #eee;
}

.bBorder {
  border-bottom: 1px solid #eee;
}
</style>
