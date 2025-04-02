<template>
  <div class="login_container">
    <div class="login_face">
      <div class="login_img">
        <img src="../assets/img/logo.jpg" alt="" />
      </div>
      <el-form class="login_form" :model="form" :rules="rules" ref="loginForm">
        <el-form-item prop="username">
          <el-input
            placeholder="请输入用户名"
            :prefix-icon="ElIconUser"
            v-model="form.username"
          ></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            placeholder="请输入密码"
            :prefix-icon="ElIconLock"
            v-model="form.password"
            type="password"
            show-password
            auto-complete="new-password"
          ></el-input>
        </el-form-item>
        <el-form-item class="login_button" >
          <el-button type="primary" round @click="commit">登录</el-button>
          <el-button type="info" round @click="clear">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import { User as ElIconUser, Lock as ElIconLock } from '@element-plus/icons'

export default {
  data() {
    return {
      form: {
        username: 'admin',
        password: '123456',
      },
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          {
            min: 3,
            max: 10,
            message: '长度在 3 到 10 个字符',
            trigger: 'blur',
          },
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          {
            min: 6,
            max: 15,
            message: '长度在 6 到 15 个字符',
            trigger: 'blur',
          },
        ],
      },
      ElIconUser,
      ElIconLock,
    }
  },
  name: 'Login',
  // 生命周期钩子
  mounted() {
    window.onkeydown = (e) => {
      if (e.key === 'Enter') {
        this.commit()
      }
    }
  },
  methods: {
    commit() {
      this.$refs.loginForm.validate(async (valid) => {
        if (!valid) return
      


        
        
        
        
        
        const {data} = await this.$http.post('http://127.0.0.1:5002/api/login', {account_number:this.form.username,admin_pwd:this.form.password})
        console.log(data);
        if (data.status !== 200) return this.$message.error(data.message||'登录失败！')
        this.$message.success('登录成功！')
        // 登录成功在sessionStorage保存返回的token
        window.sessionStorage.setItem('token', data.data)
    
        // window.sessionStorage.setItem('user',JSON.stringify({...res.data,token:undefined}))

        // const { data: res } = await this.$http.post('login', this.form)
        // if (res.meta.status !== 200) return this.$message.error('登录失败！')
        // this.$message.success('登录成功！')
        // // 登录成功在sessionStorage保存返回的token
        // window.sessionStorage.setItem('token', res.data.token)
        // console.log({...res.data,token:undefined});
        // window.sessionStorage.setItem('user',JSON.stringify({...res.data,token:undefined}))
        // console.log( JSON.parse(window.sessionStorage.getItem('user')));
        // console.log(window.sessionStorage.getItem('token'));
        await this.$router.push('/home')
      })
    },
    clear() {
      this.$refs.loginForm.resetFields()
    },
  },
  // 通过路由进入组件的组件路由守卫
  beforeRouteEnter(to, from, next) {
    next()
    // ...
  },
  // 通过路由 离开组件的组件路由守卫
  beforeRouteLeave(to, from, next) {
    // ...
    next()
  },
}
</script>

<style scoped>
.login_container {
  background-color: #2b4b6b;
  height: 100%;
}
.login_face {
  height: 300px;
  width: 450px;
  background-color: #fff;
  position: absolute;
  border-radius: 3px;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  box-shadow: 0 0 10px #ddd;
}
.login_img {
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
.login_img img {
  height: 100%;
  width: 100%;
  border-radius: 50%;
  background-color: #eee;
}
.login_form {
  margin-top: 105px;
  padding-left: 25px;
  padding-right: 25px;
  box-sizing: border-box;
}
.login_button {
  display: flex;
  justify-content: center;
}
.el-button {
  /* display: block; */
  margin: 0 auto;

}
</style>
