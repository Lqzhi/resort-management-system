<template>
  <div class="toshow">
  <h2 class="wel">欢迎来到温泉度假村管理系统</h2>
</div>
</template>

<script>
export default {
  name: 'Welcome',
  data() {
    return {
      // user:JSON.parse( window.sessionStorage.getItem('token')),
      user:window.sessionStorage.getItem('token')
    }
  },
  
  mounted(){
  }
}
</script>
<style scoped>
 .toshow {
      margin-top: 200px;
      text-align: center;
      filter: contrast(10);
    }
    .wel{
      font-size: 90px;
      color: #2b4b6b;
      animation: showup 2s forwards ;
    }
  
    @keyframes showup {
      from{
        filter:blur(30px);
        letter-spacing: -90px;
      }
      to{
        filter:blur(0);
        letter-spacing: 0;
      }
    }


    
 
</style>