<template>
  <div style="margin-top:20px">
    <el-form :inline="true"  @keyup.enter.native="getDataList()" style="margin-bottom:60px;">
      <seek ref="seek" @updateSeekForm="updateSeekForm" :tableFieldMap="tableFieldMap" :busConfig="busConfig" :pathUrl="pathUrl" :model="model"></seek>
      <div style="float:right">
        <el-button type="primary" @click="getDataList()" size="small">查询</el-button>
        <el-button :type="items.type" plain v-for="items in formButton" v-if="isAuth(model+':'+pathUrl+':'+items.scope)"
                   :disabled="items.disabled!=undefined&&items.disabled(dataListSelections)" @click="items.fun()"
                   size="small" v-text="items.name"></el-button>
      </div>
    </el-form>
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
      <template v-for="item in tableFieldMap.columns" v-if="item.tableSet=='0'">
        <table-tree-column v-if="item.fieldName===tableFieldMap.treeFieldName"
                           :prop="item.fieldName"
                           header-align="center"
                           :pathUrl="pathUrl"
                           :treeKey="tableFieldMap.treeKey"
                           :label="item.pageComment" :parentKey="tableFieldMap.parentKey"
                           :levelKey="tableFieldMap.levelKey">
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
            <span v-else-if="item.inputType==='8'"><img :src="oneImg(scope.row[item.fieldName])" @click="handlePictureCardPreview(oneImg(scope.row[item.fieldName]))"style="width:50px;height:50px;">
        </span>
            <!--下拉选selec-->
            <span v-else-if="item.inputType=='4' "
                  v-text="getBusConfig(model+pathUrl,item.dictionaryIndex).map[scope.row[item.fieldName]]">
        </span>
            <!--复选框-->
            <span v-else-if=" item.inputType=='5'"
                  v-text="selectText(getBusConfig(model+pathUrl,item.dictionaryIndex).map,scope.row[item.fieldName])">
        </span>
            <span v-else-if=" item.inputType=='11'" v-text="addJsonText(scope.row[item.fieldName])">
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
        label="操作">
        <template slot-scope="scope">
          <!--<el-button type="primary" plain  v-if="isAuth(model+':'+pathUrl+':save') && updateFunction==null"  size="small" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
          <el-button type="primary" plain   v-if="isAuth(model+':'+pathUrl+':save') && updateFunction!=null"  size="small" @click="updateFunction(scope.row.id)">修改</el-button>
           <el-button type="primary" plain   v-if="isAuth(model+':'+pathUrl+':save') && viewFunction!=null"  size="small" @click="viewFunction(scope.row.table_name)">查看</el-button>
          <el-button   v-if="isAuth(model+':'+pathUrl+':delete')" type="danger" plain size="small" @click="deleteHandle(scope.row.id)">删除</el-button>-->
          <el-button :type="items.type" plain v-for="items in operation"
                     v-if="isAuth(model+':'+pathUrl+':'+items.scope)"
                     :disabled="items.disabled!=undefined&&items.disabled(scope.row)" @click="items.fun(scope.row)"
                     size="small" v-text="items.name"></el-button>
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
    <save ref="save" :pathUrl="pathUrl"  :model="model" @refreshDataList="getDataList" :tableFieldMap="tableFieldMap" ></save>
    <!--批量新增-->
    <saveall ref="saveall" :optionsMap="optionsMap"  :model="model" :pathUrl="pathUrl" :dataForm="dataForm"  @refreshDataList="getDataList" :tableFieldMap="tableFieldMap" ></saveall>
    <!--预览图片-->
    <el-dialog :visible.sync="prewImgLoad" :modal="false">
      <img width="100%" :src="prewImg" alt="">
    </el-dialog>
  </div>
</template>

<script>
  import API from '@/api'
  import {getAddress, queryAddressById} from '@/utils'
  import seek from '@/components/generator/seek.vue'
  import save from '@/components/generator/save.vue'
  import saveall from '@/components/generator/saveall.vue'
  import TableTreeColumn from '@/components/table-tree-column/index1'
  import $ from 'jquery'
  import requestUrl from '@/api/requestUrl'
  export default {
    name: 'tablefield',
    components: {
      save,
      saveall,
      seek,
      TableTreeColumn,
    },
    data() {
      return {
        seekForm:{},
       // dataForm:{},
        options2: getAddress(0,4),
        optionsMap: {},
        saveall: false,
        busConfig: {},
        tableFieldMap: {},
        sysurl: window.SITE_CONFIG.baseUrl,
        sortData: {
          order: undefined,
          sidx: undefined
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        addOrUpdateVisible: false,
        dataListSelections: [],
        prewImgLoad: false,
        prewImg: null,
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
      model: {
        type: String
      },
      templateHtml: {
        type: String
      },
      //操作按钮
      operation: {
        type: Array,
        default: function () {
          return []
        }
      },
      //表格按钮
      formButton: {
        type: Array,
        default: function () {
          return []
        }
      },
      setListSelections: {
        type: Function
      },
      updateFunction: {
        type: Function
      },
      viewFunction: {
        type: Function
      }
    },
    watch: {
      dataListSelections(val) {
        this.setListSelections(val)
      }
    },
    created() {
      var that = this;
      var getCookie = function (name) {
        var strcookie = document.cookie// 获取cookie字符串
        var arrcookie = strcookie.split('; ')// 分割
// 遍历匹配
        for (var i = 0; i < arrcookie.length; i++) {
          var arr = arrcookie[i].split('=')
          if (arr[0] === name) {
            return arr[1]
          }
        }
        return ''
      }
      $.ajax({
        url: requestUrl('/generator/generatortable/queryTabeConfig'),
        type: 'get', // GET
        data: {module: this.model + this.pathUrl},
        async: false, // 或false,是否异步
        beforeSend: function (request) {
          request.setRequestHeader('token', getCookie('token'))
        },
        //timeout: 5000, // 超时时间
        dataType: 'json', // 返回的数据格式：
        success: function (data, textStatus, jqXHR) {
          that.tableFieldMap = data.data;
        }
      })
      for (var i in this.options2) {
        var item = this.options2[i];
        this.optionsMap[item.id] = item;
      }
    },
    methods: {
      // 预览多图片事件
      handlePictureCardPreview: function (url) {
        this.prewImgLoad = true
        this.prewImg = url
      },
      oneImg(val){
       return val;
      },
      setSeekForm(seekForm){
        this.seekForm=seekForm;
        this.$nextTick(() => {
          this.$refs.seek.setValue(seekForm)
        })
      },
      updateSeekForm(seekForm) {
        this.seekForm = seekForm;
      },
      addJsonText(val) {
        if (val == null) {
          return '';
        }
        var str = "";
        var list = JSON.parse(val);
        if (list[0] != null) {
          var item = list[0];
          var obj = this.optionsMap[item];
          if(obj!=null &&obj.isNext!='0' && obj.children.length==0){
            var children = getAddress(item);
            for (var j = 0; j < children.length; j++) {
              var item1 = children[j];
              this.optionsMap[item1.id] = item1;
            }
            obj.children = children
          }
          str += " " + obj.areaname;
        }
        if (list[1] != null) {
          var item = list[1];
          var obj = this.optionsMap[item];
          if(obj!=null &&obj.isNext!='0' && obj.children.length==0){
            var children = getAddress(item);
            for (var j = 0; j < children.length; j++) {
              var item1 = children[j];
              this.optionsMap[item1.id] = item1;
            }
            obj.children = children
          }
            str += " " + obj.areaname;
        }
        if (list[2] != null) {
          var item = list[2];
          var obj = this.optionsMap[item];
          if(obj!=null &&obj.isNext!='0' && obj.children.length==0){
            var children = getAddress(item);
            for (var j = 0; j < children.length; j++) {
              var item1 = children[j];
              this.optionsMap[item1.id] = item1;
            }
            obj.children = children
          }
            str += " " + obj.areaname;
        }
        if (list[3] != null) {
          var item = list[3];
          var obj = this.optionsMap[item];
          if(obj!=null && obj.isNext!='0' && obj.children.length==0){
            var children = getAddress(item);
            for (var j = 0; j < children.length; j++) {
              var item1 = children[j];
              this.optionsMap[item1.id] = item1;
            }
            obj.children = children
          }
            str += " " + obj.areaname;
        }

        return str;
      },
      selectText(map, val) {
        if (val == null) {
          return '';
        }
        var list = [];
        var vals = JSON.parse(val)
        for (var i in vals) {
          var item = vals[i];
          list.push(map[item])
        }
        //console.log(list);
        return list.join();
      },
      sort(value) {
        this.sortData.sidx = value.prop
        this.sortData.order = value.order === 'descending' ? 'desc' : 'asc'
        this.getDataList()
      },
      // 获取数据列表
      getDataList() {
        //默认拥有数据
        this.dataListLoading = true
        //查询默认分页参数
        var params = {
          page: this.pageIndex,
          limit: this.pageSize,
          sidx: this.sortData.sidx,
          order: this.sortData.order
        }
        //判断是否树形表格
        if (this.tableFieldMap.parentKey != null) {
          params[this.tableFieldMap.parentKey] = 0;
        }
        //判断是否有表格筛选条件
        for (var key in this.seekForm) {
          if (this.seekForm[key] != null) {
            if (this.seekForm[key] instanceof Array) {
              params[key] = JSON.stringify(this.seekForm[key])
            } else {
              params[key] = this.seekForm[key]
            }
          }
        }
        //发起表格请求
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
      sizeChangeHandle(val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      // 当前页
      currentChangeHandle(val) {
        this.pageIndex = val
        this.getDataList()
      },
      // 多选
      selectionChangeHandle(val) {
        this.dataListSelections = val
      },
      // 新增 / 修改
      addOrUpdateHandle(row,defaultFrom) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.save.init(row != undefined ? row.id : null, defaultFrom)
        })
      },
      // 删除
      deleteHandle(id) {
        if (id != null) {
          id = id.id;
        }
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
                  if( this.tableFieldMap.isBusiness==0){
                    this.reloadBusConfig(this.model+this.pathUrl,this.tableFieldMap.tableName);
                  }
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
      addAllOrUpdateHandle() {
        this.saveall = true
        this.$nextTick(() => {
          this.$refs.saveall.init(null, this.dataForm)
        })
      },
    }
  }
</script>

<style scoped>

</style>
