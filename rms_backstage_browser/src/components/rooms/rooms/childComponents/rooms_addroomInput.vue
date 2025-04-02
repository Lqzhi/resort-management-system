<template>
  <el-row :gutter="20">
    <el-col :span="8">
      <el-input
        placeholder="房间查询"
        clearable
        @clear="getroomsMes"
        v-model="roomsMes.query"
      >
        <template v-slot:append>
          <el-button :icon="ElIconSearch" @click="getroomsMes"></el-button>
        </template>
      </el-input>
    </el-col>
    <el-col :span="4">
      <el-button type="primary" round @click="dialogVisible"
        >添加房间</el-button
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
  name: 'rooms_addroomInput',
  props: {
    roomsMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {
    getroomsMes() {
      $emit(this, 'getroomsMes')
    },
    dialogVisible() {
      $emit(this, 'isShow')
    },
  },
  emits: ['getroomsMes', 'isShow'],
}
</script>
