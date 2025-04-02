import { createRouter, createWebHashHistory } from 'vue-router'
const login = () => import('./views/Login')
const register = () => import('./views/Register')
const home = () => import('./views/Home')
const rooms = () => import('./components/rooms/Rooms')
const vrRoom = () => import('./components/rooms/vrRoom')
const address = () => import('./components/address/Address')
const articles = () => import('./components/articles/Articles')
const personal= () => import('./components/personal/Personal')
const orders= () => import('./components/orders/Orders')

const children = [
  // {
//   // 独享路由守卫
//   beforeEnter: (to, from, next) => {
//     // ...
//     next()
//   }
// }, 
{
  path: '/room',
  component: rooms,
  meta: { title: '房间管理' }

}, {
  path: '/address',
  component: address,
  meta: { title: '景点管理' }
},{
  path: '/article',
  component: articles,
  meta: { title: '文章管理' }
}, 
{
  path: '/personal',
  component: personal,
  meta: { title: '个人中心' }
},
{
  path: '/order',
  component: orders,
  meta: { title: '订单管理' }
}]

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    {
      path: '/',
      redirect: '/home'
    },
    
    {
      path: '/login',
      component: login
    },
    {
      path: '/vrroom',
      component: vrRoom
    },
    {
      path: '/register',
      component: register
    },
    {
      path: '/home',
      component: home,
      redirect: '/address',
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
  // const tokenStr = window.sessionStorage.getItem('token')
  // 登录状态为空就返回到登录页面
  // if (!tokenStr) return next('/login')
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
