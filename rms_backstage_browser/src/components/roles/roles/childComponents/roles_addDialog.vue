<template>
  <el-dialog
    title="添加角色"
    v-model="isShow"
    width="50%"
    :before-close="isFalse"
    @close="close"
    :close-on-click-modal="false"
  >
    <el-form label-width="70px" :model="message" ref="formRef">
      <el-form-item
        :label="item"
        v-for="(item, index) in addMes"
        :prop="Object.keys(message)[index]"
        :key="index"
      >
        <el-input
          v-model="message[Object.keys(message)[index]]"
          :placeholder="showMes(item)"
          :type="isPassword(item)"
        ></el-input>
      </el-form-item>
    </el-form>
    <template v-slot:footer>
      <span class="dialog-footer">
        <el-button @click="isFalse">取 消</el-button>
        <el-button type="primary" @click="commit">确 定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script>
import { addDialogCom } from '@/common/mixin'
export default {
  name: 'roles_addDialog',
  mixins: [addDialogCom],
  data() {
    return {
      addMes: ['角色名称', '角色描述'],
      message: {
        role_name: '',
        introduction: '',
      },
    }
  },
  methods: {
    isPassword(item) {
      if (item === '密码') {
        return 'password'
      }
    },
    close() {
      this.$refs.formRef.resetFields()
    },
  },
}
</script>
