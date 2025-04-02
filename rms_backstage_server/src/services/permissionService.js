
const { selectPermission} = require('../dao/permissionDAO')


// 查询权限
const selectPermissionS = (cb) => {
  selectPermission((err, PermissioArr) => {
      if (err) return cb(err, null)
      return cb(null, PermissioArr)
    })
}
module.exports = {
	selectPermissionS,
	
}












