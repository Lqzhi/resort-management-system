
const { selectRoom, } = require('../dao/room/roomDAO')


// 查询房间
const selectRoomS = (cb) => {
  selectRoom((err, roomArr) => {
    if (err) return cb(err, null)
    return cb(null, roomArr)
  })
}

module.exports = {
  selectRoomS
}












