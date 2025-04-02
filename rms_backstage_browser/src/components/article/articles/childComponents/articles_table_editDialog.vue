<template>
  <el-dialog title="修改文章信息" :modelValue="isShow" width="50%" :before-close="isFalse" :close-on-click-modal="false">
    <el-form label-width="70px" :model="articleMes" :rules="rules" ref="formRef">
      <el-form-item :label="item" v-for="(item, index) in addMes" :prop="Object.keys(articleMes)[index + 1]">
        <el-input v-model="articleMes[Object.keys(articleMes)[index + 1]]" :placeholder="showMes(item)"
          :disabled="!isarticlename(item)" />
      </el-form-item>
    </el-form>
    <template v-slot:footer>
      <span class="dialog-footer">
        <el-button @click="isFalse">取 消</el-button>
        <el-button type="primary" @click="commit">确 定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script>
import { $on, $off, $once, $emit } from '@/common/gogocodeTransfer'
export default {
  name: 'articles_editDialog',
  props: {
    isShow: {
      type: Boolean,
      default: false,
    },
    articleMes: {
      type: Object,
      default() {
        return {}
      },
    },
  },
  data() {
    return {
      addMes: ['文章号', '所在楼层', '所属酒店', '所属分类', '文章描述'],
      rules: {
        //暂时不写
      },
    }
  },
  methods: {
    showMes(mes) {
      return '请输入' + mes
    },
    isFalse() {
      $emit(this, 'isFalse')
    },
    close() {
      this.$refs.formRef.resetFields()
    },
    isarticlename(item) {
      return item !== '文章名'
    },
    commit() {
      this.$refs.formRef.validate((valid) => {
        if (!valid) return
        const { id,
          article_no,
          article_floor,
          hotel,
          type_id,
          introduction, } = this.articleMes
        $emit(this, 'editarticleMes', {
          id,
          article_no,
          article_floor,
          hotel,
          type_id,
          introduction,
        })
      })
    },
  },
  emits: ['editarticleMes', 'isFalse'],
}
</script>
