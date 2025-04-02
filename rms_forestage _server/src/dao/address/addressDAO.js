const { query, execute } = require('../../utils/database')
const { checkBcrypt } = require('../../utils/encryption')

// 根据参数查询全部地点
const selectAddress = (cb) => {
  const sql = `SELECT * FROM rms_add_picture as r LEFT JOIN rms_address as t ON  r.address_id = t.id  `
  query(sql,  (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 抛出模块
module.exports = {
  selectAddress
}