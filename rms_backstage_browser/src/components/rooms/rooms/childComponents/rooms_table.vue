<template>
  <div>
    <!--    表格区域-->
    <el-table class="table" :data="rooms" style="width: 100%" stripe border>
      <el-table-column type="index" label="#" width="50"></el-table-column>
      <el-table-column prop="room_no" label="房间号"></el-table-column>
      <el-table-column prop="room_floor" label="所在楼层"></el-table-column>
      <el-table-column prop="hotel" label="所属酒店"></el-table-column>
      <el-table-column prop="r_type_name" label="所属分类"></el-table-column>
      <el-table-column prop="room_state" label="状态">
      </el-table-column>
      <el-table-column prop="introduction" label="房间描述"></el-table-column>
      <el-table-column label="操作" width="200">
        <template v-slot="scope">
          <el-tooltip effect="dark" content="编辑信息" placement="top" :enterable="false">
            <el-button :icon="ElIconEdit" type="primary" size="mini" @click="editMes(scope.$index)"></el-button>
          </el-tooltip>
          <el-tooltip effect="dark" content="移除房间" placement="top" :enterable="false">
            <el-button :icon="ElIconDelete" type="danger" size="mini" @click="deleted(scope.$index)"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
    <!--      分页区域-->
    <el-pagination class="el-pagination" @size-change="handleSizeChange" @current-change="handleCurrentChange"
      :current-page="roomsMes.pagenum" :page-sizes="[1, 2, 5, 10]" :page-size="roomsMes.pagesize"
      layout="total, sizes, prev, pager, next, jumper" :total="total">
    </el-pagination>
    <rooms_editDialog :isShow="isShow" @isFalse="isFalse" :roomMes="onlyroom" @editroomMes="editroomMes" />
  </div>
</template>

<script>
import {
  Edit as ElIconEdit,
  Delete as ElIconDelete,
  Setting as ElIconSetting,
} from '@element-plus/icons'
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
import rooms_editDialog from './rooms_table_editDialog'
import { pagination } from '@/common/mixin'
import { dateFormat } from '@/common/dateFormat'

export default {
  data() {
    return {
      isShow: false,
      isDelete: false,
      showcate: false,
      onlyroom: {},
      twoName: {},
      catesList: [],
      ElIconEdit,
      ElIconDelete,
      ElIconSetting,
      dateFormat,
    }
  },
  name: 'rooms_table',
  components: {
    rooms_editDialog,
  },
  mixins: [pagination],
  props: {
    rooms: {
      type: Array,
      default() {
        return []
      },
    },
    total: {
      type: Number,
      default: 0,
    },
    roomsMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {

    change(roomInfo) {
      $emit(this, 'change', roomInfo)
    },
    async deleted(index) {
      const confirm = await this.$confirm(
        '此操作将永久删除该房间, 是否继续?',
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
        }
      ).catch((err) => err)
      if (confirm !== 'confirm') return this.$message.info('已取消删除')
      console.log(this.rooms);
      $emit(this, 'reGet', this.rooms, index)
    },
    editMes(index) {
      const { id,
        room_no,
        room_floor,
        hotel,
        type_id,
        introduction } = this.rooms[index]
      this.onlyroom = {
        id,
        room_no,
        room_floor,
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
    editroomMes(roomsMes) {
      $emit(this, 'editroomMes', roomsMes)
      setTimeout(() => {
        this.isFalse()
      }, 300)
    },
    async addcates(mes) {
      this.twoName = mes
      const { data } = await this.$http.get('cate/find')
      console.log(data);
      if (data.status !== 200)
        return this.$message.error('获取房间分类列表失败！')
      this.catesList = data.data
      this.showcate = true
    },
    async finish(newcateId) {
      const { data } = await this.$http.put(
        `room/assign`,
        {
          id: this.twoName.id,
          cate_id: newcateId,
        }
      )
      if (data.status !== 200) return this.$message.error('更新房间分类失败！')
      this.$message.success('更新房间分类成功！')
      $emit(this, 'updateMes')
      this.showcate = false
    },
    selectClose() {
      this.twoName = {}
    },
  },
  emits: ['change', 'reGet', 'editroomMes', 'updateMes'],
}
</script>

<style scoped>
.table {
  margin-top: 15px;
  font-size: 13px;
}

.el-pagination {
  margin-top: 15px;
}</style>
