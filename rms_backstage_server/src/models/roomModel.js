const joi = require("joi")
// 导入定义验证规则的包
const id = joi.number().required()
const room_no = joi.number().required()
const room_floor =joi. number().required()
const introduction = joi.string()
const room_state = joi.number().valid(0, 1).required()
const hotel = joi.string().required()
const type_id = joi.number().required()
// 添加
exports.add_schema = {
  body: {
    room_no,
    room_floor,
    // introduction,
    // room_state,
    hotel,
    type_id,
  }
}

// 修改
exports.update_schema = {
  body: {
    id,
    room_no,
    room_floor,
    introduction,
    // room_state,
    hotel,
    type_id,
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
// 删除房间
exports.del_schema = {
  body: {
    id,
  }
 
}
exports.updatestate_schema = {
  body: {
    id,
    room_state
  }
}