<template>
  <el-dialog
    title="提示"
    :modelValue="dialogVisible"
    width="30%"
    :before-close="isFalse"
    @close="close"
  >
    <el-tree
      :data="message"
      :props="defaultProps"
      show-checkbox
      node-key="id"
      :default-checked-keys="arr"
      :default-expand-all="true"
      ref="tree"
    />
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
  name: 'roles_showDialog',
  props: {
    dialogVisible: {
      type: Boolean,
      default: false,
    },
    message: {
      type: Array,
      default() {
        return []
      },
    },
    arr: {
      type: Array,
      default() {
        return []
      },
    },
  },
  data() {
    return {
      defaultProps: {
        children: 'children',
        label: 'permission_name',
      },
    }
  },
  methods: {
    isFalse() {
      $emit(this, 'isFalse')
    },
    //关闭时清空checked数组
    close() {
      $emit(this, 'mesNull')
    },
    commit() {
      const keys = [
        ...this.$refs.tree.getCheckedKeys(),
        ...this.$refs.tree.getHalfCheckedKeys(),
      ]
      const idStr = keys.join(',')
      $emit(this, 'commit', idStr)
    },
  },
  emits: ['commit', 'isFalse', 'mesNull'],
}
</script>
