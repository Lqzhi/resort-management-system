<template>
  <el-container class="home_container">
    <!--头部信息-->
    <el-header class="home_header">
      <div class="home_header_left">
        <img src="../assets/img/logo.jpg" alt="" style="height: 50px;border-radius: 30%;" />
        <span style="margin-left: 10px">温泉度假村管理系统</span>
      </div>
      <el-button round @click="backClick" type="danger" class="backBtn"
        >退出</el-button
      >
    </el-header>
    <el-container>
      <!--侧边栏信息-->
      <el-aside class="home_left" :width="isCollapse ? '64px' : '200px'">
        <div class="toggle-button" @click="toggleClick">|||</div>
        <el-menu
          :unique-opened="true"
          background-color="#333744"
          text-color="#fff"
          active-text-color="#409EFF"
          :collapse="isCollapse"
          :collapse-transition="false"
          style="border-right: 1px"
          router
          :default-active="currentPath"
        >
          <!--一级菜单-->
          <el-sub-menu
            :index="item.id + ''"
            v-for="(item, index) in leftMenus"
            :key="item.id"
          >
            <!--一级菜单模板区域-->
            <template v-slot:title>
              <!--一级菜单图标-->


              <el-icon>
                    <component :is="iconGroup[item.id]"/>
              </el-icon>
              <!-- <component
                  :is="iconGroup[index]">
              </component> -->
              <!--一级菜单文本-->
              <span>{{ item.permission_name }}</span>
            </template>
            <!--二级菜单-->
            <el-menu-item
              :index="'/' + item1.browser_route"
              v-for="item1 in item.children"
              :key="item1.id"
            >
              <template v-slot:title>
                <!--一级菜单图标-->
                <el-icon><el-icon-menu /></el-icon>
                <!--一级菜单文本-->
                <span>{{ item1.permission_name }}</span>
              </template>
            </el-menu-item>
          </el-sub-menu>
        </el-menu>
      </el-aside>
      <el-main class="home_right">
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import { Menu as ElIconMenu ,
  UserFilled,
  User,
  Avatar,
  Lock,
  Shop,
  Location,
  Postcard,
  List,
  Goods,
  DataLine,
} from '@element-plus/icons'


export default {
  components: {
    ElIconMenu,
  },
  name: 'Home',
  data() {
    return {
      // leftMenus:menus.data,
      leftMenus:[],
      iconGroup: {
        1: UserFilled,
        2: User,
        3: Avatar,
        4: Lock,
        5: Shop,
        6: Location,
        7:Postcard,
        8: List,
        9: DataLine,
        10: User ,
      },
      isCollapse: false,
      currentPath: '',
    }
  },
  created() {
    this.getLeftMes()
  },
  updated() {
    // this.currentPath = this.$route.path
  },
  methods: {
    backClick() {
      window.sessionStorage.clear()
      // this.$router.push('/login')//历史记录追加
      this.$router.replace('/login') //历史记录替换
    },
    async getLeftMes() {
      const { data } = await this.$http.get('/menu')
      if (data.status !== 200) return this.$message.error(data.message)
      this.leftMenus = data.data
      console.log(data.data);
    },
    toggleClick() {
      this.isCollapse = !this.isCollapse
    },
  },
}
</script>

<style scoped>
.home_container {
  height: 100%;
}
.home_header {
  padding-left: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: #373d41;
}
.home_header_left {
  display: flex;
  align-items: center;
  color: white;
  font-size: 25px;
}
.home_left {
  background-color: #333744;
  border-right: none;
}
.home_right {
  background-color: #eaedf1;
}
.toggle-button {
  font-size: 12px;
  color: white;
  text-align: center;
  background-color: #4a5064;
  line-height: 24px;
  letter-spacing: 0.2em;
}
</style>
