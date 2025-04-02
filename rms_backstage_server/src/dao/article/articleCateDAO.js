const { query, execute } = require('../../utils/database')

// 根据参数查询全部文章分类
const selectArticleCate = ( cb) => {
  const sql = `SELECT * FROM rms_art_cate WHERE is_delete = 0 `
  query(sql, (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 修改文章分类信息
const updateArticleCate = (cate, cb) => {
  const sql = 'UPDATE rms_art_cate SET ? where id = ?'
  query(sql, [cate,cate.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 添加文章分类
const addArticleCate = (cate, cb) => {
  const sql = 'INSERT INTO rms_art_cate set ?'
  query(sql, cate, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 删除文章分类
const delArticleCate = (cate, cb) => {
  const sql = 'DELETE FROM rms_art_cate WHERE id=?'
  query(sql, [cate.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  selectArticleCate,
  updateArticleCate,
  addArticleCate,
  delArticleCate
}