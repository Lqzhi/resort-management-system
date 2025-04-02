<!--  -->
<template>
  <div>
    <div style="height:30vmin; width: 100%;">
      <!-- 3d房间 -->
      <div id="wrap">
        <div id="inner">
          <div id="box">
            <div>前</div>
            <div>后</div>
            <div>左</div>
            <div>右</div>
            <div>下</div>
            <div>上</div>
          </div>
        </div>
      </div>
    </div>
    <!-- 房间表格 -->
    <el-table :data="roomsMes" style="width: 100%;">
      <el-table-column prop="picture_adress" label="房间图片" @click="toVr()">
        <template v-slot="scope">

          <el-image :src="scope.row.picture_adress" style="width: 100%; border-radius: 10px;"  @click="toVr()"  />
          <!-- <img slot="reference" :src="scope.row.product.cover" style="width: 30px;height: 30px"> -->

        </template>
      </el-table-column>
      <el-table-column prop="r_type_name" label="房间类型" width="80" />
      <el-table-column prop="r_type_introduction" label="房间描述" />

      <el-table-column prop="room_price" label="房间价格" width="180">
        <template v-slot="scope">{{ "￥" + scope.row.room_price + "元/天" }}</template>
      </el-table-column>
      <el-table-column prop="room_deposit" label="房间定金" width="180">
        <template v-slot="scope">{{ "￥" + scope.row.room_deposit + "元" }}</template>
      </el-table-column>
      <el-table-column prop="number" label="房间状态" width="180">
        <template v-slot="scope">{{ scope.row.number > 0 ? "剩余" + scope.row.number + "间" : "已客满" }}</template>
      </el-table-column>
      <el-table-column prop="number" label="进行操作" width="180">
        <template v-slot="scope">
          <el-tooltip effect="dark" content="预订" placement="top" v-if="scope.row.number > 0">
            <el-button :icon="Delete" type="danger" size="mini" @click="book(scope.row)">预订</el-button>
          </el-tooltip>
          <el-tooltip effect="dark" content="预订" placement="top" v-else>
            <el-button :icon="Delete" type="Info" size="mini" plain disabled>预订</el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
    <!-- 预订表单 -->
    <el-dialog v-model="dialogFormVisible" title="入住时间">
      <el-form :model="form">
        <el-form-item label="入住时间" :label-width="formLabelWidth">
          <el-date-picker v-model="form.occupation_time" type="date" label="入住时间" placeholder="请选择您的入住时间"
            style="width: 100%" :disabled-date="disabledDate" value-format="x" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogFormVisible = false">退出预订</el-button>
          <el-button type="primary" @click="confirm()">
            确认
          </el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script>
import vrRoom from "./vrRoom.vue"
import { Delete } from "@element-plus/icons"
export default {
  name: '',
  data() {

    return {
      roomsMes: [],
      dialogFormVisible: false,
      form: {
        id: '',
        occupation_time: ''
      },

    };
  },

  components: {
    Delete,
    vrRoom

  },

  created() {
    this.getroomsMes()
  },
  computed: {},

  mounted() {

  },

  methods: {
    async getroomsMes() {
      const { data } = await this.$http.get('room/find', {
        params: this.roomsMes,
      })
      if (data.status !== 200)
        return this.$message.error(data.message || '获取房间列表失败！');
      console.log(data.data);
      this.roomsMes = data.data
    },
    book(row) {
      if (!window.sessionStorage.getItem('token')) return this.$message.error("请先登录再预订")
      this.form.id = row.id
      this.dialogFormVisible = true
    },
    disabledDate(time) {
      return time.getTime() < Date.now()
    },
    async toVr() {
      await this.$router.push("/vrroom")
    }
    ,
    async confirm() {
      const { data } = await this.$http.post('order/add', this.form)
      if (data.status !== 200)
        return this.$message.error(data.message || '预订失败！');
      console.log(data.data);
      this.$message.success("预定成功")
    }
  },

}

</script>
<style  scoped>
#wrap {
  width: 100%;
  height: 100%;
  -webkit-perspective: 300px;
  perspective: 300px;
  overflow: hidden;
}

#inner {
  position: absolute;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
  -webkit-transform: translateZ(200px);
  transform: translateZ(200px);
}

#box {
  /*position: relative;*/
  position: absolute;
  left: 50%;
  top: 50%;
  width: 512px;
  height: 512px;
  margin: -256px 0 0 -256px;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
  transition: 20s;
  transform: rotateX(0deg);
}

#box div {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  /*transition: 5s;*/
}

#box div:nth-of-type(1) {
  background: url(img/qian.png) no-repeat;
  background-size: 100% 100%;
  transform: rotateY(0deg) translateZ(-256px);
}

#box div:nth-of-type(2) {
  background: url(img/hou.png) no-repeat;
  background-size: 100% 100%;
  transform: rotateY(180deg) translateZ(-256px);
}

#box div:nth-of-type(3) {
  background: url(img/you.png) no-repeat;
  background-size: 100% 100%;
  transform: rotateY(270deg) translateZ(-256px);
}

#box div:nth-of-type(4) {
  background: url(img/zuo.png) no-repeat;
  background-size: 100% 100%;
  transform: rotateY(90deg) translateZ(-256px);
}

#box div:nth-of-type(5) {
  background: url(img/xia.png) no-repeat;
  background-size: 100% 100%;
  transform: rotateX(90deg) translateZ(-256px);
}

#box div:nth-of-type(6) {
  background: url(img/shang.png) no-repeat;
  background-size: 100% 100%;
  transform: rotateX(270deg) translateZ(-256px);
}



#wrap:hover #box {
  transform: rotateY(360deg);
}

#lleft:hover #box {
  transform: rotateY(-360deg);
}
</style>





