const joi = require("joi")
// 导入定义验证规则的包
const id = joi.number().required()
const name = joi.string().required()
const desc = joi.string().required()
// const art_img = joi.any().required()
const is_delete = joi.number().valid(0, 1)
// 添加
exports.add_cate_schema = {
  body: {
    name,
    desc,
  }
}

// 修改
exports.update_cate_schema = {
  body: {
    id,
    name,
    desc,
   
  }
}
// // 查询
// exports.select_cate_schema = {
//   query: {
//     query: joi.string().max(18).allow(null).allow(''),
//     pagenum: joi.number().required(),//数字不为空
//     pagesize: joi.number().required()//数字不为空
//   },
// }

// 删除
exports.del_cate_schema = {
  body: {
    id, 
    // is_delete
  }
}