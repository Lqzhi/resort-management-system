const joi = require("joi")
// 导入定义验证规则的包
const id = joi.number().required()
const name = joi.string().required()
const lgn = joi.number().required()
const lat = joi.number().required()
const cate_id = joi.number().required()

// 添加地点
exports.add_schema = {
  body: {
    name, 
    lgn,
    lat,
    cate_id
  }
}

// 修改地点信息
exports.update_schema = {
  body: {
    id, 
    name, 
    lgn,
    lat,
    cate_id
  }
}
// 查询
exports.select_schema = {
  query: {
    query: joi.string().max(18).allow(null).allow(''),
    pagenum: joi.number().required(),//数字不为空
    pagesize: joi.number().required()//数字不为空
  },
}
// 删除地点
exports.del_schema = {
  body: {
    id, 
    // is_delete
  }
}