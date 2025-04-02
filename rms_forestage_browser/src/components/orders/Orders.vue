<!-- 我的订单 -->
<template>
  <div>
    <el-table :data="myOrders" style="width: 100%">
      <el-table-column prop="order_no" label="订单编号" width="180">
      </el-table-column>
      <el-table-column prop="room_no" label="房间号" width="180">
        <template v-slot="scope">
          {{ scope.row.room_no || "未分配" }}
        </template>
      </el-table-column>
      <el-table-column prop="room_price" label="房间价格">
        <template v-slot="scope">
          {{ "￥" + scope.row.room_price + "元/天" }}
        </template>
      </el-table-column>
      <el-table-column prop="pay_amount" label="实付金额">
        <template v-slot="scope">
          {{ scope.row.pay_amount || "未支付" }}
        </template>

      </el-table-column>
      <el-table-column prop="book_time" label="预定时间">
        <template v-slot="scope">
          {{ dateFormat("YY-mm-dd HH:MM:SS", scope.row.book_time) }}
        </template>
      </el-table-column>
      <el-table-column prop="occupation_time" label="预定时间">
        <template v-slot="scope">
          {{ dateFormat("YY-mm-dd HH:MM:SS", scope.row.occupation_time) }}
        </template>
      </el-table-column>
      <el-table-column prop="order_state" label="订单状态">
        <template v-slot="scope">
          {{ getState(scope.row) }}
        </template>
      </el-table-column>
      <el-table-column prop="address" label="进行操作">
        <template v-slot="scope">
          <el-tooltip effect="dark" content="取消预订" placement="top" v-if="scope.row.order_state == 0 && !disabledDate(scope.row.occupation_time)">
          <el-button  type="danger" size="mini" @click="cancellationBtn(scope.row)" >取消预订</el-button>
        </el-tooltip>
        <el-tooltip effect="dark" content="取消预订" placement="top" v-else>
          <el-button  type="Info" size="mini" plain disabled>取消预订</el-button>
        </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
    <!-- 确认取消对话框 -->
    <el-dialog
    v-model="dialogVisible"
    title="确认取消吗？"
    width="30%"
    :before-close="handleClose"
  >
    <span>取消之后不能再对该订单进行操作，只能重新预订</span>
    <template #footer>
      <span class="dialog-footer">
        <el-button type="primary" @click="cancellation()">
          确认取消
        </el-button>
        <el-button @click="dialogVisible = false">考虑一下</el-button>
      
      </span>
    </template>
  </el-dialog>

  </div>
</template>

<script>
import { dateFormat } from '@/common/dateFormat'
export default {
  name: '',
  data() {
    return {
      myOrders: '',
      dialogVisible : false,
      order_no:''




    };
  },

  components: {},

  computed: {},

  mounted() { },
  created() {
    this.getOrder()
  },

  methods: {
    dateFormat,
    async getOrder() {

      const { data } = await this.$http.get('order/my')
      if (data.status !== 200)
        return this.$message.error(data.message || '获取订单列表失败！');
      console.log(data.data);
      this.myOrders = data.data
    },
    // 判断订单状态
    getState(row) {
      if (row.order_state == 3) return '已取消预订'
      if (row.order_state == 2) return '已结账'
      if (row.order_state == 1) return '已入住'
      if (row == 0 && disabledDate(row.occupation_time)) return "逾期未入住，已过期"
      return "已预订"
    },
    // 判断时间
    disabledDate(time) {
      return new Date(time) < Date.now()
    },
    // 点击取消按钮 保存需要取消的订单号
    cancellationBtn(row){
      this.order_no = row.order_no
      this.dialogVisible = true

    },
    // 确认取消预订
      async cancellation() {
      const { data } = await this.$http.delete('order/cancel', {data:{order_no :this.order_no}})
      if (data.status !== 200)
        return this.$message.error(data.message || '订单未取消！');
      this.$message.success("订单已取消")
      this.dialogVisible = false
      await this.getOrder()
    }
  }
}

</script>
<style scoped></style>