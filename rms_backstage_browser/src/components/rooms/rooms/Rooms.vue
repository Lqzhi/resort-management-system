<template>
  <div>
    <!--  面包屑导航区-->
    <breadcrumb>
      <template v-slot:one>
        <span>房间管理</span>
      </template>
      <template v-slot:two>
        <span>房间列表</span>
      </template>
    </breadcrumb>
    <!--  Main-->
    <el-card>
      <rooms_addroomInput @getroomsMes="getroomsMes" :roomsMes="roomsMes" @isShow="dialogVisible" />
      <rooms_table :rooms="rooms" :total="total" :roomsMes="roomsMes" @handleSizeChange="handleSizeChange"
        @handleCurrentChange="handleCurrentChange" @change="change" @reGet="reGet" @editroomMes="editroomMes"
        @updateMes="getroomsMes" />
    </el-card>
    <rooms_addDialog :isShow="isShow" @isFalse="isFalse" @commit="commit" />
  </div>
</template>

<script>
import breadcrumb from '@/components/common/breadcrumb'
import rooms_table from './childComponents/rooms_table'
import rooms_addDialog from './childComponents/rooms_addDialog'
import rooms_addroomInput from './childComponents/rooms_addroomInput.vue'

export default {
  name: 'room',
  components: {
    breadcrumb,
    rooms_table,
    rooms_addDialog,
    rooms_addroomInput,
  },
  data() {
    return {
      roomsMes: {
        query: '',
        pagenum: 1,
        pagesize: 5,
      },
      rooms: [],
      total: null,
      isShow: false,
    }
  },
  created() {
    this.getroomsMes()
  },
  methods: {
    //获取最新的数据
    async getroomsMes() {
      const { data } = await this.$http.get('room/find', {
        params: this.roomsMes,
      })
      if (data.status !== 200)
        return this.$message.error(data.message || '获取房间列表失败！');
      console.log(data.data);
      this.rooms = data.data
      this.total = 100
    },
    //分类项一页显示多少数据///
    handleSizeChange(newSize) {
      this.roomsMes.pagesize = newSize
      this.getroomsMes()
    },
    //分类项当前有多少页数据///
    handleCurrentChange(newPage) {
      this.roomsMes.pagenum = newPage
      this.getroomsMes()
    },

    //状态改变事件
    async change(roomInfo) {
      console.log(roomInfo.room_state);
      const { data } = await this.$http.put(
        `room/updatestate`, { id: roomInfo.id, room_state: roomInfo.room_state }
      )
      if (data.status !== 200) {
        //更新失败后要保证状态未被改变
        roomInfo.room_state = !roomInfo.room_state
        return this.$message.error(data.message || '更新房间状态失败！')

      }
      this.$message.success('更新房间状态成功！')
    },
    //dialog是否显示
    dialogVisible() {
      this.isShow = true
    },
    isFalse() {
      this.isShow = false
    },
    //添加房间事件
    async commit(mes) {
      const { data } = await this.$http.post('room/add', mes)
      if (data.status !== 200) return this.$message.error(data.message || '添加房间失败！')
      this.$message.success('添加房间成功！')
      this.isShow = false
      await this.getroomsMes()
    },
    //移除房间事件
    async reGet(roomInfo, index) {


      const { data } = await this.$http.delete(
        'room/del', { data: { id: roomInfo[index].id } }
      )
      console.log(data);
      if (data.status !== 200) return this.$message.error('删除房间失败！')
      this.$message.success('删除房间成功！')
      this.rooms.splice(index, 1)
      await this.getroomsMes()
    },
    async editroomMes(roomMes) {
      console.log(roomMes);
      const { data } = await this.$http.put(`room/update`, roomMes)
      console.log(data);
      if (data.status !== 200) return this.$message.error(data.message || '编辑房间信息失败！')
      this.$message.success('编辑房间信息成功！')
      await this.getroomsMes()
    },
  },
}
</script>
