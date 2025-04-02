const { query, execute } = require('../../utils/database')
const { checkBcrypt } = require('../../utils/encryption')

// 根据参数查询全部房间类型
const selectRoomType = ( cb) => {
  const sql = `SELECT * FROM rms_r_type`
  query(sql, (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 修改房间类型信息
const updateRoomType = (cate, cb) => {
  const sql = 'UPDATE rms_r_type SET ? where id = ?'
  query(sql, [cate,cate.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 添加房间类型
const addRoomType = (cate, cb) => {
  const sql = 'INSERT INTO rms_r_type set ?'
  query(sql, cate, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 删除房间类型
const delRoomType = (cate, cb) => {
  const sql = 'DELETE FROM rms_r_type WHERE id=?'
  query(sql, [cate.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  selectRoomType,
  updateRoomType,
  addRoomType,
  delRoomType
}