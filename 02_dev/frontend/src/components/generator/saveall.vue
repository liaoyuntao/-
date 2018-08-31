<template>
  <el-dialog
    title="批量新增" :modal-append-to-body="false"
    :visible.sync="visible" width="75%" :append-to-body="true" >

      <div style="float:right;    margin-bottom: 10px;">
        <el-button  type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button  type="primary" @click="dataFormSubmit()">保存</el-button>
      </div>
    <el-form :inline="true" :model="tableData" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" >
  <el-table :data="tableData" class="tb-edit" style="width: 100%"  height="500"  size="mini" border highlight-current-row >
    <el-table-column v-for="item in tableFieldMap[pathUrl].isSetList"
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
            <el-date-picker v-model="scope.row[item.fieldName]"  type="date" style="width:100%;" value-format="yyyy-MM-dd"  :placeholder="item.pageComment" format="yyyy-MM-dd"><template slot="prepend">{{item.pageComment}}</template> </el-date-picker>
          </div>
          <!--时间datetime-->
          <div v-else-if="item.inputType==='3'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
            <el-date-picker v-model="scope.row[item.fieldName]" value-format="yyyy-MM-dd HH:mm:ss"  format="yyyy-MM-dd HH:mm:ss" :placeholder="item.pageComment" type="datetime" style="width:100%;"  ><template slot="prepend">{{item.pageComment}}</template></el-date-picker>
          </div>
          <!--下拉选select-->
          <div  v-else-if="item.inputType=='4'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
            <el-select v-model="scope.row[item.fieldName]" :filterable="true" :placeholder="item.pageComment" style="width:100%;">
              <el-option
                v-for="itemss in getBusConfig(item.dictionaryIndex).list"
                :key="itemss.confName"
                :label="itemss.confName"
                :value="itemss.confVue"><template slot="prepend">{{item.pageComment}}</template>
              </el-option>
            </el-select>
          </div>
          <!--复选框-->
          <div  v-else-if="item.inputType=='5'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
            <el-select  style="width:100%"
                        v-model="scope.row[item.fieldName]"  multiple  :filterable="true" allow-create default-first-option
                        :placeholder="item.pageComment" >
              <el-option
                v-for="itemss in getBusConfig(item.dictionaryIndex).list"
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
          <div  v-else-if="item.inputType=='8'"class="el-input el-input-group el-input-group--prepend el-input--suffix"@click="handleEdit(scope.$index,item.fieldName)" >
            <!--上传图片-->
            <el-upload
              class="avatar-uploader"
              :action="imgUrl"
              list-type="picture-card"
              :show-file-list="false"
              :data="item"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload" :on-preview="handlePictureCardPreview">
              <img  style="width:100%;height:100%;" v-if="scope.row[item.fieldName]" :src="scope.row[item.fieldName]" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </div>
          <!--多图片上传-->
          <div  v-else-if="item.inputType=='9'" class="el-input el-input-group el-input-group--prepend el-input--suffix"   @click="handleEdit(scope.$index,item.fieldName)">
            <el-upload
              :action="imgUrl"
              :on-remove="handleRemove"
              :data="item"
              list-type="picture-card"
              :file-list="scope.row[item.fieldName]"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload"
              :on-preview="handlePictureCardPreview">
              <i class="el-icon-plus"></i><template slot="prepend">{{item.pageComment}}</template>
            </el-upload>
          </div>
        <div v-else-if="item.inputType=='10'" @click="handleSelect(item)">
          <el-autocomplete style="width:100%;"
                           class="inline-input"
                           v-model="dataForm[item.fieldName]"
                           :fetch-suggestions="querySearch"
                           :placeholder="item.pageComment"
          > </el-autocomplete>
        </div>
          <el-input v-model="scope.row[item.fieldName]" :placeholder="item.pageComment" v-else>
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
  export default {
    name: 'saveall',
    data () {
      return {
        config: {
          initialFrameWidth: null,
          initialFrameHeight: 350
        },
        fieldName:null,
        index:null,
        prewImgLoad: false,
        prewImg: null,
        imgUrl: API.sysoss.upload(this.$cookie.get('token')),
        busConfig: this.busConfig,
        tableFieldMap: this.tableFieldMap,
        sysurl: window.SITE_CONFIG.baseUrl,
        visible: false,
        dialogImageUrl: '',
        dialogVisible: false,
        dynamicValidateForm: {
          domains: [{
            value: ''
          }],
          email: ''
        },
        tableData: []
    }
    },
    props: {
      dataForm: {
        default: function () {
          return {}
        },
        type: Object
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
      list: {
        type: Array
      },
      updateFunction: {
        type: Function
      }
    },
    watch: {
      // content (val) {
      //   this.editor && val !== this.outContent && this.editor.html(val)
      // },
      // outContent (val) {
      //   this.$emit('update-content', val, this.fieldName)
      //   this.$emit('update:content', val, this.fieldName)
      //   this.$emit('on-content-change', val, this.fieldName)
      // }
    },
    mounted () {
      // // 初始访问时创建
      // this.initEditor()
    },
    /**
     * keep-alive 会用到进入时调用activated 离开时调用deactivated
     * 初始访问 created、mounted 切换时deactivated 再次进入时 activated
     */
    activated () {
      // // keep-alive 进入时创建
      // this.initEditor()
    },
    deactivated () {
      // // keep-alive 离开时移除
      // this.removeEditor()
    },
    methods: {

      handleSelect(item) {
        ////console.log(this.activeIndex=item.dictionaryIndex);
      },
      querySearch(queryString, cb) {
        ////console.log(this.activeIndex);
        var restaurants = this.getBusConfig(this.activeIndex).list;
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
      onEditorChange: function (text, fielName) {
        this.dataForm[fielName] = text
      },
      // 多图片上传删除事件
      handleRemove (file, fileList) {
        this.tableData[this.index][this.fieldName] = fileList
      },
      // 预览多图片事件
      handlePictureCardPreview: function (file) {
        this.prewImgLoad = true
        this.prewImg = file.url
      },
      // 添加多图片上传事件
      handleAvatarSuccess: function (res, file) {
     //   ////console.log(this.dataForm[res.fieldName] instanceof Array)
        ////console.log(this.tableData);
        if (this.tableData[this.index][this.fieldName] instanceof Array) {
          this.tableData[this.index][this.fieldName].push({urd: 888, name: res.fieldName, url: res.url})
        } else {
          this.tableData[this.index][this.fieldName] = res.url
        }
      },
      // 图片上传格式验证
      beforeAvatarUpload (file) {
        const isJPG = file.type === 'image/jpeg'
        const isLt2M = file.size / 1024 / 1024 < 2
        return true
      },
      // 初始化方法
      init: function (id,json) {
        this.tableData=[];
        var dataForm = {};
        dataForm.id = id || 0
        for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {
          var cou = this.tableFieldMap[this.pathUrl].columns[i];
          ////console.log(cou);
          if (cou.isNull === '1') {
            this.dataRule[cou.fieldName] = [
              { required: true, message: cou.pageComment + '不能为空', trigger: 'blur' }
            ]
          }
          if(cou.inputType === '9' || cou.inputType === '5' ){
            dataForm[cou.fieldName]=[]
          }else{
            dataForm[cou.fieldName]='';
          }
        }
        if(json!=null){
          for(var key in json){
            dataForm[key]=json[key];
          }
        }
        this.dataForm=dataForm;
        this.visible = true
        this.addOrUpdateHandle();
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
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
                    if( this.tableFieldMap[this.pathUrl].isBusiness==0){
                      this.reloadBusConfig(this.tableFieldMap[this.pathUrl].tableName);
                    }
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      },
      // handleCurrentChange(row, event, column) {
      //   ////console.log(row, event, column, event.currentTarget)
      // },
      handleEdit(index,fieldName) {
        ////console.log(index,fieldName);
        this.index=index;
        this.fieldName=fieldName;
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
