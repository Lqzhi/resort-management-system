const { query, execute } = require('../../utils/database')

// 根据参数查询全部文章分类
const selectArticleCate = ( cb) => {
  const sql = `SELECT * FROM rms_art_cate WHERE is_delete = 0 `
  query(sql, (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}


// 抛出模块
module.exports = {
  selectArticleCate,
}