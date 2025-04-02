const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入服务模块
const orderService = require('../services/orderService')
// 1. 导入验证数据的中间件

// 游客取消订单
router.delete('/cancel',(req, res, next) => {
  orderService.updateOrderStateS(req.body.order_no,(err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })


  // orderService.selectOrderByTidS(req.auth.id,(err, orderArr) => {
  //   if (err) return next(err)
  //   return res.send(successbody(orderArr))
  // })
}
)



// 查找
router.get('/my',(req, res, next) => {
  orderService.selectOrderByTidS(req.auth.id,(err, orderArr) => {
    if (err) return next(err)
    return res.send(successbody(orderArr))
  })
}
)


// 查找
router.get('/find',(req, res, next) => {
  orderService.selectOrderS(req.query,(err, orderArr) => {
    if (err) return next(err)
    return res.send(successbody(orderArr))
  })
}
)
//添加
router.post('/add',  (req, res, next) => {
  orderService.addOrderS(req.body,req.auth,(err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改
router.put('/update', (req, res, next) => {
  console.log(req.body)
  orderService.updateOrderS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 查找详情
router.get('/detail',(req, res, next) => {
  orderService.selectOrderDetailS(req.query,(err, orderArr) => {
    if (err) return next(err)
    return res.send(successbody(orderArr))
  })
}
)

// 修改详情
router.put('/detail', (req, res, next) => {
  console.log(req.body)
  orderService.updateOrderDetailS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除详情
router.delete('/detail',  (req, res, next) => {
  orderService.delOrderDetailS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

module.exports = router 
