import { createRouter, createWebHashHistory } from 'vue-router'
const login = () => import('./views/Login')
const home = () => import('./views/Home')
const welcome = () => import('./views/Welcome')
const admin = () => import('./components/admin/user/User')
const tourists = () => import('./components/tourist/user/User')
const roles = () => import('./components/roles/roles/Roles')
const rights = () => import('./components/rights/Rights')
const rooms = () => import('./components/rooms/rooms/Rooms')
const roomcates = () => import('./components/rooms/roomcates/RoomCate')

const address = () => import('./components/address/address/Address')
const addresscates = () => import('./components/address/addresscates/AddressCate')

const articles = () => import('./components/article/articles/Articles')
const articlecates = () => import('./components/article/articlecates/ArticleCate')
const orders = () => import('./components/orders/orders/Orders')
const reports = () => import('./components/reports/reports/Reports')
const personal= () => import('./components/personal/Personal')
const charts = () => import('./components/charts/Chart')

const children = [{
  path: '/welcome',
  component: welcome,
  // 存储路由自定义数据
  meta: { title: '欢迎' },
  // 独享路由守卫
  beforeEnter: (to, from, next) => {
    // ...
    next()
  }
}, {
  path: '/users',
  component: admin,
  meta: { title: '管理员用户管理' }

}, {
  path: '/tourists',
  component: tourists,
  meta: { title: '游客用户管理' }
}, {
  path: '/roles',
  component: roles,
  meta: { title: '角色管理' }
}, {
  path: '/permissions',
  component: rights,
  meta: { title: '权限管理' }
}, {
  path: '/rooms',
  component: rooms,
  meta: { title: '房间管理' }

}, {
  path: '/roomcates',
  component: roomcates,
  meta: { title: '房间分类管理' }
}, {
  path: '/address',
  component: address,
  meta: { title: '景点管理' }
},
{
  path: '/addresscates',
  component: addresscates,
  meta: { title: '景点分类管理' }
}, {
  path: '/articles',
  component: articles,
  meta: { title: '文章管理' }
}, {
  path: '/articlecates',
  component: articlecates,
  meta: { title: '文章分类管理' }
},
{
  path: '/personal',
  component: personal,
  meta: { title: '个人中心' }
},
  {
    path: '/charts',
    component: charts,
    meta: { title: '个人中心' }
  },
  {
  path: '/orders',
  component: orders,
  meta: { title: '订单管理' }
}, {
  path: '/reports',
  component: reports,
  meta: { title: '数据统计' }
}]

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    {
      path: '',
      redirect: '/login'
    },
    {
      path: '/login',
      component: login
    },
    {
      path: '/home',
      component: home,
      redirect: '/welcome',
      children
    }
  ]
})
// // 全局前置路由守卫 过滤器
// // to去哪里，from 来自哪里 next放行转向
router.beforeEach((to, from, next) => {
  // console.log('想去'+to.path)
  // console.log('来自' + from.path)
  // 若是路径/login 直接通过
  if (to.path === '/login') return next()
  // 获得登录状态
  const tokenStr = window.sessionStorage.getItem('token')
  // 登录状态为空就返回到登录页面
  if (!tokenStr) return next('/login')
  // 不为空，通过
  next()
}),

  // 全局后置路由守卫 过滤器
  // to去哪里，from 来自哪里 
  router.afterEach((to, from) => {
    // 修改顶部标题
    document.title = to.meta.title || "温泉度假村管理系统"
  })

export default router
