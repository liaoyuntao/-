<template>
     <el-dialog
   :title="!dataForm.id ? '新增' : '修改'" :modal-append-to-body="false" :close-on-click-modal="false"
   :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" >
      <el-row :gutter="20">
        <el-col :lg="item.inputType=='5'||item.inputType=='7' ||item.inputType=='6' ||item.inputType=='8' ||item.inputType=='9' ?24:12"  v-for="item in tableFieldMap.columns" v-if="item.isSet=='0'">
      <!--  <el-col :xs="item.inputType=='5'||item.inputType=='7'?24:12" :sm="item.inputType=='5'?24:12" :md="item.inputType=='5'?24:12" :lg="item.inputType=='5'||item.inputType=='7'?24:12" :xl="item.inputType=='5'||item.inputType=='7'?24:12"  v-for="item in tableFieldMap[pathUrl].isSetList">
    -->   <!--   <div class="grid-content bg-purple">-->
          <el-form-item  :prop="item.fieldName">
            <!--数字number-->
            <div   v-if="item.inputType==='1'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-input-number v-model="dataForm[item.fieldName]"  :min="0"  size="mini">
            </el-input-number>
            </div>
              <!--日期date-->
            <div  v-else-if="item.inputType==='2'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-date-picker v-model="dataForm[item.fieldName]" size="mini"  type="date" style="width:100%;" value-format="yyyy-MM-dd"  :placeholder="item.pageComment" format="yyyy-MM-dd"><template slot="prepend">{{item.pageComment}}</template> </el-date-picker>
            </div>
              <!--时间datetime-->
            <div v-else-if="item.inputType==='3'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-date-picker v-model="dataForm[item.fieldName]" size="mini" value-format="yyyy-MM-dd HH:mm:ss"  format="yyyy-MM-dd HH:mm:ss" :placeholder="item.pageComment" type="datetime" style="width:100%;"  ><template slot="prepend">{{item.pageComment}}</template></el-date-picker>
            </div>
              <!--下拉选select-->
            <div  v-else-if="item.inputType=='4'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
              <el-select v-model="dataForm[item.fieldName]" size="mini" :filterable="true" :placeholder="item.pageComment" style="width:100%;">
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
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-select  style="width:100%" size="mini"   v-model="dataForm[item.fieldName]"  multiple  :filterable="true" allow-create default-first-option  :placeholder="item.pageComment">
              <el-option
                v-for="itemss in getBusConfig(model+pathUrl,item.dictionaryIndex).list"
                :key="itemss.confVue"

                :label="itemss.confName"
                :value="itemss.confVue"><template slot="prepend">{{item.pageComment}}</template>
              </el-option>
            </el-select>
            </div>
            <!--富文本框-->
            <div class="editor-container el-input el-input-group el-input-group--prepend el-input--suffix"  v-else-if="item.inputType=='6'">
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
              <editor id="editor_id"
                      height="400px"
                      width="100%"
                      style="width:100%"
                      v-model="dataForm[item.fieldName]"
                      :pluginsPath="'/static/kindeditor/plugins/'"
                      :uploadJson="imgUrl"
                      :loadStyleMode="false"
                      :allowFileManager="false"
                      :allowImageRemote="false"
              ></editor>
            </div>
            <!--文本域-->
            <div  v-else-if="item.inputType=='7'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-input size="mini" :autosize="{ minRows: 10, maxRows: 4}"
                      type="textarea"
                      :rows="2"
                      :placeholder="item.pageComment"
                      v-model="dataForm[item.fieldName]"><template slot="prepend">{{item.pageComment}}</template>
            </el-input>
            </div>
            <!--图片上传-->
            <upload v-else-if="item.inputType=='8' || item.inputType=='9'" :pageComment="item.pageComment" v-model="dataForm[item.fieldName]" :isMultiple="item.inputType=='9'" ></upload>
            <!--搜索框-->
            <div v-else-if="item.inputType=='10'" @click="activeIndex=item.dictionaryIndex">
              <el-autocomplete  size="mini" style="width:100%;"
                class="inline-input"
                v-model="dataForm[item.fieldName]"
                :fetch-suggestions="querySearch"
                :placeholder="item.pageComment"
              > <template slot="prepend">{{item.pageComment}}</template></el-autocomplete>
            </div>
            <!--四级联动-->
            <linkage    v-else-if="item.inputType=='11'||item.inputType=='12'" :level="item.inputType=='11'?4:3" :pageComment="item.pageComment" v-model="dataForm[item.fieldName]"  > </linkage>
            <!--普通文本框-->
            <el-input size="mini" v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" v-else>
              <template slot="prepend">{{item.pageComment}}</template>
            </el-input>
          </el-form-item>
        <!--</div>-->
        </el-col>
      </el-row>

    </el-form>

    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
     </el-dialog>
</template>

<script>
  import API from '@/api'
  import {getAddress,queryAddressById} from '@/utils'
  import linkage from '@/components/input/linkage.vue'
  import upload from '@/components/input/upload.vue'
  import { isEmail, isMobile,isPhone,isIdentityCard,isInteger,isDecimals,isNull } from '@/utils/validate'
  export default {
    name: 'save',
    components: {
      linkage,
      upload
    },
    data () {
      return {
        dataForm:{},
        visible: false,
        activeIndex:null,
        imgUrl: API.sysoss.upload(this.$cookie.get('token')),
        dataRule:{}
      }
    },
    props: {
      defaultForm:{
        type:Object,
        default:{}
      },
      pathUrl: {
        type: String
      },
      model: {
        type: String
      },
      tableFieldMap: {
        type:Object
      },
    },
    methods: {
      querySearch(queryString, cb) {
        var restaurants = this.getBusConfig(this.module+this.pathUrl,this.activeIndex).list;
        for(var i in restaurants){
          restaurants[i].value=restaurants[i].confName;
        }
        //查询表格数据
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
        var dataForm = {};
        dataForm.id = id || 0
        for (var i = 0; i < this.tableFieldMap.columns.length; i++) {
          var cou = this.tableFieldMap.columns[i];
            this.dataRule[cou.fieldName] = [
              { fieldName:cou.fieldName,checkout:cou.checkout,validator: function(rule, value, callback) {
                 // console.log(rule.fieldName);
                if(rule.checkout!=null  ){
                  var che = JSON.parse(rule.checkout);
                  var boo=true;
                  for(var i in che){
                    var item = che[i];
                    //0-手机号,1-非空,2-身份证,3-邮箱,4-数字,5-小数
                    if (item==="0" && !isMobile(value)) {
                      callback(new Error('手机号格式错误'))
                    }else if(item==="1" && !isNull(value)){
                      callback(new Error('不能为空'))
                      boo=false;
                    }else if(item==="2" && ! isIdentityCard(value)){
                      callback(new Error('身份证格式错误'))
                      boo=false;
                    }else if(item==="3" && !isEmail(value)){
                      callback(new Error('邮箱格式错误'))
                      boo=false;
                    }else if(item==="4" && !isInteger(value)){
                      callback(new Error('数字格式错误'))
                      boo=false;
                    }else if(item==="5" && !isDecimals(value)){
                      callback(new Error('小数格式错误'))
                      boo=false;
                    }
                  }
                  if(boo){
                    callback()
                  }
                }else{
                  callback()
                }
                }
                , trigger: 'blur' }
            ]
            if(cou.inputType === '9'  || cou.inputType === '5'  || cou.inputType === '11'){
              dataForm[cou.fieldName]=[];
            }else{
              dataForm[cou.fieldName]='';
            }
        }
        Object.assign(dataForm,this.defaultForm);
        this.dataForm=dataForm;
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (id) {
            API[this.pathUrl].info(id).then(({data}) => {
              if (data && data.code === 0) {
                for (var i = 0; i < this.tableFieldMap.columns.length; i++) {
                  var cou = this.tableFieldMap.columns[i]
                  // 多选框兼容
                  if (cou.inputType === '5' || cou.inputType === '11') {
                    if (!data.data[cou.fieldName]) {
                      this.dataForm[cou.fieldName] = []
                    } else {
                      //////console.log(data.data[cou.fieldName])
                      var arr = null
                      try {
                        arr = JSON.parse(data.data[cou.fieldName])
                      } catch (e) {
                        arr = data.data[cou.fieldName]
                      }
                      if (arr instanceof Array) {
                        this.dataForm[cou.fieldName] = arr
                      } else {
                        arr += ''
                        this.dataForm[cou.fieldName] = [arr]
                      }
                    }
                  }
                  // 多图像上传兼容
                  else if (cou.inputType === '9' ) {
                    if (!data.data[cou.fieldName]) {
                      this.dataForm[cou.fieldName] = []
                    } else {
                      var arrayImg = null
                      try {
                        arrayImg = JSON.parse(data.data[cou.fieldName])
                      } catch (e) {
                        arrayImg = data.data[cou.fieldName]
                      }
                      if (arrayImg instanceof Array) {
                        this.dataForm[cou.fieldName] = arrayImg
                      } else {
                        this.dataForm[cou.fieldName] = [{uid: 999, name: cou.fieldName, url: arrayImg}]
                      }
                    }
                  } else {
                    this.dataForm[cou.fieldName] = data.data[cou.fieldName]
                  }
                }
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            var params = {}
            Object.assign(params, this.dataForm)
            var tick = !this.dataForm.id ? API[this.pathUrl].add(params) : API[this.pathUrl].update(params)
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
          }
        })
      }
    }
  }
</script>

