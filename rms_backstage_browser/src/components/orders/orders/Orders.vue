<template>
  <div>
    <!--  面包屑导航区-->
    <breadcrumb>
      <template v-slot:one>
        <span>订单管理</span>
      </template>
      <template v-slot:two>
        <span>订单列表</span>
      </template>
    </breadcrumb>
    <el-card>
      <div>
        <el-table class="table" :data="orders" style="width: 100%" stripe border>
          <el-table-column type="index" label="#" width="50"></el-table-column>
          <el-table-column prop="order_no" label="订单号" width="150"></el-table-column>
          <el-table-column prop="room_price" label="房间价格"></el-table-column>
          <el-table-column prop="linkman" label="联系人"></el-table-column>
          <el-table-column prop="room_no" label="房间号"></el-table-column>
          <el-table-column prop="room_deposit" label="房间押金"></el-table-column>
          <el-table-column prop="room_price" label="房间价格"></el-table-column>
          <el-table-column prop="total_days" label="入住天数"></el-table-column>
          <el-table-column prop="refund" label="退还押金"></el-table-column>
          <el-table-column prop="pay_amount" label="实付金额"></el-table-column>
          <el-table-column prop="order_state" label="订单状态">
            <template v-slot="scope">{{ getState(scope.row) }}</template>
          </el-table-column>
          <el-table-column prop="book_time" label="预订时间">
            <template v-slot="scope">{{ dateFormat("YYYY-mm-dd HH:MM", scope.row.book_time) }}</template>
          </el-table-column>
          <el-table-column prop="occupation_time" label="入住时间">
            <template v-slot="scope">{{ dateFormat("YYYY-mm-dd HH:MM", scope.row.occupation_time) }}</template>
          </el-table-column>
          <el-table-column prop="check_out_time" label="退房时间">
            <template v-slot="scope">{{ scope.row.check_out_time == null ? '' : dateFormat("YYYY-mm-dd HH:MM",
              scope.row.check_out_time) }}</template>
          </el-table-column>
          <el-table-column label="操作" width="200">
            <template v-slot="scope">
              <el-tooltip effect="dark" content="分配房间" placement="top" :enterable="false"
                v-if="getState(scope.row) == '已预订' && scope.row.room_id == null">
                <el-button type="primary" size="mini" @click="assignmentsBtn(scope.$index)">分配房间</el-button>
              </el-tooltip>
              <el-tooltip effect="dark" content="分配房间" placement="top" :enterable="false"
                v-if="getState(scope.row) == '已预订' && scope.row.room_id !== null">
                <el-button type="primary" size="mini" @click="checkIn(scope.$index)">办理入住</el-button>
              </el-tooltip>
              <el-tooltip effect="dark" content="" placement="top" :enterable="false" v-if="getState(scope.row) == '已入住'">
                <el-button :icon="ElIconDelete" type="danger" size="mini" @click="checkOutBtn(scope.row)">退房手续</el-button>
              </el-tooltip>
            </template>
          </el-table-column>
        </el-table>
        <!--      分页区域-->
        <el-pagination class="el-pagination" @size-change="handleSizeChange" @current-change="handleCurrentChange"
          :current-page="ordersMes.pagenum" :page-sizes="[1, 2, 5, 10]" :page-size="ordersMes.pagesize"
          layout="total, sizes, prev, pager, next, jumper" :total="total">
        </el-pagination>
        <order_editDialog :isShow="isShow" @isFalse="isFalse" :articleMes="onlyarticle"
          @editarticleMes="editarticleMes" />
      </div>

    </el-card>
  </div>
</template>

<script>
import breadcrumb from '@/components/common/breadcrumb'
import { dateFormat } from '@/common/dateFormat'
import { Edit as ElIconEdit, Delete as ElIconDelete, Setting as ElIconSetting } from '@element-plus/icons'
export default {
  name: 'order',
  components: {
    breadcrumb,
  },
  data() {
    return {
      ordersMes: {
        query: '',
        pagenum: 1,
        pagesize: 5,
      },
      orders: [],
      rooms: [],
      total: null,
      isShow: false,
    }
  },
  created() {
    this.getordersMes()
  },
  methods: {
    // 格式化时间
    dateFormat,
    // 判断时间
    disabledDate(time) {
      return new Date(time) < Date.now()
    },

    // 判断时间
    getState(row) {
      if (row.order_state == 3) return '已取消预订'
      if (row.order_state == 2) return '已结账'
      if (row.order_state == 1) return '已入住'
      if (row.order_state == 0 && this.disabledDate(row.occupation_time)) return "逾期未入住，已过期"
      return "已预订"
    },


    //获取最新的数据
    async getroomsMes(tid) {
      const { data } = await this.$http.get('room/findbytid', {
        type_id: tid
      })
      if (data.status !== 200)
        return this.$message.error(data.message || '获取房间列表失败！');
      console.log(data.data);
      this.rooms = data.data
    },
    // 分配房间按钮
    assignmentsBtn(i) {
      console.log(i);
      this.getroomsMes(1)


    },
    // 入住房间按钮
    checkOnBtn() {

    },
    // 退房手续按钮
    checkOutBtn() {

    }
    ,



    //获取最新的数据
    async getordersMes() {
      const { data } = await this.$http.get('order/find', {
        params: this.ordersMes,
      })
      if (data.status !== 200)
        return this.$message.error(data.message || '获取订单列表失败！');
      console.log(data.data);
      this.orders = data.data
      this.total = 100
    },
    //分类项一页显示多少数据///
    handleSizeChange(newSize) {
      this.ordersMes.pagesize = newSize
      this.getordersMes()
    },
    //分类项当前有多少页数据///
    handleCurrentChange(newPage) {
      this.ordersMes.pagenum = newPage
      this.getordersMes()
    },


    //分配房间事件
    async assignments(orderInfo) {
      console.log(orderInfo.order_state);
      const { data } = await this.$http.put(
        `order/assignments`, { id: orderInfo.id, order_state: orderInfo.order_state }
      )
      if (data.status !== 200) {
        //更新失败后要保证状态未被改变
        orderInfo.order_state = !orderInfo.order_state
        return this.$message.error(data.message || '房间分配失败！')
      }
      this.$message.success('房间分配成功！')
      this.getordersMes()
    },


    //房间入住手续
    async checkIn(orderInfo) {
      console.log(orderInfo.order_state);
      const { data } = await this.$http.put(
        `order/checkIn`, { id: orderInfo.id, order_state: orderInfo.order_state }
      )
      if (data.status !== 200) {
        //更新失败后要保证状态未被改变
        orderInfo.order_state = !orderInfo.order_state
        return this.$message.error(data.message || '办理失败！')
      }
      this.$message.success('成功办理')
      this.getordersMes()
    },
    //退房手续办理
    async checkOut(orderInfo) {
      console.log(orderInfo.order_state);
      const { data } = await this.$http.put(
        `order/checkOut`, { id: orderInfo.id, order_state: orderInfo.order_state }
      )
      if (data.status !== 200) {
        //更新失败后要保证状态未被改变
        orderInfo.order_state = !orderInfo.order_state
        return this.$message.error(data.message || '办理失败')
      }
      this.$message.success('办理成功！')
      this.getordersMes()
    },






    //dialog是否显示
    dialogVisible() {
      this.isShow = true
    },
    isFalse() {
      this.isShow = false
    },

    //添加订单事件
    async commit(mes) {
      const { data } = await this.$http.post('order/add', mes)
      if (data.status !== 200) return this.$message.error(data.message || '添加订单失败！')
      this.$message.success('添加订单成功！')
      this.isShow = false
      await this.getordersMes()
    },
    //移除订单事件
    async editorderMes(orderMes) {
      console.log(orderMes);
      const { data } = await this.$http.put(`order/update`, orderMes)
      console.log(data);
      if (data.status !== 200) return this.$message.error(data.message || '编辑订单信息失败！')
      this.$message.success('编辑订单信息成功！')
      await this.getordersMes()
    },
  },
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

