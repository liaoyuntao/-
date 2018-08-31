<template>
  <div style="margin-top:20px">
  <el-table
    :default-sort="{prop: 'createTime', order: 'descending'}"
    @sort-change="sort"
    :data="dataList"
    border height="500"
    size="mini"
    v-loading="dataListLoading"
    @selection-change="selectionChangeHandle"
    style="width: 100%;">
    <el-table-column
      srtable="custom"
      type="selection"
      header-align="center"
      align="center"
      width="50">
    </el-table-column>
    <template v-for="item in tableFieldMap[pathUrl].tableSetList">
      <table-tree-column  v-if="item.fieldName===tableFieldMap[pathUrl].treeFieldName"
                          :prop="item.fieldName"
                         header-align="center"
                         :pathUrl="pathUrl"
                         :treeKey="tableFieldMap[pathUrl].treeKey"
                         :label="item.pageComment" :parentKey="tableFieldMap[pathUrl].parentKey"  :levelKey="tableFieldMap[pathUrl].levelKey">
      </table-tree-column>
      <el-table-column
                       sortable="custom"
                       :prop="item.fieldName"
                       header-align="center"
                       align="center" :label="item.pageComment" height="10" v-else>
        <template slot-scope="scope">
          <!--日期date-->
          <span v-if="item.inputType==='2'" v-text="scope.row[item.fieldName]"></span>
          <!-- 时间datetime-->
          <span v-else-if="item.inputType==='3'" v-text="scope.row[item.fieldName]"></span>
          <!--上传图片-->
          <span v-else-if="item.inputType==='8'">
                      <img :src="scope.row[item.fieldName]" style="width:50px;height:50px;">
        </span>
          <!--下拉选selec-->
          <!-- <span  v-else-if="item.inputType=='5' "  v-text="jsonStr(busConfig[pathUrl+item.fieldnames].map,scope.row[item.fieldName])" >  </span>-->
          <span  v-else-if="item.inputType=='4' "   >
        <el-tag v-text="getBusConfig(item.dictionaryIndex).map[scope.row[item.fieldName]]" v-if="scope.row[item.fieldName]!=null" ></el-tag>
        </span>
          <!--复选框-->
          <span  v-else-if=" item.inputType=='5'" >
         <el-tag v-text="selectText(getBusConfig(item.dictionaryIndex).map,scope.row[item.fieldName])"   ></el-tag>
        </span>
          <span  v-else-if=" item.inputType=='11'" >
         <el-tag v-text="selectText(addressMap,scope.row[item.fieldName])" v-if="item.fieldName!=null"></el-tag>
        </span>
          <span v-else v-text="scope.row[item.fieldName]"></span>
        </template>
      </el-table-column>

    </template>
    <el-table-column
      fixed="right"
      header-align="center"
      align="center"
      width="300"
      label="操作" >
      <template slot-scope="scope">
        <el-button type="primary" plain  v-if="isAuth(model+':'+pathUrl+':save') && updateFunction==null"  size="small" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
        <el-button type="primary" plain   v-if="isAuth(model+':'+pathUrl+':save') && updateFunction!=null"  size="small" @click="updateFunction(scope.row.id)">修改</el-button>
         <el-button type="primary" plain   v-if="isAuth(model+':'+pathUrl+':save') && viewFunction!=null"  size="small" @click="viewFunction(scope.row.table_name)">查看</el-button>
        <el-button   v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" plain size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
        <el-button type="primary" plain  v-for="items in operation"   v-if="isAuth(model+':'+pathUrl+':'+items.scope)"  @click="items.fun(scope.row)" size="small" v-text="items.name"></el-button>
      </template>
    </el-table-column>

  </el-table>
  <el-pagination
    @size-change="sizeChangeHandle"
    @current-change="currentChangeHandle"
    :current-page="pageIndex"
    :page-sizes="[10, 20, 50, 100]"
    :page-size="pageSize"
    :total="totalPage"
    layout="total, sizes, prev, pager, next, jumper">
  </el-pagination>
    <!-- 弹窗, 新增 / 修改 -->
    <save  ref="save" :pathUrl="pathUrl" @refreshDataList="getDataList"  :updateFunction="updateFunction"></save>
    <!--批量新增-->
    <saveall ref="saveall" :pathUrl="pathUrl" :visible.sync="saveall" @refreshDataList="getDataList"></saveall>
  </div>
</template>

<script>
  import API from '@/api'
  import save from '@/components/generator/save.vue'
  import saveall from '@/components/generator/saveall.vue'
  import TableTreeColumn from '@/components/table-tree-column/index1'
  export default {
    name: 'tablefield',
    components: {
      save,
      saveall,
      TableTreeColumn
    },
    data () {
      return {
        addressMap:this.addressMap,
        saveall:false,
        busConfig: this.busConfig,
        tableFieldMap: this.tableFieldMap,
        sysurl: window.SITE_CONFIG.baseUrl,
        sortData: {
          order: undefined,
          sidx: undefined
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 20,
        totalPage: 0,
        dataListLoading: false,
        addOrUpdateVisible: false,
        dataListSelections: []
      }
    },
    props: {
      dataForm: {
        type: Object,
        default: function () {
          return {}
        }
      },
      pathUrl: {
        type: String
      },
      templateHtml: {
        type: String
      },
      model: {
        type: String
      },
      operation: {
        type: Array,
        default: function () {
          return []
        }
      },
      setListSelections: {
        type: Function
      },
      saveForm: {
        type: Object
      },
      updateFunction:{
        type : Function
      },
      viewFunction:{
      	type : Function
      }
    },
    watch: {
      dataListSelections (val) {
        //////console.log(val)
        this.setListSelections(val)
      }
    },
    activated () {
      // for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {
      //   var cou = this.tableFieldMap[this.pathUrl].columns[i]
      //   this.saveForm[cou.fieldName] = ''
      // // 多图像上传兼容
      // }
    },
    methods: {
      selectText(map,val){
        var list = [];
        var vals=JSON.parse(val)
        for(var i in vals){
          var item =vals[i];
          list.push(map[item])
        }
        //console.log(list);
        return list.join();
      },
      sort (value) {
        this.sortData.sidx = value.prop
        this.sortData.order = value.order === 'descending' ? 'desc' : 'asc'
        this.getDataList()
      },
      // jsonStr (map, value) {
      //   var str = []
      //   value = JSON.parse(value)
      //   //console.log(value)
      //   for (var i in value) {
      //     str.push(map[value[i]])
      //   }
      //   return JSON.stringify(str)
      // },
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        var params = {
          page: this.pageIndex,
          limit: this.pageSize,
          sidx: this.sortData.sidx,
          order: this.sortData.order
        }
        if(this.tableFieldMap[this.pathUrl].parentKey!=null){
          params[this.tableFieldMap[this.pathUrl].parentKey]=0;
        }
        for (var key in this.dataForm) {
          if (this.dataForm[key]!=null) {
            if (this.dataForm[key] instanceof Array) {
              params[key] = JSON.stringify(this.dataForm[key])
            } else {
              params[key] = this.dataForm[key]
            }
          }
        }
        API[this.pathUrl].list(params).then(({data}) => {
          if (data && data.code === 0) {
            this.dataList = data.data.list
            this.totalPage = data.data.totalCount
            if (data.data.totalPage < this.pageIndex && data.data.totalPage !== 0) {
              this.pageIndex = 1
              this.getDataList()
            }
          } else {
            this.dataList = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
      },
      // 每页数
      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      // 当前页
      currentChangeHandle (val) {
        this.pageIndex = val
        this.getDataList()
      },
      // 多选
      selectionChangeHandle (val) {
        this.dataListSelections = val
      },
      // 新增 / 修改
      addOrUpdateHandle (id) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.save.init(id,this.dataForm)
        })
      },
      // 删除
      deleteHandle (id) {
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          API[this.pathUrl].del(ids).then(({data}) => {
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
      // 批量新增
      addAllOrUpdateHandle () {
        this.saveall = true
        this.$nextTick(() => {
          this.$refs.saveall.init(null,this.dataForm)
        })
      },
    }
  }
</script>

<style scoped>

</style>
