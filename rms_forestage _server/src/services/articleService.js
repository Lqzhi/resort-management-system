const {selectArticle} =  require('../dao/article/articleDAO')
const {selectArticleCate} =  require('../dao/article/articleCateDAO')
// 查询文章
const selectArticleS = (selectQuery, cb) => {
  selectArticle(selectQuery, (err, articleArr) => {
    if (err) return cb(err, null)
    return cb(null, articleArr)
  })
}

//查询文章分类

const selectArticleCateS = (cb) => {
  selectArticleCate((err, articleArr) => {
    if (err) return cb(err, null)
    return cb(null, articleArr)
  })
}
module.exports = {
  selectArticleS,
  selectArticleCateS,

}












