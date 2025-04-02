const express = require('express')
const router = express.Router()
const { successbody } = require('../utils/respBody')
// 导入房间服务层模块
const roomService = require('../services/roomService')
// 1. 导入验证数据的中间件
const expressJoi = require('@escook/express-joi')
// 2. 导入需要的验证规则对象
const {del_schema,update_schema,add_schema,select_schema} = require('../models/roomModel')
const { del_type_schema,update_type_schema,add_type_schema} = require('../models/roomTypeModel')
const {selectRoomBytid} =  require('../dao/room/roomDAO')


// 查找房间
router.get('/find',expressJoi(select_schema),(req, res, next) => {
  console.log('ddd');
  roomService.selectRoomS(req.query,(err, roomArr) => {
    if (err) return next(err)
    return res.send(successbody(roomArr))
  })
}
)


router.get('/findbytid',(req, res, next) => {
  
  console.log(req.query);
  selectRoomBytid(req.query,(err, roomArr) => {
    if (err) return next(err)
    return res.send(successbody(roomArr))
  })
}
)



//添加房间
router.post('/add', expressJoi(add_schema), (req, res, next) => {
  console.log(req.body)
  roomService.addRoomS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改房间
router.put('/update', expressJoi(update_schema), (req, res, next) => {
  console.log(req.body)
  roomService.updateRoomS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除房间
router.delete('/del', expressJoi(del_schema), (req, res, next) => {
  roomService.delRoomS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 查找房间类型
router.get('/type',(req, res, next) => {
  roomService.selectRoomTypeS((err, roomArr) => {
    if (err) return next(err)
    return res.send(successbody(roomArr))
  })
}
)
//添加房间类型
router.post('/type',(r,s,n)=>{console.log(r.body),n()},expressJoi(add_type_schema),(req, res, next) => {
  console.log(req.body)
  roomService.addRoomTypeS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}

)
// 修改房间类型
router.put('/type', expressJoi(update_type_schema), (req, res, next) => {
  console.log(req.body)
  roomService.updateRoomTypeS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

// 删除房间类型
router.delete('/type', expressJoi(del_type_schema), (req, res, next) => {
  console.log(req.body);
  roomService.delRoomTypeS(req.body, (err, result) => {
    if (err) return next(err)
    return res.send(successbody(result))
  })
}
)

module.exports = router 
