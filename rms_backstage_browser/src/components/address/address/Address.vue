<template>
  <div>
    <!--  面包屑导航区-->
    <breadcrumb>
      <template v-slot:one>
        <span>景点管理</span>
      </template>
      <template v-slot:two>
        <span>景点列表</span>
      </template>
    </breadcrumb>
    <!--  Main-->
    <el-card>
      <address_addaddressInput
        @getaddressMes="getaddressMes"
        :addressMes="addressMes"
        @isShow="dialogVisible"
      />
      <address_table
        :address="address"
        :total="total"
        :addressMes="addressMes"
        @handleSizeChange="handleSizeChange"
        @handleCurrentChange="handleCurrentChange"
        @change="change"
        @reGet="reGet"
        @editaddressMes="editaddressMes"
        @updateMes="getaddressMes"
      />
    </el-card>
    <address_addDialog :isShow="isShow" @isFalse="isFalse" @commit="commit" />
  </div>
</template>

<script>
import breadcrumb from '@/components/common/breadcrumb'
import address_table from './childComponents/address_table'
import address_addDialog from './childComponents/address_addDialog'
import address_addaddressInput from './childComponents/address_addaddressInput.vue'

export default {
  name: 'address',
  components: {
    breadcrumb,
    address_table,
    address_addDialog,
    address_addaddressInput,
  },
  data() {
    return {
      addressMes: {
        query: '',
        pagenum: 1,
        pagesize: 5,
      },
      address: [],
      total: null,
      isShow: false,
    }
  },
  created() {
    this.getaddressMes()
  },
  methods: {
    //获取最新的数据
    async getaddressMes() {
      const { data } = await this.$http.get('address/find', {
        params:this.addressMes,
      })
      if (data.status !== 200)
        return this.$message.error(data.message||'获取景点列表失败！') ;
      console.log(data.data);
      this.address = data.data
      this.total = 100
    },
    //分类项一页显示多少数据///
    handleSizeChange(newSize) {
      this.addressMes.pagesize = newSize
      this.getaddressMes()
    },
    //分类项当前有多少页数据///
    handleCurrentChange(newPage) {
      this.addressMes.pagenum = newPage
      this.getaddressMes()
    },

    //状态改变事件
    async change(addressInfo) {
      console.log(addressInfo.address_state);
      const {data} = await this.$http.put(
        `address/updatestate`,{id:addressInfo.id,address_state:addressInfo.address_state}
      )
      if (data.status !== 200) {
        //更新失败后要保证状态未被改变
        addressInfo.address_state = !addressInfo.address_state
        return this.$message.error(data.message||'更新景点状态失败！')
       
      }
      this.$message.success('更新景点状态成功！')
    },
    //dialog是否显示
    dialogVisible() {
      this.isShow = true
    },
    isFalse() {
      this.isShow = false
    },
    //添加景点事件
    async commit(mes) {
      const {data} = await this.$http.post('address/add', mes)
      if (data.status !== 200) return this.$message.error(data.message||'添加景点失败！')
      this.$message.success('添加景点成功！')
      this.isShow = false
      await this.getaddressMes()
    },
    //移除景点事件
    async reGet(addressInfo, index) {


      const { data } = await this.$http.delete(
        'address/del',{data:{id :addressInfo[index].id}}
      )
      console.log(data);
      if (data.status !== 200) return this.$message.error('删除景点失败！')
      this.$message.success('删除景点成功！')
      this.address.splice(index, 1)
      await this.getaddressMes()
    },
    async editaddressMes(addressMes) {
      console.log(addressMes);
      const { data } = await this.$http.put(`address/update`,addressMes)
      console.log(data);
      if (data.status !== 200) return this.$message.error(data.message||'编辑景点信息失败！')
      this.$message.success('编辑景点信息成功！')
      await this.getaddressMes()
    },
  },
}
</script>
