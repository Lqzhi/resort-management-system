// 导入生成 Token 的包
const jwt = require('jsonwebtoken')
// 加载room模型
const { jwt_config } = require("../config/default.json")
const { checkBcrypt, bcryptHandle } = require("../utils/encryption")
// const {}
const { selectRoom, delRoom, addRoom ,updateRoom} = require('../dao/room/roomDAO')
const{selectRoomType, delRoomType, addRoomType ,updateRoomType} = require('../dao/room/roomTypeDAO')

// 查询房间
const selectRoomS = (selectQuery,cb) => {
    selectRoom(selectQuery,(err, roomArr) => {
      if (err) return cb(err, null)
      return cb(null, roomArr)
    })
}
// 添加房间
const addRoomS = (room, cb) => {
 

    addRoom(room, (err, results) => {
      if (err) return cb(err, null)
      console.log(results);
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
}
// 更新房间信息
  const updateRoomS  = (room,cb) => {
    // 根据账号查询是否存在该房间
    updateRoom(room, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
}
// //删除房间（修改删除状态）
// const delRoomS = (room,cb) => {
// 	updateRoom({is_delete:1,...room}, (err,results ) => {
// 		if (err) return cb(err, null)
// 		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
// 		cb(null, "删除成功")
// 	})
// }
//删除房间
const delRoomS = (room,cb) => {
	delRoom(room, (err,results ) => {
		if (err) return cb(err, null)
		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
		cb(null, "删除成功")
	})
}

//查询房间类型
const selectRoomTypeS = (selectQuery,cb) => {
    selectRoomType(selectQuery,(err, roomArr) => {
      if (err) return cb(err, null)
      return cb(null, roomArr)
    })
}
// 添加房间类型
const addRoomTypeS = (room, cb) => {
 

    addRoomType(room, (err, results) => {
      if (err) return cb(err, null)
      console.log(results);
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
}
// 更新房间类型信息
  const updateRoomTypeS  = (room,cb) => {
    // 根据账号查询是否存在该房间类型
    updateRoomType(room, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
}
//删除房间
const delRoomTypeS = (room,cb) => {
	delRoomType(room, (err,results ) => {
		if (err) return cb(err, null)
		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
		cb(null, "删除成功")
	})
}
module.exports = {
	selectRoomS,
	addRoomS,
	updateRoomS,
	delRoomS,
  selectRoomTypeS,
  addRoomTypeS,
  updateRoomTypeS,
  delRoomTypeS
}












