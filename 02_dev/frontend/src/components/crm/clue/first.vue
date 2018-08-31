<template>

  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" style="margin-bottom:60px;" >
      <seek ref="seek" :dataForm.sync="dataForm" :pathUrl="pathUrl"></seek>
      <div style="float:right">
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </div>
    </el-form>
    <tablefield :pathUrl="pathUrl" ref="tablefield" :dataForm.sync="dataForm"  :setListSelections="setListSelections" :saveForm="saveForm" :model="model" :operation.sync="operation"></tablefield>
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
        model: 'crm',
        pathUrl: 'crmmarketclue',
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
          name: '',
          company: '',
          mobile: '',
          phone: '',
          location: '',
          state: '',
          belonger: '',
          remarks: '',
          versionNo: '',
          createBy: '',
          createTime: '',
          updateBy: '',
          updateTime: '',
          deleteFlag: '',
          sort: '',
          clueDitch: '',
          clientId: '',
        },
        value1: '',
        value2:'',
      }
    },
    mounted () {
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
          // debugger
          this.$refs.tablefield.getDataList()
        })

      }
    }
  }
</script>
