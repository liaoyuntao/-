<template>
  <el-dialog
    title="批量新增" :modal-append-to-body="false" :close-on-click-modal="false"
    :visible.sync="visible" width="75%" :append-to-body="true" >

      <div style="float:right;    margin-bottom: 10px;">
        <el-button  type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button  type="primary" @click="dataFormSubmit()">保存</el-button>
      </div>
    <el-form :inline="true"  :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" >
  <el-table :data="tableData" class="tb-edit" style="width: 100%"  height="500"  size="mini" border highlight-current-row >
    <el-table-column v-for="item in tableFieldMap.columns" v-if="item.isSet=='0'"
                     sortable="custom"
                     :prop="item.fieldName"
                     header-align="center"
                     align="center" :label="item.pageComment" height="10" >
      <template slot-scope="scope">
          <!--数字number-->
          <div   v-if="item.inputType==='1'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
            <el-input-number  v-model="scope.row[item.fieldName]" :min="0" size="mini"> </el-input-number>
          </div>
          <!--日期date-->
          <div  v-else-if="item.inputType==='2'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
            <el-date-picker v-model="scope.row[item.fieldName]"  type="date" style="width:100%;" value-format="yyyy-MM-dd"  :placeholder="item.pageComment" format="yyyy-MM-dd" size="mini"><template slot="prepend">{{item.pageComment}}</template> </el-date-picker>
          </div>
          <!--时间datetime-->
          <div v-else-if="item.inputType==='3'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
            <el-date-picker v-model="scope.row[item.fieldName]" value-format="yyyy-MM-dd HH:mm:ss"  format="yyyy-MM-dd HH:mm:ss" size="mini" :placeholder="item.pageComment" type="datetime" style="width:100%;"  ><template slot="prepend">{{item.pageComment}}</template></el-date-picker>
          </div>
          <!--下拉选select-->
          <div  v-else-if="item.inputType=='4'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
            <el-select v-model="scope.row[item.fieldName]" :filterable="true" :placeholder="item.pageComment" size="mini" style="width:100%;">
              <el-option
                v-for="itemss in getBusConfig(model+pathUrl,item.dictionaryIndex).list"
                :key="itemss.confName"
                :label="itemss.confName"
                :value="itemss.confVue"><template slot="prepend">{{item.pageComment}}</template>
              </el-option>
            </el-select>
          </div>
          <!--复选框-->
          <div  v-else-if="item.inputType=='5'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
            <el-select  style="width:100%" size="mini"
                        v-model="scope.row[item.fieldName]"  multiple  :filterable="true" allow-create default-first-option
                        :placeholder="item.pageComment" >
              <el-option
                v-for="itemss in getBusConfig(model+pathUrl,item.dictionaryIndex).list"
                :key="itemss.confVue"
                :label="itemss.confName"
                :value="itemss.confVue"><template slot="prepend">{{item.pageComment}}</template>
              </el-option>
            </el-select>
          </div>
          <!--富文本框-->
       <!--   <div class="editor-container el-input el-input-group el-input-group&#45;&#45;prepend el-input&#45;&#45;suffix"  v-else-if="item.inputType=='6'">
            <editor id="editor_id"
                    height="400px"
                    width="100%"
                    style="width:100%"

                    :fieldName="item.fieldName"
                    :content="scope.row[item.fieldName]"
                    :pluginsPath="'/static/kindeditor/plugins/'"
                    :uploadJson="sysurl+'api/uploadFile'"
                    :loadStyleMode="false"
                    @update-content="onEditorChange"
                    :allowFileManager="false"
                    :allowImageRemote="false"
            ></editor>
          </div>-->
          <!--文本域-->
      <!--    <div  v-else-if="item.inputType=='7'" class="el-input el-input-group el-input-group&#45;&#45;prepend el-input&#45;&#45;suffix" >
            <el-input :autosize="{ minRows: 10, maxRows: 4}"
                      type="textarea"
                      :rows="2"
                      :placeholder="item.pageComment"
                      v-model="scope.row[item.fieldName]"><template slot="prepend">{{item.pageComment}}</template>
            </el-input>
          </div>-->
        <!--图片上传-->
        <upload v-else-if="item.inputType=='8' || item.inputType=='9'"  v-model="scope.row[item.fieldName]" :isMultiple="item.inputType=='9'" ></upload>

        <div v-else-if="item.inputType=='10'" @click="activeIndex=item.dictionaryIndex">
          <el-autocomplete style="width:100%;" size="mini"
                           class="inline-input"
                           v-model="scope.row[item.fieldName]"
                           :fetch-suggestions="querySearch"
                           :placeholder="item.pageComment"
          > </el-autocomplete>
        </div>
        <!--四级联动-->
        <linkage    v-else-if="item.inputType=='11'||item.inputType=='12'" :level="item.inputType=='11'?4:3"  v-model="scope.row[item.fieldName]"  > </linkage>
        <!--创建条目输入框-->
        <div  v-else-if="item.inputType=='13'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
          <el-select  style="width:100%" size="mini"    v-model="scope.row[item.fieldName]"   multiple
                      filterable
                      allow-create
                      default-first-option  :placeholder="item.pageComment">
            <el-option
              v-for="item in []"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </div>
        <el-input size="mini" v-model="scope.row[item.fieldName]" :placeholder="item.pageComment" v-else>
          </el-input>
      <!--  <el-input size="small" v-model="scope.row[item.fieldName]" placeholder="请输入内容"></el-input> <span>{{scope.row.address}}</span>
-->
      </template>
    </el-table-column>
    <el-table-column label="操作" fixed="right"   header-align="center"
                     align="center"
                     width="100">
      <template scope="scope">
        <el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
    </el-form>
  </el-dialog>

</template>

<script>
  import API from '@/api'
  import linkage from '@/components/input/linkage.vue'
  import upload from '@/components/input/upload.vue'
  import {getAddress,queryAddressById} from '@/utils'
  export default {
    name: 'saveall',
    components: {
      linkage,
      upload
    },
    data () {
      return {
        imgUrl: API.sysoss.upload(this.$cookie.get('token')),
        visible: false,
        tableData: [],
        dataForm:{},
      }
    },
    watch:{
      model:function (val) {
        console.log(val);
      }
    },
    props: {
      defaultForm:{
        type:Object,
        default:{}
      },

      dataRule: {
        default: function () {
          return {}
        },
        type: Object
      },
      pathUrl: {
        type: String
      },
      model: {

      },
      list: {
        type: Array
      },
      updateFunction: {
        type: Function
      },
      tableFieldMap: {
        type:Object
      },
      busConfig: {
        type:Object
      },
    },
    methods: {
      querySearch(queryString, cb) {
        ////console.log(this.activeIndex);
        var restaurants = this.getBusConfig(this.model+this.pathUrl,this.activeIndex).list;
        for(var i in restaurants){
          restaurants[i].value=restaurants[i].confName;
        }
        var results = queryString ? restaurants.filter(this.createFilter(queryString)) : restaurants;
        // 调用 callback 返回建议列表的数据
        cb(results);
      },
      createFilter(queryString) {
        return (restaurant) => {
          return (restaurant.confName.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
        };
      },
      // 初始化方法
      init: function (id) {
        this.tableData=[];
        var dataForm = {};
        dataForm.id = id || 0
        for (var i = 0; i < this.tableFieldMap.columns.length; i++) {
          var cou = this.tableFieldMap.columns[i];
          if (cou.isNull === '1') {
            this.dataRule[cou.fieldName] = [
              { required: true, message: cou.pageComment + '不能为空', trigger: 'blur' }
            ]
          }
          if(cou.inputType === '9'  || cou.inputType === '5'  || cou.inputType === '11'){
            dataForm[cou.fieldName]=[];
          }else{
            dataForm[cou.fieldName]='';
          }
        }
        Object.assign(dataForm,this.defaultForm);
         this.dataForm=dataForm;
        this.visible = true
        this.addOrUpdateHandle();
      },
      // 表单提交
      dataFormSubmit () {
       // this.$refs['dataForm'].validate((valid) => {
         // if (valid) {
            // var params = {}
            // Object.assign(params, this.tableData)
            ////console.log(this.tableData);
            var tick = API[this.pathUrl].saveAll(this.tableData)

            tick.then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false;
                    if( this.tableFieldMap.isBusiness==0){
                      this.reloadBusConfig(this.model+this.pathUrl,this.tableFieldMap.tableName);
                    }
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          //}
       // })
      },
      handleDelete(index, row) {
        this.tableData.splice(index,1)

      },
      addOrUpdateHandle(){
        this.tableData.push(JSON.parse(JSON.stringify(this.dataForm)));
      }
    }
  }
</script>
<style>
  /*.tb-edit .el-input {*/
    /*display: none*/
  /*}*/
  /*.tb-edit .current-row .el-input {*/
    /*display: block*/
  /*}*/
  /*.tb-edit .current-row .el-input+span {*/
    /*display: none*/
  /*}*/

</style>
