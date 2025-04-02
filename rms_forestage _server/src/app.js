// 导入 express
const express = require('express')
// 创建服务器的实例对象
const app = express()
//数据验证第三方中间件joi
const joi = require('joi')
// 导入并配置 cors 中间件 解决跨域请求
const cors = require('cors')
//导入xss中间件防止xss攻击
const xss = require('xss')
//导入路径模块
const path = require('path')
//导入统一格式返回失败或成功响应
const {successbody,failbody} = require('./utils/respBody')  
// 注册跨域请求中间件
app.use(cors())

// 配置解析表单数据的中间件，注意：这个中间件，只能解析 application/x-www-form-urlencoded 格式的表单数据
app.use(express.urlencoded({ extended: false }))
// 配置解析表单数据的中间件，解析json格式
app.use(express.json())

// 托管静态资源文件
app.use('/uploads', express.static(path.join(__dirname,'../../uploads')))

// 一定要在路由之前配置解析 Token 的中间件
const {expressjwt} = require('express-jwt')
const {jwt_config} = require('./config/default')

// 除api路径以外其他都要带token
// app.use(expressjwt(jwt_config).unless({ path: [/^\/api/] }))


/**
 * 
 * 路由
 *  */ 

// // 导入并使用用户注册登录路由（后台不需要注册，只能管理员添加）
const regLogRouter = require('./routes/regLogRouter')
const articleRouter = require("./routes/articleRouter")
const roomRouter = require("./routes/roomRouter")
const addressRouter = require("./routes/addressRouter")
const orderRouter = require("./routes/orderRouter")
const touristRouter = require("./routes/touristRouter")
app.use('/api', regLogRouter)
app.use('/article',articleRouter)
app.use('/room',roomRouter)
app.use('/address',addressRouter)
app.use(expressjwt(jwt_config).unless({ path: [/^\/api/] }))
app.use('/order',orderRouter)
app.use('/tourist',touristRouter)



// 其它路径返回没找到
app.use((req, res, next)=> {
  throw new Error("Not Found")
})
// 定义错误级别的中间件.错误统一处理    
app.use((err, req, res, next) => {
//  捕获错误并返回
  res.send(failbody(err))
}) 



// 启动服务器
 const server = app.listen(5003, () => {
  console.log('服务器已启动 http://127.0.0.1:5003')
 })

