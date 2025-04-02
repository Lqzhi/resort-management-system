const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入地点服务模块
const addressService = require('../services/addressService')
// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象



// 查找地点
router.get('/find', (req, res, next) => {
  addressService.selectAddressS((err, addressArr) => {
    if (err) return next(err)
    for (let i = 0; i < addressArr.length; i++) {
      addressArr[i].picture_address = "http://" + req.headers.host + "/uploads/" + addressArr[i].picture_address
    }
    return res.send(successbody(addressArr))
  })
}
)

module.exports = router 
