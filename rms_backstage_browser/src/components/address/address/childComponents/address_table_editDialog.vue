<template>
  <el-dialog title="修改信息" :modelValue="isShow" width="50%" :before-close="isFalse" :close-on-click-modal="false">
    <el-form label-width="70px" :model="addressMes" :rules="rules" ref="formRef">
      <el-form-item :label="item" v-for="(item, index) in addMes" :prop="Object.keys(addressMes)[index + 1]">
        <el-input v-model="addressMes[Object.keys(addressMes)[index + 1]]" :placeholder="showMes(item)"
          :disabled="!isaddressname(item)" />
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
  name: 'address_editDialog',
  props: {
    isShow: {
      type: Boolean,
      default: false,
    },
    addressMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  data() {
    return {
      addMes: ['号', '所在楼层', '所属酒店', '所属分类', '描述'],
      rules: {
        //暂时不写
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
    isaddressname(item) {
      return item !== '名'
    },
    commit() {
      this.$refs.formRef.validate((valid) => {
        if (!valid) return
        const { id,
          address_no,
          address_floor,
          hotel,
          type_id,
          introduction, } = this.addressMes
        $emit(this, 'editaddressMes', {
          id,
          address_no,
          address_floor,
          hotel,
          type_id,
          introduction,
        })
      })
    },
  },
  emits: ['editaddressMes', 'isFalse'],
}
</script>
