<template>
  <el-row :gutter="20">
    <el-col :span="8">
      <el-input
        placeholder="文章查询"
        clearable
        @clear="getarticlesMes"
        v-model="articlesMes.query"
      >
        <template v-slot:append>
          <el-button :icon="ElIconSearch" @click="getarticlesMes"></el-button>
        </template>
      </el-input>
    </el-col>
    <el-col :span="4">
      <el-button type="primary" round @click="dialogVisible"
        >添加文章</el-button
      >
    </el-col>
  </el-row>
</template>

<script>
import { Search as ElIconSearch } from '@element-plus/icons'
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
export default {
  data() {
    return {
      ElIconSearch,
    }
  },
  name: 'articles_addarticleInput',
  props: {
    articlesMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {
    getarticlesMes() {
      $emit(this, 'getarticlesMes')
    },
    dialogVisible() {
      $emit(this, 'isShow')
    },
  },
  emits: ['getarticlesMes', 'isShow'],
}
</script>
