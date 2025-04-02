// 导入生成 Token 的包
const jwt = require('jsonwebtoken')
// 加载order模型
const { jwt_config } = require("../config/default.json")
const { checkBcrypt, bcryptHandle } = require("../utils/encryption")
// const {}
const { selectOrder, delOrder, addOrder ,updateOrder} = require('../dao/order/orderDAO')
const{selectOrderDetail, delOrderDetail, addOrderDetail ,updateOrderDetail} = require('../dao/order/orderDetailDAO')

// 查询
const selectOrderS = (selectQuery,cb) => {
    selectOrder(selectQuery,(err, orderArr) => {
      if (err) return cb(err, null)
      return cb(null, orderArr)
    })
}
// 添加
const addOrderS = (order, cb) => {
 

    addOrder(order, (err, results) => {
      if (err) return cb(err, null)
      console.log(results);
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
}
// 更新信息
  const updateOrderS  = (order,cb) => {
    // 根据账号查询是否存在该
    updateOrder(order, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
}
//删除（修改删除状态）
const delOrderS = (order,cb) => {
	updateOrder({is_delete:1,...order}, (err,results ) => {
		if (err) return cb(err, null)
		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
		cb(null, "删除成功")
	})
}
//删除
// const delOrderS = (order,cb) => {
// 	delOrder(order, (err,results ) => {
// 		if (err) return cb(err, null)
// 		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
// 		cb(null, "删除成功")
// 	})
// }

//查询详情
const selectOrderDetailS = (selectQuery,cb) => {
    selectOrderDetail(selectQuery,(err, orderArr) => {
      if (err) return cb(err, null)
      return cb(null, orderArr)
    })
}
// 添加详情
const addOrderDetailS = (order, cb) => {
 

    addOrderDetail(order, (err, results) => {
      if (err) return cb(err, null)
      console.log(results);
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
}
// 更新详情信息
  const updateOrderDetailS  = (order,cb) => {
    // 根据账号查询是否存在该详情
    updateOrderDetail(order, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
}
//删除详情（修改删除状态）
const delOrderDetailS = (order,cb) => {
	updateOrderDetail({is_delete:1,...order}, (err,results ) => {
		if (err) return cb(err, null)
		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
		cb(null, "删除成功")
	})
}
module.exports = {
	selectOrderS,
	addOrderS,
	updateOrderS,
	delOrderS,
  selectOrderDetailS,
  addOrderDetailS,
  updateOrderDetailS,
  delOrderDetailS
}












