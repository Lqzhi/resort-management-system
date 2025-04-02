const { query} = require('../utils/database')

// 查询全部权限
const selectPermission= (cb) => {
  const sql = 'SELECT * FROM rms_a_permission'
  query(sql, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 查询角色对应的权限
const selectPermissionByRID = (rid,cb) => {
  const sql = "SELECT * FROM rms_a_permission WHERE permission_pid IN (SELECT permission_id FROM rms_role_permission WHERE role_id = "+rid+") or id IN (SELECT permission_id FROM rms_role_permission WHERE role_id = "+rid+")"
  query(sql,(err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    return cb(null, results)
  })
}

// // 根据id找父权限
// const selectPermissionF = (pid,cb) => {
//   const sql = 'SELECT * FROM rms_a_permission WHERE  permission_pid = ?'
//   query(sql,fid, (err, results, fields) => {
//     if (err) {
//       return cb(err, null)
//     }
//     return cb(null, results)
//   })
// }

// 根据父id找子权限
const selectPermissionByFID = (fid,cb) => {
  const sql = 'SELECT * FROM rms_a_permission WHERE  permission_pid = ?'
  query(sql,fid, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    return cb(null, results)
  })
}

const selectAllPermission = (cb) => {
  const sql = 'SELECT * FROM rms_a_permission WHERE permission_pid IN (SELECT permission_id FROM rms_role_permission) or id IN (SELECT permission_id FROM rms_role_permission)'
  query(sql, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    return cb(results)
  })
}

module.exports = {
  selectPermission,
  selectPermissionByRID,
  selectPermissionByFID,
  selectAllPermission
  // selectPermissionF
}