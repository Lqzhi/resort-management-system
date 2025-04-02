<template>
  <div>
    <!--  面包屑导航区-->
    <breadcrumb>
      <template v-slot:one>
        <span>文章管理</span>
      </template>
      <template v-slot:two>
        <span>文章列表</span>
      </template>
    </breadcrumb>
    <!--  Main-->
    <el-card>
      <articles_addarticleInput
        @getarticlesMes="getarticlesMes"
        :articlesMes="articlesMes"
        @isShow="dialogVisible"
      />
      <articles_table
        :articles="articles"
        :total="total"
        :articlesMes="articlesMes"
        @handleSizeChange="handleSizeChange"
        @handleCurrentChange="handleCurrentChange"
        @change="change"
        @reGet="reGet"
        @editarticleMes="editarticleMes"
        @updateMes="getarticlesMes"
      />
    </el-card>
    <articles_addDialog :isShow="isShow" @isFalse="isFalse" @commit="commit" />
  </div>
</template>

<script>
import breadcrumb from '@/components/common/breadcrumb'
import articles_table from './childComponents/articles_table'
import articles_addDialog from './childComponents/articles_addDialog'
import articles_addarticleInput from './childComponents/articles_addarticleInput.vue'

export default {
  name: 'article',
  components: {
    breadcrumb,
    articles_table,
    articles_addDialog,
    articles_addarticleInput,
  },
  data() {
    return {
      articlesMes: {
        query: '',
        pagenum: 1,
        pagesize: 5,
      },
      articles: [],
      total: null,
      isShow: false,
    }
  },
  created() {
    this.getarticlesMes()
  },
  methods: {
    //获取最新的数据
    async getarticlesMes() {
      const { data } = await this.$http.get('article/find', {
        params:this.articlesMes,
      })
      if (data.status !== 200)
        return this.$message.error(data.message||'获取文章列表失败！') ;
      console.log(data.data);
      this.articles = data.data
      this.total = 100
    },
    //分类项一页显示多少数据///
    handleSizeChange(newSize) {
      this.articlesMes.pagesize = newSize
      this.getarticlesMes()
    },
    //分类项当前有多少页数据///
    handleCurrentChange(newPage) {
      this.articlesMes.pagenum = newPage
      this.getarticlesMes()
    },

    //状态改变事件
    async change(articleInfo) {
      console.log(articleInfo.article_state);
      const {data} = await this.$http.put(
        `article/updatestate`,{id:articleInfo.id,article_state:articleInfo.article_state}
      )
      if (data.status !== 200) {
        //更新失败后要保证状态未被改变
        articleInfo.article_state = !articleInfo.article_state
        return this.$message.error(data.message||'更新文章状态失败！')
       
      }
      this.$message.success('更新文章状态成功！')
    },
    //dialog是否显示
    dialogVisible() {
      this.isShow = true
    },
    isFalse() {
      this.isShow = false
    },
    //添加文章事件
    async commit(mes) {
      const {data} = await this.$http.post('article/add', mes)
      if (data.status !== 200) return this.$message.error(data.message||'添加文章失败！')
      this.$message.success('添加文章成功！')
      this.isShow = false
      await this.getarticlesMes()
    },
    //移除文章事件
    async reGet(articleInfo, index) {


      const { data } = await this.$http.delete(
        'article/del',{data:{id :articleInfo[index].id}}
      )
      console.log(data);
      if (data.status !== 200) return this.$message.error('删除文章失败！')
      this.$message.success('删除文章成功！')
      this.articles.splice(index, 1)
      await this.getarticlesMes()
    },
    async editarticleMes(articleMes) {
      console.log(articleMes);
      const { data } = await this.$http.put(`article/update`,articleMes)
      console.log(data);
      if (data.status !== 200) return this.$message.error(data.message||'编辑文章信息失败！')
      this.$message.success('编辑文章信息成功！')
      await this.getarticlesMes()
    },
  },
}
</script>
