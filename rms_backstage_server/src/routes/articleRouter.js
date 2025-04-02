const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入文章服务模块
const articleService = require('../services/articleService')
// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象
const {del_schema,update_schema,add_schema,select_schema} = require('../models/articleModel')
const { del_cate_schema,update_cate_schema,add_cate_schema} = require('../models/articleCateModel')


// 查找文章
router.get('/find',expressJoi(select_schema),(req, res, next) => {
  articleService.selectArticleS(req.query,(err, articleArr) => {
    if (err) return next(err)
    return res.send(successbody(articleArr))
  })
}
)
//添加文章
router.post('/add', expressJoi(add_schema), (req, res, next) => {
  console.log(req.body)
  articleService.addArticleS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改文章
router.put('/update', expressJoi(update_schema), (req, res, next) => {
  console.log(req.body)
  articleService.updateArticleS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除文章
router.delete('/del', expressJoi(del_schema), (req, res, next) => {
  articleService.delArticleS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 查找文章分类
router.get('/cate',(req, res, next) => {
  articleService.selectArticleCateS((err, articleArr) => {
    if (err) return next(err)
    return res.send(successbody(articleArr))
  })
}
)
//添加文章分类
router.post('/cate',(r,s,n)=>{console.log(r.body),n()},expressJoi(add_cate_schema),(req, res, next) => {
  console.log(req.body)
  articleService.addArticleCateS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改文章分类
router.put('/cate', expressJoi(update_cate_schema), (req, res, next) => {
  console.log(req.body)
  articleService.updateArticleCateS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除文章分类
router.delete('/cate', expressJoi(del_cate_schema), (req, res, next) => {
  articleService.delArticleCateS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

module.exports = router 
