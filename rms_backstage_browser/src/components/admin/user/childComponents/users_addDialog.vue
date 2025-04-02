<template>
  <el-dialog
    title="添加管理员用户"
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
          :type="isPassword(item)"
          v-if="item!=='分配角色'"
        />
        <!-- 分配角色 -->
        <el-select v-model="message[Object.keys(message)[index]]" placeholder="请选择" v-else> 
          <el-option
            v-for="item in rolesList"
            :key="item.id"
            :label="item.role_name"
            :value="item.id"
          >
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
    rolesList: {
      type: Array,
      default: {
        return: [],
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
      addMes: ['账号', '密码', '真实名字', '昵称','分配角色','邮箱','手机号码'],
      message: {
        account_number : 'text11',
        admin_pwd : '123456',
        admin_name : '林文新',
        admin_nickname : '新歌',
        role_id : '',
        admin_email : '11078@qq.com',
        admin_phone : '15920657787',
      },
      rules: {
        account_number: [
          { required: true, message: '请输入账号', trigger: 'blur' },
          { min: 3, max: 20, message: '请输入3~20个字符', trigger: 'blur' },
        ],
        admin_pwd: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, max: 20, message: '请输入6~20个字符', trigger: 'blur' },
        ],
        
        admin_name: [
          { required: true, message: '请输入真实名字', trigger: 'blur' },
          { min: 2, max: 18, message: '请输入2~18个字符', trigger: 'blur' },
        ],
        admin_nickname: [
          { required: true, message: '请输入昵称', trigger: 'blur' },
          { min: 1, max: 10, message: '请输入1~10个字符', trigger: 'blur' },
        ],
        role_id: [
          { required: true, message: '请输入角色', trigger: 'blur' },
          { min: 1, max: 3, message: '请输入1~3个字符', trigger: 'blur' },
        ],

        admin_email: [
          { required: false, message: '请输入邮箱', trigger: 'blur' },
          { validator: checkEmail, trigger: 'blur' },
        ],
        admin_phone: [
          { required: false, message: '请输入手机号码', trigger: 'blur' },
          { validator: checkMobile, trigger: 'blur' },
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
  mounted(){
    console.log(this.rolesList);
  }
}
</script>
