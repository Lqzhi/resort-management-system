const { query, execute } = require('../../utils/database')
const { checkBcrypt } = require('../../utils/encryption')

// 根据参数查询全部
const selectOrder = (querys, cb) => {
  const sql = `SELECT * FROM rms_r_order as r LEFT JOIN rms_r_orderdetail as t ON  r.id = t.order_id   WHERE r.order_no LIKE ? LIMIT ?,?`
  query(sql, ["%" + (querys.query || '') + "%", (querys.pagenum - 1)*querys.pagesize, querys.pagesize], (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 修改信息
const updateOrder = (order, cb) => {
  const sql = 'UPDATE rms_r_order SET ? where id = ?'
  query(sql, [order,order.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 添加
const addOrder = (order, cb) => {
  const sql = 'INSERT INTO rms_r_order set ?'
  query(sql, order, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 删除
const delOrder = (order, cb) => {
  const sql = 'DELETE FROM rms_r_order WHERE id=?'
  query(sql, [order.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  selectOrder,
  updateOrder,
  addOrder,
  delOrder
}