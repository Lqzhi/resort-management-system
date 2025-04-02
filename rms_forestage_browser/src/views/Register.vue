<template>
  <div class="register_container">
    <div class="register_face">
      <div class="register_img" @click="home">
        <img src="../assets/img/home.png" alt="" />
      </div>
      <el-form class="register_form" :model="message" ref="registerForm" :rules="rules">
        <el-form-item :label="item" v-for="(item, index) in addMes" :prop="Object.keys(message)[index]">
          <el-input v-model="message[Object.keys(message)[index]]" :placeholder="showMes(item)"
            :type="isPassword(item)" />
        </el-form-item>
        <el-form-item class="register_button">
          <el-button type="primary" round @click="commit">注册</el-button>
          <el-button type="info" round @click="login">返回</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import { User as ElIconUser, Lock as ElIconLock } from '@element-plus/icons'
import bgimg from '../assets/img/logo.jpg'

export default {
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

      bgimg,
      addMes: ['账号', '密码', '真实名字', '昵称', '性别', 'ID', 'QQ', '邮箱', '手机号码', '微信'],
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
          { min: 6, max: 9, message: '请输入合法QQ', trigger: 'blur' },
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

      ElIconUser,
      ElIconLock,
    }
  },
  name: 'register',
  // 生命周期钩子
  mounted() {
    window.onkeydown = (e) => {
      if (e.key === 'Enter') {
        this.commit()
      }
    }
  },
  methods: {
    login() { this.$router.push('/login') },
    showMes(item) { return '请输入' + item },
    isPassword(item) {
      if (item === '密码') {
        return 'password'
      }
    },
    commit() {
      this.$refs.registerForm.validate(async (valid) => {
        const user = this.message
        if (!valid) return
        const { data } = await this.$http.post('api/reg', user)
        console.log(data);
        if (data.status !== 200) return this.$message.error(data.message || '注册失败！')
        this.$message.success('注册成功！')
        await this.$router.push('/home')
      })
    },
    home() {
      this.$router.push('/home')
    },
  },
}
</script>

<style scoped>
.register_container {
  /* background-color: #2b4b6b; */
  background-image: url(../assets/img/bgi.png);
  height: 100%;
}

.register_face {
  height: 650px;
  width: 450px;
  background-color: #fff;
  position: absolute;
  border-radius: 3px;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  box-shadow: 0 0 10px #ddd;
}

.register_img {
  height: 130px;
  width: 130px;
  padding: 10px;
  border: 1px solid #eee;
  border-radius: 50%;
  overflow: hidden;
  box-shadow: 0 0 10px #ddd;
  position: absolute;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fff;
}

.register_img img {
  height: 100%;
  width: 100%;
  border-radius: 50%;
  background-color: #eee;
}

.register_form {
  margin-top: 105px;
  padding-left: 25px;
  padding-right: 25px;
  box-sizing: border-box;
}

.register_button {
  display: flex;
  justify-content: center;
}

.el-button {
  /* display: block; */
  margin: 0 auto;

}
</style>
