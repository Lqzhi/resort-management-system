const joi = require("joi")
// 导入定义验证规则的包
const id = joi.number().required()
const title = joi.string().required()
const content = joi.string().required()
// const art_img = joi.any().required()
const state = joi.number().valid(0, 1)
const is_delete = joi.number().valid(0, 1)
const cate_id = joi.number().required()

// 添加文章
exports.add_schema = {
  body: {
    title, 
    content,
    // art_img,
    state,
    cate_id
  }
}

// 修改文章信息
exports.update_schema = {
  body: {
    id, 
    title, 
    content,
    // art_img,
    state,
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
// 发布文章
exports.publish_schema = {
  body: {
    id, 
    state
  }
}
// 删除文章
exports.del_schema = {
  body: {
    id, 
    // is_delete
  }
}