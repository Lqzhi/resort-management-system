<!-- 数据可视化组件 -->
<!-- 由组件库Echarts进行生成 -->


<template>
  <div>
    <div class="container-fluid">
      <el-row class="spannel_list" :gutter="10">

        <el-col :sm="6" :xs="12">
          <div class="spannel">
            <em>10</em><span>位</span>
            <b>管理员总数</b>
          </div>
        </el-col>

        <el-col :sm="6" :xs="12">
          <div class="spannel scolor01">
            <em>1036</em><span>位</span>
            <b>游客总数</b>
          </div>
        </el-col>

        <el-col :sm="6" :xs="12">
          <div class="spannel scolor02">
            <em>1423</em><span>个</span>
            <b>订单总数</b>
          </div>
        </el-col>

        <el-col :sm="6" :xs="12">
          <div class="spannel scolor03">
            <em>121</em><span>文章总数</span>
            <b>文章总数</b>
          </div>
        </el-col>
      </el-row>
    </div>

    <div class="container-fluid">
      <el-row class="curve-pie" :gutter="10">
        <el-col :sm="16" :xs="16">
          <div class="gragh_pannel" id="curve_show"></div>
        </el-col>
        <el-col :sm="8" :xs="8">
          <div class="gragh_pannel" id="pie_show"></div>
        </el-col>
      </el-row>
    </div>
    <h1 id = "column_show"></h1>
    <!-- <div class="container-fluid">
      <div class="column_pannel" id="column_show"></div>
    </div> -->
  </div>
</template>

<script>
import * as echarts from 'echarts'

export default {
  name: 'MyChart',
  data(){
    return{
      admin:'',
      tourist:'',


    }
  },
  created() {
    // this.getUsersMes()
  },
  mounted() {
    const oChart = echarts.init(document.getElementById('curve_show'))
    const aListAll = [
      // { count: 36, date: '2022-02-13' },
      // { count: 52, date: '2023-02-14' },
      // { count: 78, date: '2023-02-15' },
      // { count: 85, date: '2023-02-16' },
      // { count: 65, date: '2023-02-17' },
      // { count: 72, date: '2023-02-18' },
      // { count: 88, date: '2023-02-19' },
      // { count: 64, date: '2023-02-20' },
      // { count: 72, date: '2023-02-21' },
      // { count: 90, date: '2023-02-22' },
      // { count: 96, date: '2023-02-23' },
      // { count: 12, date: '2023-02-24' },
      // { count: 102, date: '2023-02-25' },
      // { count: 110, date: '2023-02-26' },
      // { count: 123, date: '2023-02-27' },
      { count: 100, date: '2022-06' },
      { count: 132, date: '2022-07' },
      { count: 146, date: '2023-08' },
      { count: 200, date: '2022-09' },
      { count: 180, date: '2022-10' },
      { count: 163, date: '2022-11' },
      { count: 110, date: '2022-12' },
      { count: 80, date: '2023-01' },
      { count: 82, date: '2023-02' },
      { count: 70, date: '2023-03' },
    ]

    const aCount = []
    const aDate = []

    for (let i = 0; i < aListAll.length; i++) {
      aCount.push(aListAll[i].count)
      aDate.push(aListAll[i].date)
    }

    const chartopt = {
      title: {
        text: '月新增订单数',
        left: 'center',
        top: '10'
      },
      tooltip: {
        trigger: 'axis'
      },
      legend: {
        data: ['新增订单'],
        top: '40'
      },
      toolbox: {
        show: true,
        feature: {
          mark: { show: true },
          dataView: { show: true, readOnly: false },
          magicType: { show: true, type: ['line', 'bar'] },
          restore: { show: true },
          saveAsImage: { show: true }
        }
      },
      calculable: true,
      xAxis: [
        {
          name: '日',
          type: 'category',
          boundaryGap: false,
          data: aDate
        }
      ],
      yAxis: [
        {
          name: '月新增订单数',
          type: 'value'
        }
      ],
      series: [
        {
          name: '新增文章',
          type: 'line',
          smooth: true,
          areaStyle: { type: 'default' },
          itemStyle: { color: '#f80', lineStyle: { color: '#f80' } },
          data: aCount
        }
      ],
      areaStyle: {
        normal: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            {
              offset: 0,
              color: 'rgba(255,136,0,0.39)'
            },
            {
              offset: 0.34,
              color: 'rgba(255,180,0,0.25)'
            },
            {
              offset: 1,
              color: 'rgba(255,222,0,0.00)'
            }
          ])
        }
      },
      grid: {
        show: true,
        x: 50,
        x2: 50,
        y: 80,
        height: 220
      }
    }

    oChart.setOption(chartopt)

    const oPie = echarts.init(document.getElementById('pie_show'))
    const oPieopt = {
      title: {
        top: 10,
        text: '近四月订单对比',
        x: 'center'
      },
      tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b} : {c} ({d}%)'
      },
      color: ['#5885e8', '#13cfd5', '#00ce68', '#ff9565'],
      legend: {
        x: 'center',
        top: 65,
        data: ['2022/12', '2023/1', '2023/2', '2023/3']
      },
      toolbox: {
        show: true,
        x: 'center',
        top: 35,
        feature: {
          mark: { show: true },
          dataView: { show: true, readOnly: false },
          magicType: {
            show: true,
            type: ['pie', 'funnel'],
            option: {
              funnel: {
                x: '25%',
                width: '50%',
                funnelAlign: 'left',
                max: 1548
              }
            }
          },
          restore: { show: true },
          saveAsImage: { show: true }
        }
      },
      calculable: true,
      series: [
        {
          name: '新增对比',
          type: 'pie',
          radius: ['45%', '60%'],
          center: ['50%', '65%'],
          data: [
            { value: 300, name: '2022/12' },
            { value: 100, name: '2023/1' },
            { value: 260, name: '2023/2' },
            { value: 180, name: '2023/3' }
          ]
        }
      ]
    }
    oPie.setOption(oPieopt)

    const oColumn = echarts.init(document.getElementById('column_show'))
    const oColumnopt = {
      title: {
        text: '文章访问量',
        left: 'center',
        top: '10'
      },
      tooltip: {
        trigger: 'axis'
      },
      legend: {
        data: ['十二月', '一月', '二月', '三月'],
        top: '40'
      },
      toolbox: {
        show: true,
        feature: {
          mark: { show: true },
          dataView: { show: true, readOnly: false },
          magicType: { show: true, type: ['line', 'bar'] },
          restore: { show: true },
          saveAsImage: { show: true }
        }
      },
      calculable: true,
      xAxis: [
        {
          type: 'category',
          data: ['1月', '2月', '3月', '4月', '5月']
        }
      ],
      yAxis: [
        {
          name: '访问量',
          type: 'value'
        }
      ],
      series: [
        {
          name: '奇趣事',
          type: 'bar',
          barWidth: 20,
          areaStyle: { type: 'default' },
          itemStyle: {
            color: '#fd956a'
          },
          data: [800, 708, 920, 1090, 1200]
        },
        {
          name: '会生活',
          type: 'bar',
          barWidth: 20,
          areaStyle: { type: 'default' },
          itemStyle: {
            color: '#2bb6db'
          },
          data: [400, 468, 520, 690, 800]
        },
        {
          name: '爱旅行',
          type: 'bar',
          barWidth: 20,
          areaStyle: { type: 'default' },
          itemStyle: {
            color: '#13cfd5'
          },
          data: [500, 668, 520, 790, 900]
        },
        {
          name: '趣美味',
          type: 'bar',
          barWidth: 20,
          areaStyle: { type: 'default' },
          itemStyle: {
            color: '#00ce68'
          },
          data: [600, 508, 720, 890, 1000]
        }
      ],
      grid: {
        show: true,
        x: 50,
        x2: 30,
        y: 80,
        height: 260
      },
      dataZoom: [
        // 给x轴设置滚动条
        {
          start: 0, // 默认为0
          end: 100 - 1000 / 31, // 默认为100
          type: 'slider',
          show: true,
          xAxisIndex: [0],
          handleSize: 0, // 滑动条的 左右2个滑动条的大小
          height: 8, // 组件高度
          left: 45, // 左边的距离
          right: 50, // 右边的距离
          bottom: 26, // 右边的距离
          handleColor: '#ddd', // h滑动图标的颜色
          handleStyle: {
          borderColor: '#cacaca',
          borderWidth: '1',
          shadowBlur: 2,
          background: '#ddd',
          shadowColor: '#ddd'
          }
        }
      ]
    }
    oColumn.setOption(oColumnopt)
  }
}
</script>

<style scoped>
.spannel_list {
  margin-top: 20px;
}

.spannel {
  height: 100px;
  overflow: hidden;
  text-align: center;
  position: relative;
  background-color: #fff;
  border: 1px solid #e7e7e9;
  margin-bottom: 20px;
}
#zr_0{
  width: 100%;
}
.spannel em {
  font-style: normal;
  font-size: 50px;
  line-height: 50px;
  display: inline-block;
  margin: 10px 0 0 20px;
  font-family: 'Arial';
  color: #83a2ed;
}

.spannel span {
  font-size: 14px;
  display: inline-block;
  color: #83a2ed;
  margin-left: 10px;
}

.spannel b {
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  line-height: 24px;
  background: #e5e5e5;
  color: #333;
  font-size: 14px;
  font-weight: normal;
}

.scolor01 em,
.scolor01 span {
  color: #6ac6e2;
}

.scolor02 em,
.scolor02 span {
  color: #5fd9de;
}

.scolor03 em,
.scolor03 span {
  color: #58d88e;
}

.gragh_pannel {
  height: 350px;
  border: 1px solid #e7e7e9;
  background-color: #fff !important;
  margin-bottom: 20px;
}

.column_pannel {
  margin-bottom: 20px;
  height: 400px;
  border: 1px solid #e7e7e9;
  background-color: #fff !important;
}
</style>
