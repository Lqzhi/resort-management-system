const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入服务模块
const orderService = require('../services/orderService')
// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象
const {del_schema,update_schema,add_schema,select_schema} = require('../models/orderModel')
const { del_detail_schema,update_detail_schema,add_detail_schema} = require('../models/orderDetailModel')


// 查找
router.get('/find',expressJoi(select_schema),(req, res, next) => {
  orderService.selectOrderS(req.query,(err, orderArr) => {
    if (err) return next(err)
    return res.send(successbody(orderArr))
  })
}
)
//添加
router.post('/add', expressJoi(add_schema), (req, res, next) => {
  console.log(req.body)
  orderService.addOrderS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改
router.put('/update', expressJoi(update_schema), (req, res, next) => {
  console.log(req.body)
  orderService.updateOrderS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除
router.delete('/del', expressJoi(del_schema), (req, res, next) => {
  orderService.delOrderS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 查找详情
router.get('/detail',expressJoi(select_schema),(req, res, next) => {
  orderService.selectOrderDetailS(req.query,(err, orderArr) => {
    if (err) return next(err)
    return res.send(successbody(orderArr))
  })
}
)
//添加详情
router.post('/detail',(r,s,n)=>{console.log(r.body),n()},expressJoi(add_detail_schema),(req, res, next) => {
  console.log(req.body)
  orderService.addOrderDetailS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改详情
router.put('/detail', expressJoi(update_detail_schema), (req, res, next) => {
  console.log(req.body)
  orderService.updateOrderDetailS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除详情
router.delete('/detail', expressJoi(del_detail_schema), (req, res, next) => {
  orderService.delOrderDetailS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

module.exports = router 
