// 导入生成 Token 的包
const jwt = require('jsonwebtoken')
// 加载admin模型
const { jwt_config } = require("../config/default.json")
const { checkBcrypt, bcryptHandle } = require("../utils/encryption")
// const {}
const { delAdmin,selectAdmin, findAdmin, addAdmin ,updatePWD,updateAdmin} = require('../dao/adminDAO')

//处理验证用户登录
const adminlogin = (account_number, admin_pwd, cb) => {
  // 根据账号查询是否存在该用户
  findAdmin(account_number, (err, adminArr) => {
    if (err) return cb(err, null)
    const admin = adminArr[0]
    if (!admin) return cb(new Error("用户不存在"), null)
    if (admin.admin_state == 1) return cb(new Error("该用户已经被封禁"))
    // 密码错误
    if (!checkBcrypt(admin_pwd, admin.admin_pwd)) return cb(new Error("密码错误"))
    //账号密码都正确，生成token返回给前端
    const tokenStr = jwt.sign({'uid':admin.id,'rid':admin.role_id,'account_number':admin.account_number}, jwt_config.secret, { expiresIn: jwt_config.expiresIn })
    cb(null, tokenStr)
  })
}
// 查询用户
const selectAdminS = (selectQuery, cb) => {
  console.log(selectQuery);
  // 含有参数时
  // if (selectQuery.query) {
    selectAdmin(selectQuery, (err, adminArr) => {
      if (err) return cb(err, null)
      // 处理密码,不能将密码返回到前端
      adminArr.forEach((element) => element.admin_pwd = null)
      return cb(null, adminArr)
    })
  // } else {
  //   // 没有参数时
  //   selectAdmin(selectQuery, (err, adminArr) => {
  //     if (err) return cb(err, null)
  //     // 处理密码,不能将密码返回到前端
  //     adminArr.forEach((element) => element.admin_pwd = null)
  //     return cb(null, adminArr)
  //   })
  // }
}
// 添加用户
const addAdminS = (admin, cb) => {
  // 根据账号查询是否存在该用户
  findAdmin(admin.account_number, (err, adminArr) => {
    if (err) return cb(err, null)
    if (adminArr[0]) return cb(new Error("用户已存在"), null)
    // 开始添加
    const newAdmin = { ...admin, admin_pwd: bcryptHandle(admin.admin_pwd) }
    addAdmin(newAdmin, (err, results) => {
      if (err) return cb(err, null)
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
  })
}
const updatePWDS  = (admin,updatepwd,cb) => {
  // 根据账号查询是否存在该用户
  findAdmin(admin.account_number, (err, adminArr) => {
    if (err) return cb(err, null)
    if (!adminArr[0]) return cb(new Error("用户不存在"), null)
    if (!checkBcrypt(updatepwd.oldPwd, adminArr[0].admin_pwd)) return cb(new Error("密码错误"))
    // 修改密码
    updatePWD(adminArr[0].id,bcryptHandle(updatepwd.newPwd),(err, results)=>{
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
    // const newAdmin = { ...admin, admin_pwd: bcryptHandle(admin.admin_pwd) }
    // addAdmin(newAdmin, (err, results) => {
    //   if (err) return cb(err, null)
    //   if (!results) return cb(new Error("添加失败"), null)
    // })
  })
}
// 更新用户信息
  const updateAdminS  = (admin,cb) => {
    // 根据账号查询是否存在该用户
    updateAdmin(admin, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
  }
  const delAdminS  = (admin,cb) => {
      delAdmin(admin.id, (err,results ) => {
        if (err) return cb(err, null)
        if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
        cb(null, "删除成功")
      })
}
module.exports = {
  updatePWDS,
  adminlogin,
  addAdminS,
  selectAdminS,
  updateAdminS,
  delAdminS
}












