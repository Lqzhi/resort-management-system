import { createApp } from 'vue'
import App from './App.vue'
import router from './router'



import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import locale from "element-plus/lib/locale/lang/zh-cn"

import axios from './network/axios'

import 'quill/dist/quill.core.css' // import styles
import 'quill/dist/quill.snow.css' // for snow theme
import 'quill/dist/quill.bubble.css' // for bubble theme
import '@/assets/css/global.css'//导入自己写的全局样式

import mitt from "mitt"



import 'xe-utils'
import VXETable from 'vxe-table'
import 'vxe-table/lib/style.css'

const app = createApp(App)
app.config.warnHandler = () => null;
app.config.globalProperties.$http = axios
app.config.globalProperties.$bus = mitt();

app.use(VXETable)
app.use(router)
app.use(ElementPlus, {locale})

app.mount('#app')