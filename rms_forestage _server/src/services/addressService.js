
const { selectAddress} = require('../dao/address/addressDAO')

// 查询地点
const selectAddressS = (cb) => {
    selectAddress((err, addressArr) => {
      if (err) return cb(err, null)
      return cb(null, addressArr)
    })
}
module.exports = {
	selectAddressS
}












