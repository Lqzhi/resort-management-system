const { log } = require('grunt')
const { query, execute } = require('../../utils/database')

// 根据参数查询全部地点分类
const selectAddressCate = ( cb) => {
  const sql = `SELECT * FROM rms_add_cate `
  query(sql, (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 修改地点分类信息
const updateAddressCate = (cate, cb) => {
  const sql = 'UPDATE rms_add_cate SET ? where id = ?'
  query(sql, [cate,cate.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 添加地点分类
const addAddressCate = (cate, cb) => {
  const sql = 'INSERT INTO rms_add_cate set ?'
  query(sql, cate, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 删除地点分类
const delAddressCate = (cate, cb) => {
  const sql = 'DELETE FROM rms_add_cate WHERE id=?'
  query(sql, [cate.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  selectAddressCate,
  updateAddressCate,
  addAddressCate,
  delAddressCate
}