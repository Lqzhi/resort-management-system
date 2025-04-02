const { query, execute } = require('../utils/database')
const { checkBcrypt } = require('../utils/encryption')

// 查询全部角色
const selectRole = (cb) => {
  const sql = 'SELECT * FROM rms_a_role'
  query(sql, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 修改角色信息
const updateRole = (role, cb) => {
  const sql = 'UPDATE rms_a_role SET ? where id = ?'
  query(sql, [role,role.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 添加角色
const addRole = (role, cb) => {
  const sql = 'INSERT INTO rms_a_role set ?'
  query(sql, role, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 删除角色
const delRole = (role, cb) => {
  const sql = 'DELETE FROM rms_a_role WHERE id=?'
  query(sql, [role.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  selectRole,
  updateRole,
  addRole,
  delRole
}