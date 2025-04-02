import axios from 'axios'//引入axios
//顶部进度条
import Nprogress from 'nprogress'
import 'nprogress/nprogress.css'
// axios.defaults.baseURL = 'http://127.0.0.1:3001/api/private/v1/'

axios.defaults.baseURL = 'http://127.0.0.1:5003'
axios.defaults.timeout = 5000

// axios.defaults.baseURL = 'http://192.168.233.1:5003'

axios.interceptors.request.use(config => {
  config.headers.Authorization = window.sessionStorage.getItem('token')
  //在request拦截器中展示进度条
  Nprogress.start()
  return config
},err=>{
  
}

)
axios.interceptors.response.use(config => {
  //在response拦截器中隐藏进度条
  Nprogress.done()
  return config
})
export default axios
