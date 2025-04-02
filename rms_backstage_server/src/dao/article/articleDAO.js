const { query, execute } = require('../../utils/database')
const { checkBcrypt } = require('../../utils/encryption')

// 根据参数查询全部文章
const selectArticle = (querys, cb) => {
  const sql = `SELECT r.*,t.name FROM rms_article as r LEFT JOIN rms_art_cate as t ON  r.cate_id= t.id WHERE title LIKE ? AND r.is_delete = 0 LIMIT ?,?`
  query(sql, ["%" + (querys.query || '') + "%", (querys.pagenum - 1)*querys.pagesize, querys.pagesize], (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 修改文章信息
const updateArticle = (article, cb) => {
  const sql = 'UPDATE rms_article SET ? where id = ?'
  query(sql, [article,article.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 添加文章
const addArticle = (article, cb) => {
  const sql = 'INSERT INTO rms_article set ?'
  query(sql, article, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 删除文章
const delArticle = (article, cb) => {
  const sql = 'DELETE FROM rms_article WHERE id=?'
  query(sql, [article.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  selectArticle,
  updateArticle,
  addArticle,
  delArticle
}