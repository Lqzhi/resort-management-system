const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入服务模块
const menuService = require('../services/menuService')
// 1. 导入验证数据的中间件


// const result = listTransTree(arr, 'permission_pid')
// return cb(null,result)



router.get('/', (req, res, next) => {
  console.log(req.auth.rid);
  menuService.getMenus(req.auth.rid, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)


module.exports = router 