// 语言环境
const lang  = "chinese"
const { ENG_ERR, ERR_CODE } = require('../config/errorTypes.json')
const joi= require('joi') 
// 成功响应体信息
const successbody = (data) => {
  return {
    status: 200,
    message: 'Success',
    data
  }
}
// 失败响应体信息
const failbody = (err) => {
  let status
  let message = err.message
  switch (message) {
    case ENG_ERR.USERNAME_OR_PASSWORD_IS_REQUIRED:
      status = ERR_CODE.USERNAME_OR_PASSWORD_IS_REQUIRED 
      break
    case ENG_ERR.USERNAME_ALREADY_EXIST:
      status = USERNAME_ALREADY_EXIST 
      break
    case ENG_ERR.USERNAME_DOSE_NOT_EXIST:
      status = ERR_CODE.USERNAME_DOSE_NOT_EXIST 
      break
    case ENG_ERR.PASSORD_ERROR:
      status = ERR_CODE.PASSORD_ERROR
      break
    case ENG_ERR.UNAUTHORIZATION:
      status = ERR_CODE.UNAUTHORIZATION
      break
    case ENG_ERR.NO_PERMISION:
      status = ERR_CODE.NO_PERMISION
      break
    case ENG_ERR.QUERY_KEY_ERROR:
      status = ERR_CODE.QUERY_KEY_ERROR
      break
    case ENG_ERR.PARMS_VALUE_ERROR:
      status = ERR_CODE.PARMS_VALUE_ERROR
      break
    case ENG_ERR.QUERY_VALUE_ERROR:
      status = ERR_CODE.QUERY_VALUE_ERROR
      break
    case ENG_ERR.PATH_DOES_NOT_EXIST:
      status = ERR_CODE.PATH_DOES_NOT_EXIST
      break
    default:
      status = 500
  }
  if(err instanceof joi.ValidationError){
    status = 412
  }
  return {
    status,
    message
  }
}
module.exports = {
  successbody,
  failbody
}


