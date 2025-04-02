const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入角色服务模块
const roleService = require('../services/roleService')
// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象
const { del_schema,update_schema,add_schema} = require('../models/roleModel')

// 查找角色
router.get('/find',(req, res, next) => {
  roleService.selectRoleS((err, roleArr) => {
    if (err) return next(err)
    return res.send(successbody(roleArr))
  })
}
)
//添加角色
router.post('/add', expressJoi(add_schema), (req, res, next) => {
  console.log(req.body)
  roleService.addRoleS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改角色
router.put('/update', expressJoi(update_schema), (req, res, next) => {
  console.log(req.body)
  roleService.updateRoleS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除角色
router.delete('/del', expressJoi(del_schema), (req, res, next) => {
  roleService.delRoleS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

module.exports = router 
