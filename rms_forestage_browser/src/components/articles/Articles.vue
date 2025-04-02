<!-- 景区文章页面 -->
<template>
  <div style="background-color:#fff">
    <div>
      <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" :ellipsis="false"
        @select="handleSelect">
        <el-menu-item index="0" @click="getArticleMes(1)">
          全部文章
        </el-menu-item>
        <template v-for="(item,index) in ArticlCateIds" :key = item.id  >
        <el-menu-item :index = index @click="getArticleMes(item.id)">{{ item.name }}</el-menu-item>
        <div class="flex-grow" />
      </template>
      </el-menu>
      
    </div>
    <div>
      <el-row :gutter="20" v-for="item in ArticleMes" :key="index">
        <el-col :span="23" style="background-color:#fff;margin-left: 10px; margin-top: 10px;" justify="center">
          <div class="grid-content ep-bg-purple">
            <h1 class="title" style="font-size: 200%;">
              {{ item.title }}
            </h1>
            <h2>{{dateFormat("YY-mm-dd",item.pub_date)}}</h2>
            <p tyle="text-indent:2em;" class="content">
              {{ item.content }}
            </p>
          </div>
        </el-col>
        <hr />
      </el-row>
    </div>
  </div>
</template>

<style>
.el-row {
  margin-bottom: 20px;
}

.el-row:last-child {
  margin-bottom: 0;
}

.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
</style>


<script>

import { dateFormat } from '@/common/dateFormat'
export default {
  name: '',
  data() {
    return {
      ArticleMes: '',
      ArticlCateIds:''
    };
  },

  components: {},

  computed: {},

  mounted() {
    this.getArticleMes()
    this.getArticlCateIdsMes()

  },

  methods: {
    dateFormat,
    async getArticleMes(ArticlCateId) {
      const { data } = await this.$http.get('article/find',{params:{cid:ArticlCateId}})
      if (data.status !== 200) return this.$message.error(data.message)
      this.ArticleMes = data.data
      console.log(data.data);
    },
    async getArticlCateIdsMes() {
      const { data } = await this.$http.get('article/cate',{params:{cid:1}})
      if (data.status !== 200) return this.$message.error(data.message)
      this.ArticlCateIds = data.data
      console.log(data.data);
    },
  }
}

</script>
<style  scoped></style>