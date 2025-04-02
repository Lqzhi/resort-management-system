// 导入生成 Token 的包
const jwt = require('jsonwebtoken')
// 加载role模型
const { jwt_config } = require("../config/default.json")
const { checkBcrypt, bcryptHandle } = require("../utils/encryption")
// const {}
const { selectRole, delRole, addRole ,updateRole} = require('../dao/roleDAO')


// 查询角色
const selectRoleS = (cb) => {
    selectRole((err, roleArr) => {
      if (err) return cb(err, null)
      return cb(null, roleArr)
    })
}
// 添加角色
const addRoleS = (role, cb) => {

    addRole(role, (err, results) => {
      if (err) return cb(err, null)
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
}
// 更新角色信息
  const updateRoleS  = (role,cb) => {
    // 根据账号查询是否存在该角色
    updateRole(role, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
}
const delRoleS = (role,cb) => {
	delRole(role, (err,results ) => {
		if (err) return cb(err, null)
		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
		cb(null, "删除成功")
	})
}
module.exports = {
	selectRoleS,
	addRoleS,
	updateRoleS,
	delRoleS
}












