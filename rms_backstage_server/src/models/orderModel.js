const joi = require("joi")
// 导入定义验证规则的包
const id = joi.number().required()
const order_no = joi.number().required()
const order_state = joi.number().required()
const room_id = joi.number().required()
const room_no = joi.number().required()
const pay_amount = joi.number().required()
const tourist_id = joi.number().required()


// 添加
exports.add_schema = {
  body: {
    order_no, 
    order_state, 
    room_id, 
    room_no, 
    pay_amount, 
    tourist_id, 
  }
}

// 修改
exports.update_schema = {
  body: {
    id, 
    order_no, 
    order_state, 
    room_id, 
    room_no, 
    pay_amount, 
    tourist_id, 
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

// 删除
exports.del_schema = {
  body: {
    id, 
    // is_delete
  }
}