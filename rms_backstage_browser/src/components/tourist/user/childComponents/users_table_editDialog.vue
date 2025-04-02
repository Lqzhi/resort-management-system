<template>
  <el-dialog title="修改用户信息" :modelValue="isShow" width="50%" :before-close="isFalse" :close-on-click-modal="false">
    <el-form label-width="70px" :model="userMes" :rules="rules" ref="formRef">
      <el-form-item :label="item" v-for="(item, index) in addMes" :prop="Object.keys(userMes)[index+1]">
        <el-input v-model="userMes[Object.keys(userMes)[index + 1]]" :placeholder="showMes(item)"
          :disabled="!isUsername(item)" v-if="item !=='性别'" />
          <el-select v-model="userMes[Object.keys(userMes)[index + 1]]" placeholder="选择你的性别" v-else> 
            <el-option v-for="item in genders" :key="item.value" :label="item.name" :value="item.value">
            </el-option>
          </el-select>
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
  name: 'users_editDialog',
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
    const checkEmail = (rule, value, cb) => {
      const regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])/
      if (regEmail.test(value)) {
        return cb()
      }
      cb(new Error('请输入合法的邮箱！'))
    }
    const checkMobile = (rule, value, cb) => {
      const regMobile =
        /^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/
      if (regMobile.test(value)) {
        return cb()
      }
      cb(new Error('请输入合法的手机号！'))
    }
    return {
      addMes: ['真实名字', '昵称', '性别', 'ID', 'QQ', '邮箱', '手机号码', '微信'],
      genders:[{name:"未知",value:0},{name:"男",value:1},{name:"女",value:2},{name:"其它",value:3}],
      rules: {
        full_name: [
          { required: true, message: '请输入真实名字', trigger: 'blur' },
          { min: 2, max: 18, message: '请输入2~18个字符', trigger: 'blur' },
        ],
        nickname: [
          { required: true, message: '请输入昵称', trigger: 'blur' },
          { min: 1, max: 10, message: '请输入1~10个字符', trigger: 'blur' },
        ],
        gender: [
        ],
        ID_card_passport: [
          { required: true, message: '请输入身份号码', trigger: 'blur' },
          { min: 9, max: 18, message: '请输入合法身份证9-18数字', trigger: 'blur' },
        ],
        qq: [
          { min: 6, max: 20, message: '请输入合法QQ', trigger: 'blur' },
        ],
        admin_email: [
          { required: false, message: '请输入邮箱', trigger: 'blur' },
          { validator: checkEmail, trigger: 'blur' },
        ],
        admin_phone: [
          { required: false, message: '请输入手机号码', trigger: 'blur' },
          { validator: checkMobile, trigger: 'blur' },
        ],
        wechat: [
          { required: false, message: '请输入微信', trigger: 'blur' },
          { min: 6, max: 20, message: '请输入6~20个字符', trigger: 'blur' },
        ],
      },
    }
  },
  methods: {
    showMes(mes) {
      if (mes !== '用户名') {
        return '请输入' + mes
      } else {
        return this.userMes.username
      }
    },
    isFalse() {
      $emit(this, 'isFalse')
    },
    close() {
      this.$refs.formRef.resetFields()
    },
    isUsername(item) {
      return item !== '用户名'
    },
    commit() {
      this.$refs.formRef.validate((valid) => {
        if (!valid) return
        const { id,
          full_name,
          nickname,
          gender,
          ID_card_passport,
          qq,
          email,
          telephone,
          wechat } = this.userMes
        $emit(this, 'editUserMes', {
          id,
          full_name,
          nickname,
          gender,
          ID_card_passport,
          qq,
          email,
          telephone,
          wechat
        })
      })
    },
  },
  emits: ['editUserMes', 'isFalse'],
}
</script>
