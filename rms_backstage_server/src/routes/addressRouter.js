const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入地点服务模块
const addressService = require('../services/addressService')
// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象
const {del_schema,update_schema,add_schema,select_schema} = require('../models/addressModel')
const { del_cate_schema,update_cate_schema,add_cate_schema} = require('../models/addressCateModel')


// 查找地点
router.get('/find',expressJoi(select_schema),(req, res, next) => {
  addressService.selectAddressS(req.query,(err, addressArr) => {
    if (err) return next(err)
    return res.send(successbody(addressArr))
  })
}
)
//添加地点
router.post('/add', expressJoi(add_schema), (req, res, next) => {
  console.log(req.body)
  addressService.addAddressS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改地点
router.put('/update', expressJoi(update_schema), (req, res, next) => {
  console.log(req.body)
  addressService.updateAddressS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除地点
router.delete('/del', expressJoi(del_schema), (req, res, next) => {
  addressService.delAddressS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 查找地点分类
router.get('/cate',(req, res, next) => {
  addressService.selectAddressCateS((err, addressArr) => {
    if (err) return next(err)
    return res.send(successbody(addressArr))
  })
}
)
//添加地点分类
router.post('/cate',(r,s,n)=>{console.log(r.body),n()},expressJoi(add_cate_schema),(req, res, next) => {
  console.log(req.body)
  addressService.addAddressCateS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改地点分类
router.put('/cate', expressJoi(update_cate_schema), (req, res, next) => {
  console.log(req.body)
  addressService.updateAddressCateS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除地点分类
router.delete('/cate', expressJoi(del_cate_schema), (req, res, next) => {
  console.log("vv");
  addressService.delAddressCateS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

module.exports = router 
