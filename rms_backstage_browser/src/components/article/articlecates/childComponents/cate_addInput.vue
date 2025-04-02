<template>
  <el-row :gutter="20">
    <el-col :span="8">
      <el-button type="primary" round @click="dialogVisible"
        >添加</el-button
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
  name: 'cate_addInput',
  props: {
    cateMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {
    getsMes() {
      $emit(this, 'getsMes')
    },
    dialogVisible() {
      $emit(this, 'isShow')
    },
  },
  emits: ['getsMes', 'isShow'],
}
</script>
