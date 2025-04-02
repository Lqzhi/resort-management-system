// 导入定义验证规则的包
const joi = require('joi')

const id = joi.number().required()//管理员用户id
const account_number = joi.string().min(3).max(20).required()//账号
const admin_pwd = joi.string().min(6).max(20).required()//密码
// const admin_pwd	 =  joi.required()//密码
const admin_name = joi.string().min(2).max(18).required()//用户名
const admin_nickname = joi.string().min(1).max(10).required()//用户昵称
const role_id = joi.number().required()//对应角色id
const admin_email = joi.string().email().empty('').allow(null).allow('')//管理员用户电子邮箱
const admin_phone = joi.string().length(11).pattern(/^\d*$/).empty('').allow(null).allow('')//管理员用户手机号码
const admin_state = joi.number().valid(0, 1)//管理状态0为启用 1为禁用


// 定义验证登录表单数据的规则对象
exports.login_schema = {
  body: {
    account_number,
    admin_pwd
  },
}

// 验证规则对象 - 新建管理员用户基本信息
exports.reg_schema = {
  body: {
    account_number,
    admin_pwd,
    admin_name,
    admin_nickname,
    role_id,
    admin_email,
    admin_phone,
  },
}
// 验证规则对象 - 更新基本信息
exports.update_schema = {
  body: {
    id,
    admin_name,
    admin_nickname,
    admin_email,
    admin_phone,
  },
}
// 验证规则对象 -分配角色
exports.update_role_schema = {
  body: {
    id,
    role_id
  },
}

// 验证规则对象 - 更新密码
exports.update_password_schema = {
  body: {
    oldPwd: admin_pwd,
    newPwd: joi.not(joi.ref('oldPwd')).concat(admin_pwd),//新密码不能跟老密码相同
  },
}
// 查询用户
exports.selectAdmin = {
  query: {
    query: joi.string().max(18).allow(null).allow(''),
    pagenum: joi.number().required(),//数字不为空
    pagesize: joi.number().required()//数字不为空
  },
}

// 验证规则对象 - 更新状态
exports.update_state_schema = {
  body: {
    id,
    admin_state
  },
}
exports.del_schema = {
  body: {
    id,
  },
}
