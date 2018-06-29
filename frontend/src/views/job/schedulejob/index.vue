<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" style="margin-bottom:60px;">
      <seek ref="seek" :dataForm.sync="dataForm" :pathUrl="pathUrl"></seek>
      <div style="float:right">
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
        <el-button v-if="isAuth('job:schedulejob:pause')" type="danger" @click="pauseHandle()" :disabled="dataListSelections.length <= 0">批量暂停</el-button>
        <el-button v-if="isAuth('job:schedulejob:resume')" type="danger" @click="resumeHandle()" :disabled="dataListSelections.length <= 0">批量恢复</el-button>
        <el-button v-if="isAuth('job:schedulejob:run')" type="danger" @click="runHandle()" :disabled="dataListSelections.length <= 0">批量立即执行</el-button>
        <el-button type="success" @click="logHandle()" >日志列表</el-button>
      </div>
    </el-form>
    <tablefield :pathUrl="pathUrl" :saveForm="saveForm" ref="tablefield" :dataForm.sync="dataForm"  :setListSelections="setListSelections"  :model="model" :operation.sync="operation"></tablefield>
    <!-- 弹窗, 日志列表 -->
    <el-dialog title="日志列表"  :visible.sync="schedulejoblog"  width="75%"   :modal="false" >
      <schedulejoblog v-if="schedulejoblog" ref="schedulejoblog" @refreshDataList="getDataList"></schedulejoblog>
    </el-dialog>


  </div>
</template>

<script>
  import seek from '@/components/generator/seek.vue'
  import tablefield from '@/components/generator/tablefield.vue'
  import schedulejoblog from '../schedulejoblog/index'
  export default {
    components: {
      seek,
      tablefield,
      schedulejoblog
    },
    data () {
      return {
        model: 'job',
        pathUrl: 'schedulejob',
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
          url: '',
          remarks: '',
          versionNo: '',
          createBy: '',
          createTime: '',
          updateBy: '',
          updateTime: '',
          deleteFlag: '',
          sort: '',
        },
        schedulejoblog: false
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
      getDataList () {
        this.$nextTick(() => {
          this.$refs.tablefield.getDataList()
        })
      },
      // 暂停
      pauseHandle (id) {
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.jobId
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '暂停' : '批量暂停'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          API.schedulejob.pause(ids).then(({data}) => {
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
      // 恢复
      resumeHandle (id) {
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.jobId
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '恢复' : '批量恢复'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          API.schedulejob.resume(ids).then(({data}) => {
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
      // 立即执行
      runHandle (id) {
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.jobId
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '立即执行' : '批量立即执行'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          API.schedulejob.run(ids).then(({data}) => {
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
      // 日志列表
      logHandle () {
        this.schedulejoblog = true
        this.$nextTick(() => {
          this.$refs.schedulejoblog.init()
        })
      }
    }
  }
</script>
