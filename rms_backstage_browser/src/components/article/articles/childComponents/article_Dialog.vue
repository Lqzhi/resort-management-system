<template>
  <div><!-- 添加文章的全屏的对话框 start-->
    <el-dialog
      title="发布文章"
      :visible.sync="dialogVisible"
      :before-close="handleClose"
      fullscreen
    >
      <!-- 👆 上面这个属性是控制 弹框是否为全屏 -->

      <!-- 添加的表单 start -->
      <el-form label-width="80px" :model="addData" :rules="rules" ref="addForm">
        <!-- 第一行：文章标题 -->
        <el-form-item label="文章标题" prop="title">
          <el-input v-model="addData.title" placeholder="请输入标题"></el-input>
        </el-form-item>
        <!-- 第二行：选择分类 -->
        <el-form-item label="选择分类" prop="cate_id">
          <el-select placeholder="请选择分类" style="width: 100%" v-model="addData.cate_id">
            <!-- 获取数据 成功  循环到下拉框里  因为 数据 都是 动态属性  所以表达式前边记得加：-->
            <el-option
              v-for="item in cateList"
              :key="item.id"
              :label="item.cate_name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <!-- 第三行：文章内容 -->
        <el-form-item label="文章内容">
          <!-- 富文本编辑器 -->
          <quill-editor v-model="addData.content"></quill-editor>
        </el-form-item>
        <!-- 第四行：文章封面 -->
        <el-form-item label="文章封面">
          <div>
            <img :src="imgUrl" class="cover-img" alt="" v-if="imgUrl" />
            <img src="@/assets/images/cover.jpg" class="cover-img" alt="" v-else />
          </div>
          <input type="file" ref="fileRef" @change="chooseImg" style="display: none" />
          <el-button type="text" @click="$refs.fileRef.click()">选择图片</el-button>
        </el-form-item>
        <!-- 第五行 按钮 -->
        <el-form-item>
          <el-button type="primary" @click="publish('已发布')">发布</el-button>
          <el-button type="info" @click="publish('草稿')">存为草稿</el-button>
        </el-form-item>
      </el-form>
      <!-- 添加的表单 end -->
    </el-dialog></div>
</template>

<script>
export default {
  name: '',
  
}

</script>
<style scoped>
</style>