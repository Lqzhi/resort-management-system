const joi = require("joi")
// 导入定义验证规则的包
const id = joi.number().required()
const order_id = joi.number().required()
const book_time = joi.string().required()
const occupation_time = joi.string().required()
const check_out_time = joi.string().required()
const order_state = joi.number().valid(0, 1,2,3)
const room_deposit = joi.number().required()
const room_price = joi.number().required()
const total_days = joi.number().required()
const refund = joi.number().required()
const ID_card_passport =  joi.string().required()
const linkman =  joi.string().required()
const linkphone = joi.number().required()
const admin_id = joi.number().required()
// 添加
exports.add_detail_schema = {
  body: {
    order_id,
    book_time,
    occupation_time,
    check_out_time,
    order_state,
    room_deposit,
    room_price,
    total_days,
    refund,
    ID_card_passport,
    linkman,
    linkphone,
    admin_id,
  }
}

// 修改
exports.update_detail_schema = {
  body: {
    id,
    order_state,
  }
}
// // 查询
exports.select_detail_schema = {
  query: {
    query: joi.string().max(18).allow(null).allow(''),
    pagenum: joi.number().required(),//数字不为空
    pagesize: joi.number().required()//数字不为空
  },
}

// 删除
exports.del_detail_schema = {
  body: {
    id, 
    // is_delete
  }
}