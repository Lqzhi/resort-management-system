<template>
  <el-dialog title="修改房间信息" :modelValue="isShow" width="50%" :before-close="isFalse" :close-on-click-modal="false">
    <el-form label-width="70px" :model="roomMes" :rules="rules" ref="formRef">
      <el-form-item :label="item" v-for="(item, index) in addMes" :prop="Object.keys(roomMes)[index + 1]">
        <el-input v-model="roomMes[Object.keys(roomMes)[index + 1]]" :placeholder="showMes(item)"
          :disabled="!isroomname(item)" />
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
  name: 'rooms_editDialog',
  props: {
    isShow: {
      type: Boolean,
      default: false,
    },
    roomMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  data() {
    return {
      addMes: ['房间号', '所在楼层', '所属酒店', '所属分类', '房间描述'],
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
    isroomname(item) {
      return item !== '房间名'
    },
    commit() {
      this.$refs.formRef.validate((valid) => {
        if (!valid) return
        const { id,
          room_no,
          room_floor,
          hotel,
          type_id,
          introduction, } = this.roomMes
        $emit(this, 'editroomMes', {
          id,
          room_no,
          room_floor,
          hotel,
          type_id,
          introduction,
        })
      })
    },
  },
  emits: ['editroomMes', 'isFalse'],
}
</script>
