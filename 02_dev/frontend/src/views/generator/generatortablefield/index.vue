<template>
  <div class="mod-config">
   <!-- <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" style="margin-bottom:60px;">
      <seek ref="seek" :dataForm.sync="dataForm" :pathUrl="pathUrl"></seek>
      <div style="float:right">
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addAllOrUpdateHandle()">批量新增</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
        <el-button  type="danger" @click="hideTableField()" :disabled="dataListSelections.length <= 0">隐藏表格字段</el-button>
        <el-button  type="danger" @click="hideSetField()" :disabled="dataListSelections.length <= 0">隐藏修改字段</el-button>
        <el-button  type="danger" @click="showSeekField()" :disabled="dataListSelections.length <= 0">显示搜索字段</el-button>
        <el-button  type="danger" @click="showExportField()" :disabled="dataListSelections.length <= 0">显示导出字段</el-button>
      </div>
    </el-form>-->
    <tablefield :pathUrl="pathUrl" ref="tablefield" :formButton="formButton"  :saveForm="saveForm"  :dataForm.sync="dataForm"  :model="model" :operation.sync="operation" :setListSelections="setListSelections"></tablefield>
  </div>
</template>

<script>
  import API from '@/api'
  import tablefield from '@/components/generator/tablefield.vue'
  export default {
    components: {
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
        operation: [
          {type:"primary",'scope': 'save', fun: this.addOrUpdateHandle, name: '修改',disabled:function(row){
              return false;
            }},
          {type:"danger",'scope': 'delete', fun: this.deleteHandle, name: '删除',disabled:function(row){
              return false;
            }},
        ],
        //表格按钮
        formButton:[
          {type:"primary",'scope': 'save', fun: this.addOrUpdateHandle, name: '新增',},
          {type:"primary",'scope': 'delete', fun: this.addAllOrUpdateHandle, name: '批量新增',},
          {type:"danger",'scope': 'delete', fun: this.deleteHandle, name: '批量删除',disabled:function(dataListSelections){
              return dataListSelections.length<=0;
            }}
        ],
        saveForm: {

        }
      }
    },
    activated () {
      this.getDataList()
    },
    methods: {
      addAllOrUpdateHandle () {
        this.$nextTick(() => {
          this.$refs.tablefield.addAllOrUpdateHandle()
        })
      },
      init: function (id) {
        console.log(id);
        this.dataForm.tableId = id
        this.saveForm.tableId = id
        this.getDataList()
      },  // 多选
      getDataList () {
        this.$nextTick(() => {
          this.$refs.tablefield.getDataList()
        })
      },
      addOrUpdateHandle (row) {
        this.$nextTick(() => {
          this.$refs.tablefield.addOrUpdateHandle(row)
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
        //console.log(scope)
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
