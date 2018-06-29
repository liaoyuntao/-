<template>
  <div style="margin-top:20px">
  <el-table
    :default-sort="{prop: 'id', order: 'ascending'}"
    @sort-change="sort"
    :data="dataList"
    border height="500"
    v-loading="dataListLoading"
    @selection-change="selectionChangeHandle" style="width: 100%;">
    <el-table-column
      srtable="custom"
      type="selection"
      header-align="center"
      align="center"
      width="50">
    </el-table-column>
    <el-table-column v-for="item in tableFieldMap[pathUrl].tableSetList"
                     sortable="custom"
                     :prop="item.fieldName"
                     header-align="center"
                     align="center" :label="item.pageComment">
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
        <span  v-else-if="item.inputType=='4' || item.inputType=='5'"  v-text="busConfig[pathUrl+item.fieldnames].map[scope.row[item.fieldName]]" >  </span>
        <span v-else v-text="scope.row[item.fieldName]"></span>
      </template>
    </el-table-column>
    <el-table-column
      fixed="right"
      header-align="center"
      align="center"
      width="150"
      label="操作" >
      <template slot-scope="scope">
        <el-button type="text"  v-if="isAuth(model+':'+pathUrl+':save')"  size="small" @click="addOrUpdateHandle(scope.row.id)">修改
        </el-button>
        <el-button  v-if="isAuth(model+':'+pathUrl+':delete')"  type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
        <el-button  v-for="items in operation"   v-if="isAuth(model+':'+pathUrl+':'+items.scope)"  @click="items.fun(scope.row)" type="text" size="small" v-text="items.name"></el-button>
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
    <save  ref="save" :pathUrl="pathUrl" @refreshDataList="getDataList" :dataForm="saveForm"></save>
  </div>
</template>

<script>
  import API from '@/api'
  import save from '@/components/generator/save.vue'
  export default {
    name: 'tablefield',
    components: {
      save
    },
    data () {
      return {
        busConfig: this.busConfig,
        tableFieldMap: this.tableFieldMap,
        sysurl: window.SITE_CONFIG.baseUrl,
        sortData: {
          order: null,
          sidx: null
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
      }
    },
    watch: {
      dataListSelections (val) {
        console.log(val)
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
      sort (value) {
        this.sortData.sidx = value.prop
        this.sortData.order = value.order === 'descending' ? 'desc' : 'asc'
        this.getDataList()
      },
      // jsonStr (map, value) {
      //   var str = []
      //   value = JSON.parse(value)
      //   console.log(value)
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
        for (var key in this.dataForm) {
          if (this.dataForm[key]) {
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
          this.$refs.save.init(id)
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
      }
    }
  }
</script>

<style scoped>

</style>
