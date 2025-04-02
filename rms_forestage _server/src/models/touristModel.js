// 导入定义验证规则的包
const joi = require('joi')

const id = joi.number().required()//游客用户id
const number = joi.number().required()//账号
const full_name = joi.string().min(2).max(18).required()//用户名
const ID_card_passport = joi.number().required()
const nickname = joi.string().min(1).max(10).required()//用户昵称
const gender = joi.number().valid(0,1,2,3).empty('').allow(null).allow('')
const qq = joi.number().allow(null).allow('')
const email = joi.string().email().empty('').allow(null).allow('')//游客用户电子邮箱
const password = joi.string().min(3).max(12).required()//密码
const telephone = joi.string().length(11).pattern(/^\d*$/).empty('').allow(null).allow('')//游客用户手机号码
const introduction = joi.string().max(100).allow(null).allow('')
const create_method = joi.number().valid(0,1)
const wechat = joi.string().min(6).max(20).allow(null).allow('')
const state =  joi.number().valid(0, 1)//管理状态0为启用 1为禁用

// 定义验证登录表单数据的规则对象
exports.login_schema = {
  body: {
    number,
    password
}
}

// 验证规则对象 - 新建游客用户基本信息
exports.reg_schema = {
  body: {
    number,
    full_name,
    ID_card_passport,
    nickname,
    gender,
    qq,
    email,
    password,
    telephone,
    introduction,
    wechat
  }
}
// 验证规则对象 - 更新基本信息
exports.update_schema = {
  body: {
    full_name,
    ID_card_passport,
    nickname,
    gender,
    qq,
    email,
    telephone,
    introduction,
    wechat
  },
}

// 验证规则对象 - 更新密码
exports.update_password_schema = {
  body: {
    oldPwd: password,
    newPwd: joi.not(joi.ref('oldPwd')).concat(password),//新密码不能跟老密码相同
  },
}
// 查询用户
exports.selectTourist = {
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
    state
  },
}
  exports.del_schema = {
    body: {
      id,
    },
}
