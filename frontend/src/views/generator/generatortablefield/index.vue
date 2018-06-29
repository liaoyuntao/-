<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" style="margin-bottom:60px;">
      <seek ref="seek" :dataForm.sync="dataForm" :pathUrl="pathUrl"></seek>
      <div style="float:right">
      <el-button @click="getDataList()">查询</el-button>
      <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
      <el-button v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      <el-button  type="danger" @click="hideTableField()" :disabled="dataListSelections.length <= 0">隐藏表格字段</el-button>
      <el-button  type="danger" @click="hideSetField()" :disabled="dataListSelections.length <= 0">隐藏修改字段</el-button>
      <el-button  type="danger" @click="showSeekField()" :disabled="dataListSelections.length <= 0">显示搜索字段</el-button>
      <el-button  type="danger" @click="showExportField()" :disabled="dataListSelections.length <= 0">显示导出字段</el-button>
      </div>
    </el-form>
    <tablefield :pathUrl="pathUrl" ref="tablefield" :dataForm.sync="dataForm" :saveForm="saveForm"   :model="model" :operation.sync="operation" :setListSelections="setListSelections"></tablefield>
  </div>
</template>

<script>
  import API from '@/api'
  import seek from '@/components/generator/seek.vue'
  import tablefield from '@/components/generator/tablefield.vue'
  export default {
    components: {
      seek,
      tablefield
    },
    data: function () {
      return {
        model: 'generator',
        pathUrl: 'generatortablefield',
        busConfig: this.busConfig,
        tableFieldMap: this.tableFieldMap,
        sysurl: window.SITE_CONFIG.baseUrl,
        dataForm: {},
        dataListSelections: [],
        // 操作按钮
        operation: [
          // {'scope': 'delete', fun: this.hideTableField, name: '显示所有字段'}
        ],
        saveForm: {
          id: 0,
          tableId: '',
          fieldName: '',
          fieldType: '',
          isNull: '',
          isSeek: '',
          checkout: '',
          isExport: '',
          pageComment: '',
          comment: '',
          tableSet: '',
          isDataBase: '',
          isSet: '',
          inputType: '',
          dataDefault: '',
          columnKey: '',
          versionNo: '',
          createBy: '',
          createTime: '',
          updateBy: '',
          updateTime: '',
          deleteFlag: '',
          sort: '',
          remarks: ''
        }
      }
    },
    activated () {
      this.getDataList()
    },
    methods: {
      init: function (id) {
        this.dataForm.tableId = id

        this.saveForm.tableId = id
        console.log(this.saveForm.tableId)
        this.getDataList()
      },  // 多选
      getDataList () {
        this.$nextTick(() => {
          this.$refs.tablefield.getDataList()
        })
      },
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
      },    // 多选
      hideTableField (scope) {
        console.log(scope)
        var ids = scope ? [scope] : this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${scope ? '隐藏' : '批量隐藏'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          API.generatortablefield.hideTableField(ids).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.getDataList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        })
      },
      hideSetField (scope) {
        var ids = scope ? [scope] : this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${scope ? '隐藏' : '批量隐藏'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          API.generatortablefield.hideSetField(ids).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.getDataList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        })
      },
      showSeekField (scope) {
        var ids = scope ? [scope] : this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${scope ? '隐藏' : '批量显示'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          API.generatortablefield.showSeekField(ids).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.getDataList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        })
      },
      showExportField (scope) {
        var ids = scope ? [scope] : this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${scope ? '隐藏' : '批量显示'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          API.generatortablefield.showExportField(ids).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.getDataList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        })
      }
    }
  }
</script>
