const { query, execute } = require('../../utils/database')

// 根据参数查询全部详情
const selectOrderDetail = (querys,cb) => {
  const sql = `SELECT * FROM rms_r_orderdetail  WHERE order_id LIKE ? LIMIT ?,?`
  query(sql, ["%" + (querys.query || '') + "%", (querys.pagenum - 1)*querys.pagesize, querys.pagesize], (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 修改详情信息
const updateOrderDetail = (cate, cb) => {
  const sql = 'UPDATE rms_r_orderdetail SET ? where id = ?'
  query(sql, [cate,cate.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 添加详情
const addOrderDetail = (cate, cb) => {
  const sql = 'INSERT INTO rms_r_orderdetail set ?'
  query(sql, cate, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 删除详情
const delOrderDetail = (cate, cb) => {
  const sql = 'DELETE FROM rms_r_orderdetail WHERE id=?'
  query(sql, [cate.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  selectOrderDetail,
  updateOrderDetail,
  addOrderDetail,
  delOrderDetail
}