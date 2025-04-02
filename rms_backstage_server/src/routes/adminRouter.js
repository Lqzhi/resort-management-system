const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入管理员服务模块
const adminService = require('../services/adminService')
// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象
const {del_schema, update_password_schema, update_role_schema, update_schema, selectAdmin, reg_schema, update_state_schema } = require('../models/adminModel')

// 查找管理员用户
router.get('/find', expressJoi(selectAdmin), (req, res, next) => {
  adminService.selectAdminS(req.query,(err, adminArr) => {
    if (err) return next(err)
    return res.send(successbody(adminArr))
  })
}
)
//添加用户
router.post('/add', expressJoi(reg_schema), (req, res, next) => {
  adminService.addAdminS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改用户
router.put('/update',(r,q,n)=>{console.log(r.query),n()},expressJoi(update_schema), (req, res, next) => {
  adminService.updateAdminS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 修改用户密码
router.put('/updatepwd', expressJoi(update_password_schema), (req, res, next) => {
  adminService.updatePWDS(req.auth, req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)
//分配角色
router.put('/assign', expressJoi(update_role_schema), (req, res, next) => {
  adminService.updateAdminS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)
//更新状态
router.put('/updatestate', expressJoi(update_state_schema), (req, res, next) => {
  adminService.updateAdminS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)
//删除
router.delete('/del',expressJoi(del_schema), (req, res, next) => {
  adminService.delAdminS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)
module.exports = router 
