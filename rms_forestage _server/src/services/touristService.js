// 导入生成 Token 的包
const jwt = require('jsonwebtoken')
// 加载tourist模型
const { jwt_config } = require("../config/default.json")
const { md5Handle, checkmd5 } = require("../utils/encryption")
// const {}
const { selectTourist, findTourist, addTourist, updatePWD, updateTourist, delTourist } = require('../dao/touristDAO')

//处理验证用户登录
const touristlogin = (number, password, cb) => {
  // 根据账号查询是否存在该用户

  findTourist(number, (err, touristArr) => {
    if (err) return cb(err, null)
    const tourist = touristArr[0]
    if (!tourist) return cb(new Error("用户不存在"), null)
    if (tourist.state == 1) return cb(new Error("该用户已经被封禁"))
    // 密码错误
    if (!checkmd5(password,tourist.password)) return cb(new Error("密码错误"))
    //账号密码都正确，生成token返回给前端
    const tokenStr = jwt.sign({id:tourist.id, number:tourist.number}, jwt_config.secret, { expiresIn: jwt_config.expiresIn })
    cb(null, tokenStr)
  })
}
//个人信息
const selectTouristS = (id, cb) => {
  selectTourist(id, (err, touristArr) => {
    if (err) return cb(err, null)
    // 处理密码,不能将密码返回到前端
    // touristArr.forEach((element) => element.tourist_pwd = null)
    return cb(null, touristArr)
  })
}
// 添加用户
const addTouristS = (tourist, cb) => {
  // 根据账号查询是否存在该用户
  findTourist(tourist.number, (err, touristArr) => {
    if (err) return cb(err, null)
    if (touristArr[0]) return cb(new Error("账号已存在"), null)
    // 开始添加
    const newTourist = { ...tourist, password: md5Handle(tourist.tourist_pwd) }
    addTourist(newTourist, (err, results) => {
      if (err) return cb(err, null)
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
  })
}
const updatePWDS = (tourist, updatepwd, cb) => {
  // 根据账号查询是否存在该用户
  findTourist(tourist.number, (err, touristArr) => {
    if (err) return cb(err, null)
    if (!touristArr[0]) return cb(new Error("用户不存在"), null)
    if (!checkmd5(updatepwd.oldPwd, touristArr[0].password)) return cb(new Error("密码错误"))
    // 修改密码
    updatePWD(touristArr[0].id, md5Handle(updatepwd.newPwd), (err, results) => {
      if (err) return cb(err, null)
      if (results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
  })
}
// 更新用户信息
const updateTouristS = (tourist, cb) => {
  // 根据账号查询是否存在该用户
  updateTourist(tourist, (err, results) => {
    if (err) return cb(err, null)
    if (results.affectedRows !== 1) return cb(new Error("更新失败"), null)
    cb(null, "更新成功")
  })
}
const delTouristS = (tourist, cb) => {
  delTourist(tourist.id, (err, results) => {
    if (err) return cb(err, null)
    if (results.affectedRows !== 1) return cb(new Error("删除失败"), null)
    cb(null, "删除成功")
  })
}
module.exports = {
  updatePWDS,
  touristlogin,
  addTouristS,
  selectTouristS,
  updateTouristS,
  delTouristS
}












