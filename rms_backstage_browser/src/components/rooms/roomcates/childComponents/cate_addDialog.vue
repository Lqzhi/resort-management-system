<template>
  <el-dialog
    title="添加"
    :modelValue="isShow"
    width="50%"
    :before-close="isFalse"
    @close="close"
    :close-on-click-modal="false"
  >
    <el-form label-width="90px" :model="message" :rules="rules" ref="formRef">
      <el-form-item
        :label="item"
        v-for="(item, index) in addMes"
        :prop="Object.keys(message)[index]"
      >
        <el-input
          v-model="message[Object.keys(message)[index]]"
          :placeholder="showMes(item)"
        />
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
  name: 'cate_dialog',
  mixins: [addDialogCom],
  props: {
    isShow: {
      type: Boolean,
      default: false,
    },
  },
  data() {

    return {
      addMes: ['分类名', '押金', '单价/天', '分类描述'],
      message: {
        r_type_name : '大床房',
        room_deposit : '1000',
        room_price : '100',
        r_type_introduction:''
      },
      rules: {
      }
    }
  },
  methods: {
    close() {
      this.$refs.formRef.resetFields()
    },
  },
}
</script>
