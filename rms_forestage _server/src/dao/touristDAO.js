const { query, execute } = require('../utils/database')
const { checkBcrypt } = require('../utils/encryption')

// 查询全部游客用户
// const selectTouristAll = (querys, cb) => {
//   const sql = `SELECT * FROM rms_tourist LIMIT ?,?`
//   query(sql, [querys.pagenum - 1, querys.pagesize], (err, results, fields) => {
//     if (err) return cb(err, null)
//     cb(null, results)

//   })
// }
// 通过id查
const selectTourist = (id, cb) => {
  console.log(id);
  const sql = `SELECT * FROM rms_tourist WHERE id = ?`
  query(sql, id, (err, results, fields) => {
    if (err) return cb(err, null)
    cb(null, results)
  })
}
// 修改游客信息
const updateTourist = (tourist, cb) => {
  const sql = 'UPDATE rms_tourist SET ? WHERE id = ?'
  query(sql, [tourist, tourist.id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 添加游客
const addTourist = (tourist, cb) => {
  // const sql = 'INSERT INTO rms_tourist( number,tourist_pwd,tourist_name,tourist_nickname,role_id) values (?,?,?,?,?)'
  const sql = 'INSERT INTO rms_tourist set ?'
  query(sql, tourist, (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

// 根据账号查找游客
const findTourist = (number, cb) => {
  console.log(number);
  const sql = 'SELECT * FROM rms_tourist WHERE number = ? '
  query(sql, [number], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}

const updatePWD = (id, newpwd, cb) => {
  const sql = 'UPDATE rms_tourist SET password = ? WHERE id = ?'
  query(sql, [newpwd, id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
const delTourist = (id, cb) => {
  const sql = 'DELETE FROM rms_tourist WHERE id = ?'
  query(sql, [id], (err, results, fields) => {
    if (err) {
      return cb(err, null)
    }
    cb(null, results)
  })
}
// 抛出模块
module.exports = {
  // selectTouristAll,
  // selectTouristBy,
  selectTourist,
  updateTourist,
  addTourist,
  findTourist,
  updatePWD,
  delTourist
}