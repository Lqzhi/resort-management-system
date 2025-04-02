const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入游客服务模块
const touristService = require('../services/touristService')
// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象
const {del_schema, update_password_schema,  update_schema,  reg_schema } = require('../models/touristModel')

//添加用户
router.post('/add', expressJoi(reg_schema), (req, res, next) => {
  touristService.addTouristS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改用户
router.put('/update',expressJoi(update_schema), (req, res, next) => {
  touristService.updateTouristS({...req.body,id:req.auth.id}, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

router.get('/my', (req, res, next) => {
  touristService.selectTouristS(req.auth.id,(err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)
// 查看个人信息


// 修改用户密码
router.put('/updatepwd', expressJoi(update_password_schema), (req, res, next) => {
  touristService.updatePWDS(req.auth, req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)


//删除
router.delete('/del',expressJoi(del_schema), (req, res, next) => {
  touristService.delTouristS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
})
module.exports = router 
