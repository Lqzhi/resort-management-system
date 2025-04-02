const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入文章服务模块
const articleService = require('../services/articleService')
// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象



// 查找文章
router.get('/find',(req, res, next) => {
  articleService.selectArticleS(req.query,(err, articleArr) => {
    if (err) return next(err)
    return res.send(successbody(articleArr))
  })
}
)
router.get('/cate',(req, res, next) => {
  articleService.selectArticleCateS((err, articleArr) => {
    if (err) return next(err)
    return res.send(successbody(articleArr))
  })
}
)

module.exports = router 
