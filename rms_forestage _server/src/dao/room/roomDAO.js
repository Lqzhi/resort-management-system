const { query, execute } = require('../../utils/database')
const { checkBcrypt } = require('../../utils/encryption')

// 根据参数查询全部房间类型
const selectRoom = (cb) => {
  const sql = `SELECT t.*, p.picture_adress, COUNT(r.id) AS number
  FROM rms_r_type as t
  LEFT JOIN rms_room as r ON r.type_id = t.id AND r.room_state = 0
  LEFT JOIN rms_r_picture as p ON t.id = p.type_id
  GROUP BY t.id, t.r_type_name, p.id;`
  query(sql, (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}
const selectRoomp = (id,cb) => {
  const sql = `SELECT * FROM rms_r_type WHERE id = ?`
  query(sql, [id],(err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 修改房间信息
const updateRoom = (room, cb) => {
  const sql = 'UPDATE rms_room SET ? where id = ?'
  query(sql, [room, room.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 抛出模块
module.exports = {
  selectRoom,
  selectRoomp,
  // updateRoom,

}