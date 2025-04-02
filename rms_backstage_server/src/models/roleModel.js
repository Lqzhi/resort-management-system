// 导入定义验证规则的包
const joi = require('joi')
const id = joi.number().required()//角色id
const role_name = joi.string().min(2).max(18).required()//角色名
const introduction = joi.string().allow(null)//昵称


// 定义验证登录表单数据的规则对象
exports.add_schema = {
  body: {
    role_name,
    introduction,
  },
}

// 验证规则对象 - 新建角色基本信息
exports.del_schema = {
  body: {
    id,
  },
}

// 修改角色信息
exports.update_schema = {
  body: {
    id,
    role_name,
    introduction,
  }
}