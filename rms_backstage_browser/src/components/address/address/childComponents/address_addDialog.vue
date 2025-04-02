<template>
  <el-dialog title="添加" :modelValue="isShow" width="50%" :before-close="isFalse" @close="close"
    :close-on-click-modal="false">
    <el-form label-width="90px" :model="message" :rules="rules" ref="formRef">
      <el-form-item :label="item" v-for="(item, index) in addMes" :prop="Object.keys(message)[index]">
        <el-input v-model="message[Object.keys(message)[index]]" :placeholder="showMes(item)" />
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
  name: 'address_dialog',
  mixins: [addDialogCom],
  props: {
    isShow: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      addMes: ['景点', '', '所属酒店', '所属分类','描述'],
      message: {
        address_no:'',
        address_floor:'',
        hotel:'统景酒店',
        type_id:'1',
        introduction:''
      },
      rules: {
        // 暂时不写
      },
    }
  },
  methods: {
    close() {
      this.$refs.formRef.resetFields()
    },
  },
}
</script>
