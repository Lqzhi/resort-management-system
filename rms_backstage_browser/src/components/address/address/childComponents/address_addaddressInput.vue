<template>
  <el-row :gutter="20">
    <el-col :span="8">
      <el-input
        placeholder="查询"
        clearable
        @clear="getaddressMes"
        v-model="addressMes.query"
      >
        <template v-slot:append>
          <el-button :icon="ElIconSearch" @click="getaddressMes"></el-button>
        </template>
      </el-input>
    </el-col>
    <el-col :span="4">
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
  name: 'address_addaddressInput',
  props: {
    addressMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {
    getaddressMes() {
      $emit(this, 'getaddressMes')
    },
    dialogVisible() {
      $emit(this, 'isShow')
    },
  },
  emits: ['getaddressMes', 'isShow'],
}
</script>
