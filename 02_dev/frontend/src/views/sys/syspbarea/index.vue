<template>
  <div class="mod-config">
   <!-- <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()" style="margin-bottom:60px;">
      <seek ref="seek" :dataForm.sync="dataForm" :pathUrl="pathUrl"></seek>
      <div style="float:right">
        <el-button @click="getDataList()">查询</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':save')" type="primary" @click="addAllOrUpdateHandle()">批量新增</el-button>
        <el-button v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </div>
    </el-form>-->
    <tablefield :pathUrl="pathUrl" ref="tablefield" :formButton="formButton" :dataForm.sync="dataForm"  :setListSelections="setListSelections" :saveForm="saveForm" :model="model" :operation.sync="operation"></tablefield>
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
        model: 'sys',
        pathUrl: 'syspbarea',
        busConfig: this.busConfig,
        tableFieldMap: this.tableFieldMap,
        sysurl: window.SITE_CONFIG.baseUrl,
        dataForm: {
        //'  parentid:0
        },
        dataListSelections: [],
        // 操作按钮
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
          {type:"primary",'scope': 'save', fun: this.addAllOrUpdateHandle, name: '批量新增',},
          {type:"danger",'scope': 'delete', fun: this.deleteHandle, name: '批量删除',disabled:function(dataListSelections){
              return dataListSelections.length<=0;
            }},
        ],
        saveForm: {
          deleteFlag: '',
          id: 0,
          areaname: '',
          parentid: '',
          lng: '',
          lat: '',
          level: '',
          createTime: '',
          remarks: '',
          sort: '',
          versionNo: '',
          createBy: '',
          updateBy: '',
          updateTime: '',
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
      },
      getDataList () {
        this.$nextTick(() => {
          this.$refs.tablefield.getDataList()
        })
      }
    }
  }
</script>
