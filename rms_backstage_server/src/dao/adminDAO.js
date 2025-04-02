const { query, execute } = require('../utils/database')
const { checkBcrypt } = require('../utils/encryption')

// 查询全部管理员用户
// const selectAdminAll = (querys, cb) => {
//   const sql = `SELECT * FROM rms_admin LIMIT ?,?`
//   query(sql, [querys.pagenum - 1, querys.pagesize], (err, results, fields) => {
//     if (err) return cb(err, null)
//     cb(null, results)
//   })
// }
// 通过账号模糊查询数管理员用户
const selectAdmin = (querys, cb) => {
  const sql = `SELECT a.*,role_name  FROM rms_admin as a LEFT JOIN rms_a_role as r ON  a.role_id= r.id WHERE account_number LIKE ? LIMIT ?,? `
  query(sql, ["%" + (querys.query || '') + "%", (querys.pagenum - 1)*querys.pagesize, querys.pagesize], (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}
// 修改管理员信息
const updateAdmin = (admin, cb) => {
  const sql = 'UPDATE rms_admin SET ? WHERE id = ?'
  query(sql, [admin, admin.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 添加管理员
const addAdmin = (admin, cb) => {
  // const sql = 'INSERT INTO rms_admin( account_number,admin_pwd,admin_name,admin_nickname,role_id) values (?,?,?,?,?)'
  const sql = 'INSERT INTO rms_admin set ?'
  query(sql, admin, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 根据账号查找管理员
const findAdmin = (account_number, cb) => {
  const sql = 'SELECT * FROM rms_admin WHERE account_number = ? '
  query(sql, [account_number], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

const updatePWD = (id, newpwd, cb) => {
  const sql = 'UPDATE rms_admin SET admin_pwd = ? WHERE id = ?'
  query(sql, [newpwd, id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
const delAdmin = (id, cb) => {
  const sql = 'DELETE FROM rms_admin WHERE id = ?'
  query(sql, [id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  // selectAdminAll,
  // selectAdminBy,
  selectAdmin,
  updateAdmin,
  addAdmin,
  findAdmin,
  updatePWD,
  delAdmin
}