const { query, execute } = require('../../utils/database')
const { checkBcrypt } = require('../../utils/encryption')

// 根据参数查询全部
const selectOrder = (querys, cb) => {
  const sql = `SELECT * FROM rms_r_order WHERE order_no LIKE ? LIMIT ?,?`
  query(sql, ["%" + (querys.query || '') + "%", (querys.pagenum - 1)*querys.pagesize, querys.pagesize], (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}
// 根据游客用户查订单
const selectOrderByTid = (id, cb) => {
  const sql = `SELECT * FROM rms_r_order  
  LEFT JOIN rms_r_orderdetail
  ON rms_r_order.id = rms_r_orderdetail.order_id
  WHERE tourist_id = ?`
  query(sql, id, (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}
// 修改订单状态 和 订单详情状态
const updateOrderState = (order_no ,cb) => {
  let sql = 'UPDATE rms_r_order SET order_state = 3 where order_no = ?'
  query(sql, order_no, (err, results, fields) => {
    console.log(results);
    if (err) {
      return cb(err, null)
    }
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
  delOrder,
  selectOrderByTid,
  updateOrderState
}