// 导入生成 Token 的包
const jwt = require('jsonwebtoken')
// 加载article模型
const { jwt_config } = require("../config/default.json")
const { checkBcrypt, bcryptHandle } = require("../utils/encryption")
// const {}
const { selectArticle, delArticle, addArticle ,updateArticle} = require('../dao/article/articleDAO')
const{selectArticleCate, delArticleCate, addArticleCate ,updateArticleCate} = require('../dao/article/articleCateDAO')

// 查询文章
const selectArticleS = (selectQuery,cb) => {
    selectArticle(selectQuery,(err, articleArr) => {
      if (err) return cb(err, null)
      return cb(null, articleArr)
    })
}
// 添加文章
const addArticleS = (article, cb) => {
 

    addArticle(article, (err, results) => {
      if (err) return cb(err, null)
      console.log(results);
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
}
// 更新文章信息
  const updateArticleS  = (article,cb) => {
    // 根据账号查询是否存在该文章
    updateArticle(article, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
}
//删除文章（修改删除状态）
const delArticleS = (article,cb) => {
	updateArticle({is_delete:1,...article}, (err,results ) => {
		if (err) return cb(err, null)
		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
		cb(null, "删除成功")
	})
}
//删除文章
// const delArticleS = (article,cb) => {
// 	delArticle(article, (err,results ) => {
// 		if (err) return cb(err, null)
// 		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
// 		cb(null, "删除成功")
// 	})
// }

//查询文章分类
const selectArticleCateS = (selectQuery,cb) => {
    selectArticleCate(selectQuery,(err, articleArr) => {
      if (err) return cb(err, null)
      return cb(null, articleArr)
    })
}
// 添加文章分类
const addArticleCateS = (article, cb) => {
 

    addArticleCate(article, (err, results) => {
      if (err) return cb(err, null)
      console.log(results);
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
}
// 更新文章分类信息
  const updateArticleCateS  = (article,cb) => {
    // 根据账号查询是否存在该文章分类
    updateArticleCate(article, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
}
//删除文章分类（修改删除状态）
const delArticleCateS = (article,cb) => {
	updateArticleCate({is_delete:1,...article}, (err,results ) => {
		if (err) return cb(err, null)
		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
		cb(null, "删除成功")
	})
}
module.exports = {
	selectArticleS,
	addArticleS,
	updateArticleS,
	delArticleS,
  selectArticleCateS,
  addArticleCateS,
  updateArticleCateS,
  delArticleCateS
}












