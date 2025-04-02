
const { selectOrder, addOrder, updateOrder,selectOrderByTid,updateOrderState} = require('../dao/order/orderDAO')
const { selectOrderDetail, updateOrderDetail, addOrderDetail } = require('../dao/order/orderDetailDAO')
const { selectTourist, findTourist, addTourist, updatePWD, updateTourist, delTourist } = require('../dao/touristDAO')
const { selectRoomp } = require('../dao/room/roomDAO')
// 查询
const selectOrderS = (cb) => {
  selectOrder((err, orderArr) => {
    if (err) return cb(err, null)
    return cb(null, orderArr)
  })
}

const selectOrderByTidS = (id,cb)=>{
  selectOrderByTid(id,(err, orderArr) => {
    if (err) return cb(err, null)
    return cb(null, orderArr)
  })
}
const updateOrderStateS = (no,cb)=>{
  updateOrderState(no,(err, res) => {
    if (err) return cb(err, null)
    return cb(null, "成功")
  })
}
// 添加
const addOrderS = (orderMes, usertoken, cb) => {
  // 处理订单业务
  // 1获取游客信息
  findTourist(usertoken.number, (err, touristArr) => {
    if (err) return cb(err, null)
    const tourist = touristArr[0]
    if (!tourist) return cb(new Error("用户不存在"), null)
    if (tourist.state == 1) return cb(new Error("该用户已经被封禁"))
    // 订单编号生成时间戳加用户id
    const imestamp = Date.now();
    const order = { order_no: imestamp + tourist.id, tourist_id: tourist.id }
    addOrder(order, (err, orderResultSetHeader) => {
      if (err) return cb(err, null)
      // 获取房间类型价钱等信息
      selectRoomp(orderMes.id, (err, roomp) => {
        if (err) return cb(err, null)
        // 时间戳转换
        mysqltimestamp = new Date(new Date(orderMes.occupation_time).toLocaleDateString())

        // 添加详情数据
        const orderDetal = {
          order_id: orderResultSetHeader.insertId,
          occupation_time: mysqltimestamp,
          room_price: roomp[0].room_price,
          ID_card_passport: tourist.ID_card_passport,
          linkman: tourist.full_name,
          linkphone: tourist.telephone
        }
        addOrderDetail(orderDetal, (err, res) => {
          if (err) return cb(err, null)
          if (!res) return cb("预订失败", null)
          cb(null, "预订成功")
        })
      })
    })


  })

  console.log(usertoken.number);








  // addOrder(order, (err, results) => {
  //   if (err) return cb(err, null)
  //   if (!results) return cb(new Error("添加失败"), null)
  //   cb(null, "添加成功")
  // })
}







// 更新信息
const updateOrderS = (order, cb) => {
  updateOrder(order, (err, results) => {
    if (err) return cb(err, null)
    if (results.affectedRows !== 1) return cb(new Error("更新失败"), null)
    cb(null, "更新成功")
  })
}


//查询详情
const selectOrderDetailS = (selectQuery, cb) => {
  selectOrderDetail(selectQuery, (err, orderArr) => {
    if (err) return cb(err, null)
    return cb(null, orderArr)
  })
}
// 更新详情信息
const updateOrderDetailS = (order, cb) => {
  // 根据账号查询是否存在该详情
  updateOrderDetail(order, (err, results) => {
    if (err) return cb(err, null)
    if (results.affectedRows !== 1) return cb(new Error("更新失败"), null)
    cb(null, "更新成功")
  })
}
module.exports = {
  selectOrderS,
  addOrderS,
  updateOrderS,
  selectOrderDetailS,
  updateOrderDetailS,
  selectOrderByTidS,
  updateOrderStateS
}












