<template>
  <div>
    <!--    表格区域-->
    <el-table class="table" :data="articles" style="width: 100%" stripe border>
      <el-table-column type="index" label="#" width="50"></el-table-column>
      <el-table-column prop="title" label="文章标题"></el-table-column>
      <el-table-column prop="name" label="所属分类"></el-table-column>
      <el-table-column prop="pub_date" label="发布时间">
        <template v-slot="scope">{{ dateFormat("YYYY-mm-dd HH:MM", scope.row.pub_date) }}</template>
      </el-table-column>
      <el-table-column prop="state" label="状态">
        <template v-slot="scope">{{ scope.row.state == 1 ? '已保存':'已发布' }}</template>
      </el-table-column>
      <el-table-column label="操作" width="200">
        <template v-slot="scope">
          <el-tooltip effect="dark" content="编辑信息" placement="top" :enterable="false">
            <el-button :icon="ElIconEdit" type="primary" size="mini" @click="editMes(scope.$index)"></el-button>
          </el-tooltip>
          <el-tooltip effect="dark" content="" placement="top" :enterable="false">
            <el-button :icon="ElIconDelete" type="danger" size="mini" @click="deleted(scope.$index)"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
    <!--      分页区域-->
    <el-pagination class="el-pagination" @size-change="handleSizeChange" @current-change="handleCurrentChange"
      :current-page="articlesMes.pagenum" :page-sizes="[1, 2, 5, 10]" :page-size="articlesMes.pagesize"
      layout="total, sizes, prev, pager, next, jumper" :total="total">
    </el-pagination>
    <articles_editDialog :isShow="isShow" @isFalse="isFalse" :articleMes="onlyarticle" @editarticleMes="editarticleMes" />
  </div>
</template>

<script>
import {
  Edit as ElIconEdit,
  Delete as ElIconDelete,
  Setting as ElIconSetting,
} from '@element-plus/icons'
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
import articles_editDialog from './articles_table_editDialog'
import { pagination } from '@/common/mixin'
import { dateFormat } from '@/common/dateFormat'

export default {
  data() {
    return {
      isShow: false,
      isDelete: false,
      showcate: false,
      onlyarticle: {},
      twoName: {},
      catesList: [],
      ElIconEdit,
      ElIconDelete,
      ElIconSetting,
      dateFormat,
    }
  },
  name: 'articles_table',
  components: {
    articles_editDialog,
  },
  mixins: [pagination],
  props: {
    articles: {
      type: Array,
      default() {
        return []
      },
    },
    total: {
      type: Number,
      default: 0,
    },
    articlesMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {

    change(articleInfo) {
      $emit(this, 'change', articleInfo)
    },
    async deleted(index) {
      const confirm = await this.$confirm(
        '此操作将永久删除该文章, 是否继续?',
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
        }
      ).catch((err) => err)
      if (confirm !== 'confirm') return this.$message.info('已取消删除')
      console.log(this.articles);
      $emit(this, 'reGet', this.articles, index)
    },
    editMes(index) {
      const { id,
        article_no,
        article_floor,
        hotel,
        type_id,
        introduction } = this.articles[index]
      this.onlyarticle = {
        id,
        article_no,
        article_floor,
        hotel,
        type_id,
        introduction,
      }
      this.isShow = true
    },
    isFalse() {
      this.isShow = false
    },
    isFalses() {
      this.showcate = false
    },
    editarticleMes(articlesMes) {
      $emit(this, 'editarticleMes', articlesMes)
      setTimeout(() => {
        this.isFalse()
      }, 300)
    },
    async addcates(mes) {
      this.twoName = mes
      const { data } = await this.$http.get('cate/find')
      console.log(data);
      if (data.status !== 200)
        return this.$message.error('获取文章分类列表失败！')
      this.catesList = data.data
      this.showcate = true
    },
    async finish(newcateId) {
      const { data } = await this.$http.put(
        `article/assign`,
        {
          id: this.twoName.id,
          cate_id: newcateId,
        }
      )
      if (data.status !== 200) return this.$message.error('更新文章分类失败！')
      this.$message.success('更新文章分类成功！')
      $emit(this, 'updateMes')
      this.showcate = false
    },
    selectClose() {
      this.twoName = {}
    },
  },
  emits: ['change', 'reGet', 'editarticleMes', 'updateMes'],
}
</script>

<style scoped>
.table {
  margin-top: 15px;
  font-size: 13px;
}

.el-pagination {
  margin-top: 15px;
}
</style>
