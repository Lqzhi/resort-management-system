const joi = require("joi")
// 导入定义验证规则的包
const id = joi.number().required()
const r_type_name = joi.string().required()
const r_type_introduction = joi.string().required()
// const art_img = joi.any().required()
const room_price = joi.number().required()
const room_deposit = joi.number().required()

// 添加
exports.add_type_schema = {
  body: {
    r_type_name,
    r_type_introduction,
    room_price,
    room_deposit,
  }
}

// 修改
exports.update_type_schema = {
  body: {
    id,
    r_type_name,
    r_type_introduction,
    room_price,
    room_deposit,
   
  }
}
// // 查询
// exports.select_type_schema = {
//   query: {
//     query: joi.string().max(18).allow(null).allow(''),
//     pagenum: joi.number().required(),//数字不为空
//     pagesize: joi.number().required()//数字不为空
//   },
// }

// 删除
exports.del_type_schema = {
  body: {
    id, 
    // is_delete
  }
}