<template>
  <div>
    <el-row :gutter="20" style="margin-top:10px;" justify="center">
      <el-col :span="12">
        <div class="grid-content bg-purple">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span>我的信息</span>
            </div>
            <div class="registe-info">
              <span>昵称</span>
              <div>{{ my.nickname }}</div>
              <span class="registe-info">
                个人简介
              </span>
              <div>
                {{ my.introduction || "此人很懒，没有什么简介！！！" }}
              </div>
            </div>
            <el-divider></el-divider>
            <div class="personal-relation">
              <div class="relation-item">账号: <div style="text-align: center;">{{ my.number }}</div>
              </div>
            </div>
            <div class="personal-relation">
              <div class="relation-item">手机号码:<div style="text-align: center; "> {{ my.telephone }}</div>
              </div>
            </div>
            <div class="personal-relation">
              <div class="relation-item">微信号码: <div style="text-align: center; ">{{ my.wechat }}</div>
              </div>
            </div>
            <div class="personal-relation">
              <div class="relation-item">电子邮箱: <div style="text-align: center;">{{ my.email }}</div>
              </div>
            </div>
            <div class="personal-relation">
              <div class="relation-item">QQ账号: <div style="text-align: center; ">{{ my.qq }}</div>
              </div>
            </div>
            <div style="text-align: center;">
              <el-button type="success;" @click="modify()">
                修改信息
              </el-button>
              <el-button type="danger" @click="dialogFormVisible = true">
                重置密码
              </el-button>
            </div>
          </el-card>
        </div>
      </el-col>
    </el-row>
    <!-- 信息修改框 -->
    <el-dialog title="修改用户信息" v-model="isShow">
      <el-form label-width="70px" :model="userform" :rules="mesrules" ref="userform">

        <el-form-item label="真实名字" prop="full_name">
          <el-input v-model="userform.full_name" placeholder="请输入真实名字" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="昵称" prop="nickname">
          <el-input v-model="userform.nickname" placeholder="请输入昵称" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-select v-model="userform.gender" placeholder="选择你的性别">
            <el-option v-for="item in gender" :key="item.value" :label="item.name" :value="item.value">
            </el-option>


            <!-- <el-option label="未知" value="0" />
            <el-option label="男" value="1" />
            <el-option label="女" value="2" />
            <el-option label="其它" value="3" /> -->
          </el-select>
        </el-form-item>
        <el-form-item label="身份证" prop="ID_card_passport">
          <el-input v-model="userform.ID_card_passport" placeholder="请输入身份证" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="QQ" prop="qq">
          <el-input v-model="userform.qq" placeholder="请输入QQ" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="userform.email" placeholder="请输入邮箱" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号码" prop="telephone">
          <el-input v-model="userform.telephone" placeholder="请输入手机号码" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="微信" prop="wechat">
          <el-input v-model="userform.wechat" placeholder="请输入微信" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <template v-slot:footer>
        <span class="dialog-footer">
          <el-button type="primary" @click="onSubmitMes(userform)">确 定</el-button>
          <el-button @click="isShow = false">取 消</el-button>
        </span>
      </template>
    </el-dialog>


    <!-- 密码修改框 -->
    <!-- 修改密码弹出框 -->
    <el-dialog title="修改密码" v-model="dialogFormVisible">
      <el-form :model="form" ref="pwdForm" :rules="pwdrules">
        <el-form-item label="原密码" prop="password">
          <el-input v-model="form.password" autocomplete="off" type="password" show-password></el-input>
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
          <el-input v-model="form.newPassword" autocomplete="off" type="password" show-password></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="checkPassword">
          <el-input v-model="form.checkPassword" autocomplete="off" type="password" show-password></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer" style="text-align: center;">
        <el-button type="primary" @click="onSubmit()">确 定</el-button>
        <el-button @click="dialogFormVisible = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { update } from 'lodash';


export default {
  name: 'personal',
  data() {
    // 检测新密码和确认密码一致性
    let checkpass = (rule, value, callback) => {
      if (value == this.form.newPassword) {
        callback();
      } else {
        callback(new Error("密码不一致"));
      }
    };
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

      gender:[{name:"未知",value:0},{name:"男",value:1},{name:"女",value:2},{name:"其它",value:3}],
      my: '',
      pwdrules: {
        password: [
          { required: true, message: "请输入原密码", trigger: "blur" },
          { min: 6, max: 20, message: "原密码不正确，要求6-20个字符", trigger: "blur" },
        ],
        newPassword: [
          { required: true, message: "请输入原密码", trigger: "blur" },
          { min: 6, max: 20, message: "新密码不正确，要求6-20个字符", trigger: "blur" },
        ],
        checkPassword: [
          { required: true, message: "不能为空", trigger: "blur" },
          { validator: checkpass, trigger: "blur" },
        ],
      },
      mesrules: {
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

      form: {
        password: "",
        newPassword: "",
        checkPassword: "",
      },
      userform: {
        full_name: "",
        nickname: "",
        gender: "",
        ID_card_passport: "",
        qq: "",
        email: "",
        telephone: "",
        wechat: ""
      },
      isShow: false,
      dialogFormVisible: false,

    }
  },


  created() {
    // this.getPersonal()

  }
  ,
  methods: {
    async getPersonal() {
      const { data } = await this.$http.get('tourist/my')
      if (data.status !== 200) return this.$message.error(data.message || '信息获取失败！')
      this.my = data.data[0]
    },

    modify() {
      const {
        full_name,
        nickname,
        gender,
        ID_card_passport,
        qq,
        email,
        telephone,
        wechat } = this.my
      this.userform = {
        full_name,
        nickname,
        gender,
        ID_card_passport,
        qq,
        email,
        telephone,
        wechat
      }
      this.isShow = true

    },
    // 提交重置密码表单
    onSubmit() {
      this.$refs.pwdForm.validate(async (valid) => {
        if (!valid) return
        const { data } = await this.$http.put('tourist/updatepwd', { oldPwd: this.form.password, newPwd: this.form.newPassword })
        console.log(data.message);
        if (data.status !== 200) return this.$message.error(data.message || '修改失败！')
        this.$message.success('修改成功！')
        await this.getPersonal()
      });
    },

    // 提交基本信息表单
    onSubmitMes() {
      console.log(this.$refs);
      this.$refs.userform.validate(async (valid) => {
        if (!valid) return
        const { data } = await this.$http.put('tourist/update', this.userform)
        console.log(data.message);
        if (data.status !== 200) return this.$message.error(data.message || '修改失败！')
        this.$message.success('修改成功！')
        await this.getPersonal()

      });
    },
  },
}
</script>

<style  scoped>
.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}

.box-card {
  width: 100%;
}

.name-role {
  font-size: 16px;
  padding: 5px;
  text-align: center;
}

.sender {
  text-align: center;
}

.registe-info {
  text-align: center;
  padding-top: 10px;
}

.personal-relation {
  font-size: 16px;
  padding: 0px 5px 15px;
  margin-right: 1px;
  width: 100%
}

.relation-item {
  padding: 12px;

}

.dialog-footer {
  padding-top: 10px;
  padding-left: 10%;
}

.el-row {
  margin-bottom: 20px;

  &:last-child {
    margin-bottom: 0;
  }
}

.el-col {
  border-radius: 4px;
}

.bg-purple-dark {
  background: #99a9bf;
}

.bg-purple {
  background: #d3dce6;
}

.bg-purple-light {
  background: #e5e9f2;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

.row-bg {
  padding: 10px 0;
  background-color: #f9fafc;
}
</style>
