const { query, execute } = require('../../utils/database')
const { checkBcrypt } = require('../../utils/encryption')

// 根据参数查询全部房间
const selectRoom = (querys, cb) => {
  const sql = `SELECT r.*,t.r_type_name FROM rms_room as r LEFT JOIN rms_r_type as t ON  r.type_id= t.id  WHERE room_no LIKE ? LIMIT ?,?`
  query(sql, ["%" + (querys.query || '') + "%", (querys.pagenum - 1)*querys.pagesize, querys.pagesize], (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}


const selectRoomBytid = (tid, cb) => {
  const sql = `SELECT * FROM rms_room where type_id = ? and room_state = 0`
  query(sql, tid, (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}

// 修改房间信息
const updateRoom = (room, cb) => {
  const sql = 'UPDATE rms_room SET ? where id = ?'
  query(sql, [room,room.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 添加房间
const addRoom = (room, cb) => {
  const sql = 'INSERT INTO rms_room set ?'
  query(sql, room, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 删除房间
const delRoom = (room, cb) => {
  const sql = 'DELETE FROM rms_room WHERE id=?'
  query(sql, [room.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  selectRoom,
  updateRoom,
  addRoom,
  delRoom,
  selectRoomBytid
}