// 数据库连接池模块
const mysql2 = require('mysql2')

// 加载配置文件
const {pool_config} = require('../config/default');
// 创建连接池
const pool = mysql2.createPool({
  ...pool_config,
})
// 查询中间件
const query = function (sql,arr,callback) {
  pool.getConnection(function (err, conn) {
    if (err) {
      return callback(err, null, null);
    } else {
      conn.query(sql,arr, function (qerr, vals, fields) {
        //释放连接
        conn.release();
        //事件驱动回调
        callback(qerr, vals, fields);
      });
    }
  });
};
// 增删改中间件
const execute = function (sql,arr,callback) {
  pool.getConnection(function (err, conn) {
    if (err) {
      callback(err, null, null);
    } else {
      conn.execute(sql,arr,function (qerr, vals, fields) {
        //释放连接
        conn.release();
        //事件驱动回调
        return callback(qerr, vals, fields);
      });
    }
  });
};
 
module.exports = {
  query,
  execute
} 
