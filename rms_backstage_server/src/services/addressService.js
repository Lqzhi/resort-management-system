// 导入生成 Token 的包
const jwt = require('jsonwebtoken')
// 加载address模型
const { jwt_config } = require("../config/default.json")
const { checkBcrypt, bcryptHandle } = require("../utils/encryption")
// const {}
const { selectAddress, delAddress, addAddress ,updateAddress} = require('../dao/address/addressDAO')
const{selectAddressCate, delAddressCate, addAddressCate ,updateAddressCate} = require('../dao/address/addressCateDAO')
const { log } = require('grunt')

// 查询地点
const selectAddressS = (selectQuery,cb) => {
    selectAddress(selectQuery,(err, addressArr) => {
      if (err) return cb(err, null)
      return cb(null, addressArr)
    })
}
// 添加地点
const addAddressS = (address, cb) => {
 

    addAddress(address, (err, results) => {
      if (err) return cb(err, null)
      console.log(results);
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
}
// 更新地点信息
  const updateAddressS  = (address,cb) => {
    // 根据账号查询是否存在该地点
    updateAddress(address, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
}
//删除地点（修改删除状态）
// const delAddressS = (address,cb) => {
// 	updateAddress({is_delete:1,...address}, (err,results ) => {
// 		if (err) return cb(err, null)
// 		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
// 		cb(null, "删除成功")
// 	})
// }
//删除地点
const delAddressS = (address,cb) => {
  console.log(11);
	delAddress(address, (err,results ) => {
		if (err) return cb(err, null)
		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
		cb(null, "删除成功")
	})
}

//查询地点分类
const selectAddressCateS = (selectQuery,cb) => {
    selectAddressCate(selectQuery,(err, addressArr) => {
      if (err) return cb(err, null)
      return cb(null, addressArr)
    })
}
// 添加地点分类
const addAddressCateS = (address, cb) => {
 

    addAddressCate(address, (err, results) => {
      if (err) return cb(err, null)
      console.log(results);
      if (!results) return cb(new Error("添加失败"), null)
      cb(null, "添加成功")
    })
}
// 更新地点分类信息
  const updateAddressCateS  = (address,cb) => {
    // 根据账号查询是否存在该地点分类
    updateAddressCate(address, (err,results ) => {
      if (err) return cb(err, null)
      if(results.affectedRows !== 1) return cb(new Error("更新失败"), null)
      cb(null, "更新成功")
    })
}
// 删除
const delAddressCateS = (address,cb) => {
	delAddressCate(address, (err,results ) => {
		if (err) return cb(err, null)
		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
		cb(null, "删除成功")
	})
}

// //删除地点分类（修改删除状态）
// const delAddressCateS = (address,cb) => {
// 	updateAddressCate({is_delete:1,...address}, (err,results ) => {
// 		if (err) return cb(err, null)
// 		if(results.affectedRows !== 1) return cb(new Error("删除失败"), null)
// 		cb(null, "删除成功")
// 	})
// }
module.exports = {
	selectAddressS,
	addAddressS,
	updateAddressS,
	delAddressS,
  selectAddressCateS,
  addAddressCateS,
  updateAddressCateS,
  delAddressCateS
}












