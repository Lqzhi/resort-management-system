const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')

// 导入管理员服务模块
const touristService = require('../services/touristService')

// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象
const { login_schema ,reg_schema} = require('../models/touristModel')

// 登录-验证数据是否合理
router.post('/login',expressJoi(login_schema), (req, res, next) => {
  touristService.touristlogin(req.body.number, req.body.password, (err, tokenStr) => {
    if (err) return next(err)
    res.send(successbody('Bearer ' + tokenStr))
  })
})
router.post('/reg', expressJoi(reg_schema), (req, res, next) => {
  touristService.addTouristS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
})

module.exports = router
