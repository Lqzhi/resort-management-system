const { query, execute } = require('../../utils/database')
const { checkBcrypt } = require('../../utils/encryption')

// 根据参数查询全部文章
const selectArticle = (querys, cb) => {
  let sql = ""
  if (querys.cid) {
    sql = `SELECT * FROM rms_article  WHERE  rms_article.is_delete = 0 and cate_id = ?`
    query(sql, [querys.cid], (err, results, fields) => {
      if (err) return cb(err, null)
      cb(null, results)
    })
  } else {
    sql = `SELECT * FROM rms_article  WHERE  rms_article.is_delete = 0 `
    query(sql, (err, results, fields) => {
      if (err) return cb(err, null)
      cb(null, results)
    })
  }
}


// 抛出模块
module.exports = {
  selectArticle,
}