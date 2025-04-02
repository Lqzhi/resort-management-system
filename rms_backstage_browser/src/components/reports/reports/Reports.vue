<template>
  <div>
    <breadcrumb>
      <template v-slot:one>
        <span>数据统计</span>
      </template>
      <template v-slot:two>
        <span>数据报表</span>
      </template>
    </breadcrumb>
    <el-card>
      <div id="main" style="width: 750px; height: 400px" />
    </el-card>
  </div>
</template>

<script>
import breadcrumb from '@/components/common/breadcrumb'
import * as echarts from 'echarts'
import _ from 'lodash'

export default {
  name: 'Reports',
  components: {
    breadcrumb,
  },
  data() {
    return {
      options: {
        title: {
          text: '用户来源',
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross',
            label: {
              backgroundColor: '#E9EEF3',
            },
          },
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true,
        },
        xAxis: [
          {
            boundaryGap: false,
          },
        ],
        yAxis: [
          {
            type: 'value',
          },
        ],
      },
    }
  },
  mounted() {
    this.echarts()
  },
  methods: {
    async echarts() {
      const myChart = echarts.init(document.getElementById('main'))
      const { data: res } = await this.$http.get('reports/type/1')
      if (res.meta.status !== 200)
        return this.$message.error('获取折线图数据失败！')
      const result = _.merge(res.data, this.options)
      myChart.setOption(result)
    },
  },
}
</script>
