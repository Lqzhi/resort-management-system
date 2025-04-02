<template>
  <el-row :gutter="20">
    <el-col :span="8">
      <el-input
        placeholder="用户查询"
        clearable
        @clear="getUsersMes"
        v-model="usersMes.query"
      >
        <template v-slot:append>
          <el-button :icon="ElIconSearch" @click="getUsersMes"></el-button>
        </template>
      </el-input>
    </el-col>
    <el-col :span="4">
      <el-button type="primary" round @click="dialogVisible"
        >添加用户</el-button
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
  name: 'users_addUserInput',
  props: {
    usersMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {
    getUsersMes() {
      $emit(this, 'getUsersMes')
    },
    dialogVisible() {
      $emit(this, 'isShow')
    },
  },
  emits: ['getUsersMes', 'isShow'],
}
</script>
