<template>
  <div>
    <!--    表格区域-->
    <el-table class="table" :data="rightMes" style="width: 100%" stripe border>
      <el-table-column type="index" label="#" width="50"></el-table-column>
      <el-table-column prop="permission_name" label="权限名称"></el-table-column>
      <el-table-column prop="browser_route" label="路径"></el-table-column>
      <el-table-column prop="permission_level" label="权限等级">
        <template v-slot="scope">
          <el-tag
          :type="scope.row.permission_level | getTagColor"
            disable-transitions>{{scope.row.permission_level | getLevel}}
         </el-tag
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { tagStyle } from '@/common/mixin'

export default {
  name: 'rights_table',
  mixins: [tagStyle],
  props: {
    rightMes: {
      type: Array,
      default() {
        return []
      },
    },
  },
}
</script>

<style scoped>
.table {
  margin-top: 15px;
  font-size: 13px;
}
</style>
