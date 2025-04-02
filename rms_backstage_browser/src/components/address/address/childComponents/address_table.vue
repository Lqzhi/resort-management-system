<template>
  <div>
    <!--    表格区域-->
    <el-table class="table" :data="address" style="width: 100%" stripe border>
      <el-table-column type="index" label="#" width="50"></el-table-column>
      <el-table-column prop="name" label="景点名称"></el-table-column>
      <el-table-column prop="lgn" label="所在经度"></el-table-column>
      <el-table-column prop="lat" label="所在纬度"></el-table-column>
      <el-table-column prop="man_time" label="访问人次"></el-table-column>
      <el-table-column label="操作" width="200">
        <template v-slot="scope">
          <el-tooltip effect="dark" content="编辑信息" placement="top" :enterable="false">
            <el-button :icon="ElIconEdit" type="primary" size="mini" @click="editMes(scope.$index)"></el-button>
          </el-tooltip>
          <el-tooltip effect="dark" content="移除景点" placement="top" :enterable="false">
            <el-button :icon="ElIconDelete" type="danger" size="mini" @click="deleted(scope.$index)"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
    <!--      分页区域-->
    <el-pagination class="el-pagination" @size-change="handleSizeChange" @current-change="handleCurrentChange"
      :current-page="addressMes.pagenum" :page-sizes="[1, 2, 5, 10]" :page-size="addressMes.pagesize"
      layout="total, sizes, prev, pager, next, jumper" :total="total">
    </el-pagination>
    <address_editDialog :isShow="isShow" @isFalse="isFalse" :addressMes="onlyaddress" @editaddressMes="editaddressMes" />
  </div>
</template>

<script>
import {
  Edit as ElIconEdit,
  Delete as ElIconDelete,
  Setting as ElIconSetting,
} from '@element-plus/icons'
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
import address_editDialog from './address_table_editDialog'
import { pagination } from '@/common/mixin'
import { dateFormat } from '@/common/dateFormat'

export default {
  data() {
    return {
      isShow: false,
      isDelete: false,
      showcate: false,
      onlyaddress: {},
      twoName: {},
      catesList: [],
      ElIconEdit,
      ElIconDelete,
      ElIconSetting,
      dateFormat,
    }
  },
  name: 'address_table',
  components: {
    address_editDialog,
  },
  mixins: [pagination],
  props: {
    address: {
      type: Array,
      default() {
        return []
      },
    },
    total: {
      type: Number,
      default: 0,
    },
    addressMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  methods: {

    change(addressInfo) {
      $emit(this, 'change', addressInfo)
    },
    async deleted(index) {
      const confirm = await this.$confirm(
        '此操作将永久删除该景点, 是否继续?',
        '提示',
        {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
        }
      ).catch((err) => err)
      if (confirm !== 'confirm') return this.$message.info('已取消删除')
      console.log(this.address);
      $emit(this, 'reGet', this.address, index)
    },
    editMes(index) {
      const { id,
        address_no,
        address_floor,
        hotel,
        type_id,
        introduction } = this.address[index]
      this.onlyaddress = {
        id,
        address_no,
        address_floor,
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
    editaddressMes(addressMes) {
      $emit(this, 'editaddressMes', addressMes)
      setTimeout(() => {
        this.isFalse()
      }, 300)
    },
    async addcates(mes) {
      this.twoName = mes
      const { data } = await this.$http.get('cate/find')
      console.log(data);
      if (data.status !== 200)
        return this.$message.error('获取景点分类列表失败！')
      this.catesList = data.data
      this.showcate = true
    },
    async finish(newcateId) {
      const { data } = await this.$http.put(
        `address/assign`,
        {
          id: this.twoName.id,
          cate_id: newcateId,
        }
      )
      if (data.status !== 200) return this.$message.error('更新景点分类失败！')
      this.$message.success('更新景点分类成功！')
      $emit(this, 'updateMes')
      this.showcate = false
    },
    selectClose() {
      this.twoName = {}
    },
  },
  emits: ['change', 'reGet', 'editaddressMes', 'updateMes'],
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
