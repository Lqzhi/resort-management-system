<template>
  <el-dialog title="修改信息" :modelValue="isShow" width="50%" :before-close="isFalse" :close-on-click-modal="false">
    <el-form label-width="70px" :model="userMes" :rules="rules" ref="formRef">
      <el-form-item :label="item" v-for="(item, index) in addMes" :prop="Object.keys(userMes)[index + 1]">
        <el-input v-model="userMes[Object.keys(userMes)[index + 1]]" :placeholder="showMes(item)" />
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
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
export default {
  name: 'cate_editDialog',
  props: {
    isShow: {
      type: Boolean,
      default: false,
    },
    userMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  data() {
    return {

      addMes: ['分类名', '押金', '单价/天', '分类描述'],
      rules: {
      },
    }
  },
  methods: {
    showMes(mes) {
      return '请输入' + mes
    },
    isFalse() {
      $emit(this, 'isFalse')
    },
    close() {
      this.$refs.formRef.resetFields()
    },
    commit() {
      this.$refs.formRef.validate((valid) => {
        if (!valid) return
        const { id,
          r_type_name,
          room_deposit,
          room_price,
          r_type_introduction, } = this.userMes
        $emit(this, 'editUserMes', {
          id,
          r_type_name,
          room_deposit,
          room_price,
          r_type_introduction,
        })
      })
    },
  },
  emits: ['editUserMes', 'isFalse'],
}
</script>
