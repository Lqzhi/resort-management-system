const crypto = require('crypto')
const bcrypt = require('bcrypt')

// 加载配置
const {md5_config,bcrypt_config} = require('../config/default')

// md5加密
const md5Handle = (password) => crypto.createHash('md5').update(password+md5_config.salt).digest('hex')

// bcrypt加密
const bcryptHandle = (password) => bcrypt.hashSync(password, bcrypt_config.saltRounds)

//检测md5加密的密码
const checkmd5 = (infoPassword,dbPassword) => Object.is(md5Handle(infoPassword),dbPassword)

//检测Bcrypt加密的密码
const checkBcrypt = bcrypt.compareSync

//导出加密及检测密码中间件
module.exports = {
  md5Handle,
  bcryptHandle,
  checkmd5,
  checkBcrypt
}

