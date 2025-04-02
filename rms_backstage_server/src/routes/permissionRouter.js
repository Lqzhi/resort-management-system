const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入权限服务模块
const permissionService = require('../services/permissionService')

// 查找权限
router.get('/find',(req, res, next) => {
  permissionService.selectPermissionS((err, permissionArr) => {
    if (err) return next(err)
    return res.send(successbody(permissionArr))
  })
}
)

module.exports = router 
