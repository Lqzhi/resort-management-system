<template>
  <div >
    <!-- 轮播图 -->
    <el-carousel height="500px" @change="loadAnimate" arrow="hover" indicator-position="outside"
      style="background-color: aliceblue; margin-top: -20px;">
      <el-carousel-item style="background-color: aliceblue;" v-for="(item, index) in addressMes" :key="index">
        <img :src="item.picture_address" style="width:100%;height: auto;" />
      </el-carousel-item>
    </el-carousel>
    <!-- 景点展示 -->
    <div style="background-color:beige;" v-for="(item, index) in addressMes" :key="index">
      <el-row :gutter="20" type="flex" justify="center" align="middle" style="height:600px" >
        <el-col :span="12" v-if="index%2">
          <div class="grid-content bg-purple" type="flex" justify="center" align="middle"
            style="background-color: inherit;">
            <img :src=item.picture_address alt="" style="width: 90%; border-radius: 9px;">
          </div>
        </el-col>
        <el-col :span="12">
          <div class="grid-content bg-purple" type="flex" justify="center" align="middle"
            style="background-color: inherit;">
            <div style=" font-size:300%;">
              {{ item.name }}
            </div>
            <div style="font-size:200%;">
              {{ item.describe }}
            </div>
          </div>
        </el-col>
        <el-col :span="12" v-if="(index+1)%2">
          <div class="grid-content bg-purple" type="flex" justify="center" align="middle"
            style="background-color: inherit;">
            <img :src=item.picture_address alt="" style="width: 90%; border-radius: 9px;">
          </div>
        </el-col>
      </el-row>

    </div>


  </div>
</template>

<script >
import img1 from './img/OIP-C (1).jfif'
import img2 from './img/OIP-C (2).jfif'
export default {
  name: '',
  data() {
    return {
      addressMes:[],
      imgUrs: [
        img1,
        img2
      ],
    }
  },
  created(){
    this.getAddressMes()
  },
  mounted() { },

  methods: {
     async getAddressMes() {
      const { data } = await this.$http.get('address/find')
      if (data.status !== 200) return this.$message.error(data.message)
      this.addressMes = data.data
    },
  }
}


</script>

<style></style>