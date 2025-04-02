<template>
  <div style="margin: 0; padding: 0;">
  <el-backtop :right="100" :bottom="100" style="height: 60px;width: 60px;border-radius: 50%" />

  <el-container class="home_container" style="width: 100%;">
    <!--头部信息-->
    <el-header class="home_header" style="position: sticky; top: 0;z-index: 999;argin: 0; padding: 0;">
      <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" :ellipsis="false"
        @select="handleSelect">
        <el-menu-item index="0">
          <img src="../assets/img/logo.jpg" alt="" style="height: 50px;border-radius: 30%;" />
        </el-menu-item>
        <el-menu-item index="1" @click="toAddress()">景点风光</el-menu-item>

        <el-menu-item index="2" @click="toRoom()">预定房间</el-menu-item>
        <el-menu-item index="3" @click="toArticle">景区文章</el-menu-item>
        <div class="flex-grow" />

        <el-sub-menu index="4" v-if=isLogin>
          <template #title>个人中心</template>
          <el-menu-item index="4-1" @click="toPersonal()">我的信息</el-menu-item>
          <el-menu-item index="4-2" @click="toOrder()">我的订单</el-menu-item>
          <el-menu-item index="4-3" @click="backClick()">退出登录</el-menu-item>
        </el-sub-menu>
        <el-menu-item index="5" @click="toLogin" v-else>登录</el-menu-item>
      </el-menu>
    </el-header>

    <el-main style="max-width: 2000px; margin: 0 auto; min-width:1000px;width: 100vw;padding: 0; ">
      <router-view />
    </el-main>
  </el-container>
</div>
</template>



<script>




import menus from '@/utils/meus.json'
import Address from '../components/address/Address.vue'
import Room from '../components/rooms/Rooms.vue'
import Article from '../components/articles/Articles.vue'

export default {
  components: {

    Address,
    Room,
    Article
  },
  name: 'Home',
  data() {
    return {
      isCollapse: false,
      isLogin: ''
    }
  },
  mounted(){
    this.isLogin = window.sessionStorage.getItem('token')
  },
updated(){

},
  methods: {
    // 景点风光
    toAddress() {

      this.$router.push('/address')
    },
    // 景区文章
    toArticle() {

      this.$router.push('/article')
    },
    // 我的信息
    toPersonal() {

      this.$router.push('/personal')
    },

    // 我的订单
    toOrder() {

      this.$router.push('/order')
    },
    // 预定房间
    toRoom() {

      this.$router.push('/room')
    },
    toLogin() {
      this.$router.push('/login')
    },

    // 退出登录
    backClick() {
      window.sessionStorage.clear()
      // this.$router.push('/login')//历史记录追加
      this.isLogin = ''
      this.$message.success('已经退出登录！')
      this.$router.replace('/') //历史记录替换
    },

  }


}
</script>

<style scoped>
/* 导航栏啊 */

.flex-grow {
  flex-grow: 1;
}
</style>
