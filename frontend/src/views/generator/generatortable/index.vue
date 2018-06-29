<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" style="margin-bottom:60px;">
      <seek ref="seek" :dataForm.sync="dataForm" :pathUrl="pathUrl"></seek>
      <div style="float:right">
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
        <el-button  type="primary" @click="generate()" :disabled="dataListSelections.length <= 0">生成</el-button>
      </div>
    </el-form>
    <tablefield :pathUrl="pathUrl" ref="tablefield" :saveForm="saveForm":dataForm.sync="dataForm"  :setListSelections="setListSelections"  :model="model" :operation.sync="operation"></tablefield>
    <el-dialog title="字段列表"  :visible.sync="generatortablefield" :modal="false" width="75%"  >
      <generatortablefield v-if="generatortablefield" ref="generatortablefield" @refreshDataList="getDataList"></generatortablefield>
    </el-dialog>
    <el-dialog title="模板预览"  :visible.sync="preview" :modal="false" width="75%"  >
      <preview v-if="preview" ref="preview" @refreshDataList="getDataList"></preview>
    </el-dialog>
  </div>
</template>

<script>
  import API from '@/api'
  import seek from '@/components/generator/seek.vue'
  import generatortablefield from '../generatortablefield/index'
  import preview from './preview/preview'
  import tablefield from '@/components/generator/tablefield.vue'
  export default {
    components: {
      seek,
      tablefield,
      generatortablefield,
      preview
    },
    data () {
      return {
        dataForm: {
        },
        model: 'generator',
        pathUrl: 'generatortable',
        dataListSelections: [],
        generatortablefield: false,
        preview: false,
        // 操作按钮
        operation: [
          {'scope': 'delete', fun: this.queryField, name: '字段列表'},
          {'scope': 'delete', fun: this.queryPreviw, name: '模板预览'}
        ],
        saveForm: {
          id: 0,
          remarks: '',
          tableComment: '',
          modulesId: '',
          tableName: '',
          versionNo: '',
          createBy: '',
          createTime: '',
          updateBy: '',
          updateTime: '',
          deleteFlag: '',
          sort: ''
        }
      }
    },
    activated () {
      this.getDataList()
    },
    methods: {
      addOrUpdateHandle () {
        this.$nextTick(() => {
          this.$refs.tablefield.addOrUpdateHandle()
        })
      },
      deleteHandle () {
        this.$nextTick(() => {
          this.$refs.tablefield.deleteHandle()
        })
      },
      setListSelections (val) {
        this.dataListSelections = val
      },
      init: function (id) {
        this.dataForm.tableId = id
        this.getDataList()
      },  // 多选
      getDataList () {
        this.$nextTick(() => {
          this.$refs.tablefield.getDataList()
        })
      },
      // 生成
      generate (id) {
        var self = this
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '生成' : '批量生成'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          location.href =window.SITE_CONFIG.baseUrl+ '/generator/generatortable/generate?ids=' + JSON.stringify(ids)
          // API.generatortable.generator(ids).then(({data}) => {
          //   if (data && data.code === 0) {
          //     this.$message({
          //       message: '操作成功',
          //       type: 'success',
          //       duration: 1500,
          //       onClose: () => {
          //         this.getDataList()
          //       }
          //     })
          //   } else {
          //     this.$message.error(data.msg)
          //   }
          // })
        })
      },
      // 查看字段
      queryField (scope) {
        this.generatortablefield = true
        this.$nextTick(() => {
          this.$refs.generatortablefield.init(scope.id)
        })
      },
      // 模板预览
      queryPreviw (scope) {
        this.preview = true
        this.$nextTick(() => {
          this.$refs.preview.init(scope.id)
        })
      }
    }
  }
</script>
