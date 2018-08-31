<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" style="margin-bottom:60px;">
      <seek ref="seek" :dataForm.sync="dataForm" :pathUrl="pathUrl"></seek>
      <div style="float:right">
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </div>
    </el-form>
    <tablefield :pathUrl="pathUrl" :saveForm="saveForm"  ref="tablefield" :dataForm.sync="dataForm"  :setListSelections="setListSelections"  :model="model" :operation.sync="operation"></tablefield>
  </div>
</template>

<script>
  import seek from '@/components/generator/seek.vue'
  import tablefield from '@/components/generator/tablefield.vue'
  export default {
    components: {
      seek,
      tablefield
    },
    data () {
      return {
        model: 'job',
        pathUrl: 'schedulejoblog',
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
          dataKey: '',
          value: '',
          status: '',
          remarks: '',
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
      init () {
        this.getDataList()
      },
      deleteHandle () {
        this.$nextTick(() => {
          this.$refs.tablefield.deleteHandle()
        })
      },
      addOrUpdateHandle () {
        this.$nextTick(() => {
          this.$refs.tablefield.addOrUpdateHandle()
        })
      },
      setListSelections (val) {
        this.dataListSelections = val
      },
      getDataList () {
        this.$nextTick(() => {
          this.$refs.tablefield.getDataList()
        })
      }
    }
  }
</script>
