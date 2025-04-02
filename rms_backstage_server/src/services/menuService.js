
const { selectPermissionByRID, selectPermissionByFID, selectAllPermission } = require('../dao/permissionDAO')
const {listTransTree} = require('../utils/index')
const getMenus = (rid, cb) => {
  selectPermissionByRID(rid,(err, permissions) => {
    if(err) return cb(err,null)



     cb(null, listTransTree(permissions, 'permission_pid'))
     })}

    module.exports = {
      getMenus
    }