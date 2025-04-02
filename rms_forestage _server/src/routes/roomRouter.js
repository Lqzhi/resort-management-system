const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入房间服务模块
const roomService = require('../services/roomService')
// 1. 导入验证数据的中间件


// 查找房间
router.get('/find',(req, res, next) => {

  roomService.selectRoomS((err, roomArr) => {
    if (err) return next(err)
    for (let i = 0; i < roomArr.length; i++) {
      roomArr[i].picture_adress = "http://" + req.headers.host + "/uploads/" + roomArr[i].picture_adress
    }
    return res.send(successbody(roomArr))
  })
}
)
module.exports = router 
