const { query, execute } = require('../../utils/database')
const { checkBcrypt } = require('../../utils/encryption')

// 根据参数查询全部地点
const selectAddress = (querys, cb) => {
  const sql = `SELECT r.*,t.name as cname FROM rms_address as r LEFT JOIN rms_add_cate as t ON  r.cate_id= t.id  WHERE r.name LIKE ?  LIMIT ?,?`
  query(sql, ["%" + (querys.query || '') + "%", (querys.pagenum - 1)*querys.pagesize, querys.pagesize], (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 修改地点信息
const updateAddress = (address, cb) => {
  const sql = 'UPDATE rms_address SET ? where id = ?'
  query(sql, [address,address.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 添加地点
const addAddress = (address, cb) => {
  const sql = 'INSERT INTO rms_address set ?'
  query(sql, address, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 删除地点
const delAddress = (address, cb) => {
  const sql = 'DELETE FROM rms_address WHERE id=?'
  query(sql, [address.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  selectAddress,
  updateAddress,
  addAddress,
  delAddress
}