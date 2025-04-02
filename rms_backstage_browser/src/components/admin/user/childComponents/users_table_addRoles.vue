<template>
  <el-dialog
    title="分配角色"
    :modelValue="showRole"
    width="50%"
    @close="selectClose"
    :before-close="isFalse"
    :close-on-click-modal="false"
  >
    <div>
      <p>当前的用户：{{ twoName.admin_name }}</p>
      <p>当前的角色：{{ twoName.role_name }}</p>
      <p>
        分配新角色：
        <el-select v-model="selectRoles" placeholder="请选择">
          <el-option
            v-for="item in rolesList"
            :key="item.id"
            :label="item.role_name"
            :value="item.id"
          >
          </el-option>
        </el-select>
      </p>
    </div>
    <template v-slot:footer>
      <span class="dialog-footer">
        <el-button @click="isFalse">取 消</el-button>
        <el-button type="primary" @click="commit">确 定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script>
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
export default {
  name: 'users_addRoles',
  props: {
    showRole: {
      type: Boolean,
      default: false,
    },
    twoName: {
      type: Object,
      default: {
        return: {},
      },
    },
    rolesList: {
      type: Array,
      default: {
        return: [],
      },
    },
  },
  data() {
    return {
      selectRoles: '',
    }
  },
  methods: {
    isFalse() {
      $emit(this, 'isFalse')
    },
    commit() {
      if (!this.selectRoles) return this.$message.error('请选择要分配的角色')
      $emit(this, 'finish', this.selectRoles)
    },
    selectClose() {
      this.selectRoles = ''
      $emit(this, 'selectClose')
    },
  },
  emits: ['finish', 'isFalse', 'selectClose'],
}
</script>

<style scoped>
div {
  font-size: 13px;
}

</style>
