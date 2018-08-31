<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" style="padding-bottom:70px;">
      <seek ref="seek" :dataForm.sync="dataForm" :pathUrl="pathUrl"></seek>
      <div style="float:right">
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
        <el-button type="primary" @click="configHandle()">云存储配置</el-button>
        <el-button type="primary" @click="uploadHandle()">上传文件</el-button>
      </div>
    </el-form>
    <tablefield :pathUrl="pathUrl" ref="tablefield" :saveForm="saveForm" :dataForm.sync="dataForm"  :setListSelections="setListSelections"  :model="model" :operation.sync="operation"></tablefield>
    <!-- 弹窗, 云存储配置 -->
    <config v-if="configVisible" ref="config"></config>
    <!-- 弹窗, 上传文件 -->
    <upload v-if="uploadVisible" ref="upload" @refreshDataList="getDataList"></upload>
  </div>
</template>

<script>
  import seek from '@/components/generator/seek.vue'
  import tablefield from '@/components/generator/tablefield.vue'
  import Config from './config'
  import Upload from './upload'
  export default {
    components: {
      seek,
      tablefield,
      Config,
      Upload
    },
    data () {
      return {
        uploadVisible: false,
        configVisible: false,
        model: 'oss',
        pathUrl: 'sysoss',
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
      getDataList () {
        this.$nextTick(() => {
          this.$refs.tablefield.getDataList()
        })
      },
      configHandle () {
        this.configVisible = true
        this.$nextTick(() => {
          this.$refs.config.init()
        })
      },
      // 上传文件
      uploadHandle () {
        this.uploadVisible = true
        this.$nextTick(() => {
          this.$refs.upload.init()
        })
      }
    }
  }
</script>
