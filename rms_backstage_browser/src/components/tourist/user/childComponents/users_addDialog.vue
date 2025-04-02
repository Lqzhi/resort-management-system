<template>
  <el-dialog title="添加游客用户" :modelValue="isShow" width="50%" :before-close="isFalse" @close="close"
    :close-on-click-modal="false">
    <el-form label-width="90px" :model="message" :rules="rules" ref="formRef">
      <el-form-item :label="item" v-for="(item, index) in addMes" :prop="Object.keys(message)[index]">
        <el-input v-model="message[Object.keys(message)[index]]" :placeholder="showMes(item)" :type="isPassword(item)" v-if="item !=='性别'"/>

        <el-select v-model="message[Object.keys(message)[index]]" placeholder="选择你的性别" v-else> 
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
import { addDialogCom } from '@/common/mixin'

export default {
  name: 'users_dialog',
  mixins: [addDialogCom],
  props: {
    isShow: {
      type: Boolean,
      default: false,
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
      addMes: ['账号', '密码', '真实名字', '昵称', '性别','ID', 'QQ','邮箱', '手机号码','微信'],
      message: {
        number: '10001',
        password: '123456',
        full_name: '',
        nickname: '',
        gender: '',
        ID_card_passport: '',
        qq: '',
        email: '',
        telephone: '',
        wechat: ''
      },
      genders:[{name:"未知",value:0},{name:"男",value:1},{name:"女",value:2},{name:"其它",value:3}],
      rules: {
        number: [
          { required: true, message: '请输入账号', trigger: 'blur' },
          { min: 3, max: 20, message: '请输入3~20个字符', trigger: 'blur' },
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, max: 20, message: '请输入6~20个字符', trigger: 'blur' },
        ],

        full_name: [
          { required: true, message: '请输入真实名字', trigger: 'blur' },
          { min: 2, max: 18, message: '请输入2~18个字符', trigger: 'blur' },
        ],
        nickname: [
          { required: true, message: '请输入昵称', trigger: 'blur' },
          { min: 1, max: 10, message: '请输入1~10个字符', trigger: 'blur' },
        ],
        gender: [
          { required: false, message: '请输入性别', trigger: 'blur' },
          { min: 1, max: 3, message: '请输入性别', trigger: 'blur' },
        ],
        ID_card_passport: [
          { required: true, message: '请输入身份号码', trigger: 'blur' },
          { min: 9, max: 18, message: '请输入合法身份证', trigger: 'blur' },
        ],
        qq: [
          { required: false, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 3, message: '请输入合法QQ', trigger: 'blur' },
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
          { required: false, message: '请输入密码', trigger: 'blur' },
          { min: 1, max: 3, message: '请输入6~20个字符', trigger: 'blur' },
        ],
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
