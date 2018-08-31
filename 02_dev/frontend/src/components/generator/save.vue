<template>
     <el-dialog
   :title="!dataForm.id ? '新增' : '修改'" :modal-append-to-body="false"
   :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" >
      <el-row :gutter="20">
        <el-col :lg="item.inputType=='5'||item.inputType=='7' ||item.inputType=='6' ||item.inputType=='8' ||item.inputType=='9' ?24:12"  v-for="item in tableFieldMap[pathUrl].isSetList">
      <!--  <el-col :xs="item.inputType=='5'||item.inputType=='7'?24:12" :sm="item.inputType=='5'?24:12" :md="item.inputType=='5'?24:12" :lg="item.inputType=='5'||item.inputType=='7'?24:12" :xl="item.inputType=='5'||item.inputType=='7'?24:12"  v-for="item in tableFieldMap[pathUrl].isSetList">
    -->   <!--   <div class="grid-content bg-purple">-->
          <el-form-item  :prop="item.fieldName">
            <!--数字number-->
            <div   v-if="item.inputType==='1'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-input-number v-model="dataForm[item.fieldName]"  :min="0" >
            </el-input-number>
            </div>
              <!--日期date-->
            <div  v-else-if="item.inputType==='2'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-date-picker v-model="dataForm[item.fieldName]"   type="date" style="width:100%;" value-format="yyyy-MM-dd"  :placeholder="item.pageComment" format="yyyy-MM-dd"><template slot="prepend">{{item.pageComment}}</template> </el-date-picker>
            </div>
              <!--时间datetime-->
            <div v-else-if="item.inputType==='3'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-date-picker v-model="dataForm[item.fieldName]"  value-format="yyyy-MM-dd HH:mm:ss"  format="yyyy-MM-dd HH:mm:ss" :placeholder="item.pageComment" type="datetime" style="width:100%;"  ><template slot="prepend">{{item.pageComment}}</template></el-date-picker>
            </div>
              <!--下拉选select-->
            <div  v-else-if="item.inputType=='4'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
              <el-select v-model="dataForm[item.fieldName]" :filterable="true" :placeholder="item.pageComment" style="width:100%;">
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
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-select  style="width:100%"
                       v-model="dataForm[item.fieldName]"  multiple  :filterable="true" allow-create default-first-option
                       :placeholder="item.pageComment">
              <el-option
                v-for="itemss in getBusConfig(item.dictionaryIndex).list"
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
                      :fieldName="item.fieldName"
                      :content="dataForm[item.fieldName]"
                      :pluginsPath="'/static/kindeditor/plugins/'"
                      :uploadJson="sysurl+'api/uploadFile'"
                      :loadStyleMode="false"
                      @update-content="onEditorChange"
                      :allowFileManager="false"
                      :allowImageRemote="false"
              ></editor>
            </div>
            <!--文本域-->
            <div  v-else-if="item.inputType=='7'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-input :autosize="{ minRows: 10, maxRows: 4}"
                      type="textarea"
                      :rows="2"
                      :placeholder="item.pageComment"
                      v-model="dataForm[item.fieldName]"><template slot="prepend">{{item.pageComment}}</template>
            </el-input>
            </div>
            <div  v-else-if="item.inputType=='8'"class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <!--上传图片-->
            <el-upload
                       class="avatar-uploader"
                       :action="imgUrl"
                       list-type="picture-card"
                       :show-file-list="false"
                       :data="item"
                       :on-success="handleAvatarSuccess"
                       :before-upload="beforeAvatarUpload" :on-preview="handlePictureCardPreview">
              <img  style="width:100%;height:100%;" v-if="dataForm[item.fieldName]" :src="dataForm[item.fieldName]" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
            </div>
            <!--多图片上传-->
            <div  v-else-if="item.inputType=='9'" class="el-input el-input-group el-input-group--prepend el-input--suffix" >
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-upload
                       :action="imgUrl"
                       :on-remove="handleRemove"
                       :data="item"
                       list-type="picture-card"
                       :file-list="dataForm[item.fieldName]"
                       :on-success="handleAvatarSuccess"
                       :before-upload="beforeAvatarUpload"
                       :on-preview="handlePictureCardPreview">
              <i class="el-icon-plus"></i><template slot="prepend">{{item.pageComment}}</template>
            </el-upload>
            </div>
            <!--搜索框-->
            <div v-else-if="item.inputType=='10'" @click="handleSelect(item)">
              <el-autocomplete style="width:100%;"
                class="inline-input"
                v-model="dataForm[item.fieldName]"
                :fetch-suggestions="querySearch"
                :placeholder="item.pageComment"
              > <template slot="prepend">{{item.pageComment}}</template></el-autocomplete>
            </div>
            <!--四级联动-->
            <div  v-else-if="item.inputType=='11'" class="el-input el-input-group el-input-group--prepend el-input--suffix" @click="activeFieldName(item.fieldName)">
              <div class="el-input-group__prepend">{{item.pageComment}}</div>
            <el-cascader v-model="dataForm[item.fieldName]"
              :placeholder="item.pageComment"
              :options="options2" style="width:100%;"
              filterable
              :props="props"
            ></el-cascader>
            </div>
            <!--普通文本框-->
            <el-input v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" v-else>
              <template slot="prepend">{{item.pageComment}}</template>
            </el-input>
         <!--   <el-cascader  v-else
                         v-model="dataForm[item.fieldName]"
              :options="options2"
              @active-item-change="handleItemChange"
              :props="props"
            ><template slot="prepend">{{item.pageComment}}</template></el-cascader>-->
          </el-form-item>
        <!--</div>-->
        </el-col>
      </el-row>

    </el-form>
    <el-dialog :visible.sync="prewImgLoad" :modal="false">
      <img width="100%" :src="prewImg" alt="">
    </el-dialog>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
     </el-dialog>
</template>

<script>
  import API from '@/api'
  import {getAddress} from '@/utils'
  import { isEmail, isMobile,isPhone,isIdentityCard,isInteger,isDecimals,isNull } from '@/utils/validate'
  export default {
    name: 'save',
    data () {
      return {
        options2: this.address,
        props: {
          label:"areaname",
          value: 'id',
          children: 'children'
        },
        config: {
          initialFrameWidth: null,
          initialFrameHeight: 350
        },
        prewImgLoad: false,
        prewImg: null,
        imgUrl: API.sysoss.upload(this.$cookie.get('token')),
        busConfig: this.busConfig,
        tableFieldMap: this.tableFieldMap,
        sysurl: window.SITE_CONFIG.baseUrl,
        visible: false,
        dialogImageUrl: '',
        dialogVisible: false,
        activeIndex:null,
        fieldNmae:null
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
      activeFieldName(fieldName){
        //console.log(fieldName);
        this.fieldNmae=fieldName;
      },
      test(val){
        var list=[];
        for(var i in val){
          var item = val[i];
          list.push(item.id);
        }
        this.dataForm[this.fieldNmae]=JSON.stringify(list);
      },
      handleSelect(item) {
        //////console.log(this.activeIndex=item.dictionaryIndex);
      },
      querySearch(queryString, cb) {
        //////console.log(this.activeIndex);
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
        this.dataForm[file.name] = fileList
      },
      // 预览多图片事件
      handlePictureCardPreview: function (file) {
        this.prewImgLoad = true
        this.prewImg = file.url
      },
      // 添加多图片上传事件
      handleAvatarSuccess: function (res, file) {
        //////console.log(this.dataForm[res.fieldName] instanceof Array)
        if (this.dataForm[res.fieldName] instanceof Array) {
          this.dataForm[res.fieldName].push({urd: 888, name: res.fieldName, url: res.url})
        } else {
          this.dataForm[res.fieldName] = res.url
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
        var dataForm = {};
        dataForm.id = id || 0
        for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {
          var cou = this.tableFieldMap[this.pathUrl].columns[i];
            this.dataRule[cou.fieldName] = [
          //   { required: true, message: cou.pageComment + '不能为空', trigger: 'blur' },
          //     { fieldName:cou.fieldName,checkout:cou.checkout,validator: function(rule, value, callback) {
          //         console.log(rule.fieldName);
          //       if(rule.checkout!=null  ){
          //         var che = JSON.parse(rule.checkout);
          //         var boo=true;
          //         for(var i in che){
          //           var item = che[i];
          //           //0-手机号,1-非空,2-身份证,3-邮箱,4-数字,5-小数
          //           if (item==="0" && !isMobile(value)) {
          //             callback(new Error('手机号格式错误'))
          //           }else if(item==="1" && !isNull(value)){
          //             callback(new Error('不能为空'))
          //             boo=false;
          //           }else if(item==="2" && ! isIdentityCard(value)){
          //             callback(new Error('身份证格式错误'))
          //             boo=false;
          //           }else if(item==="3" && !isEmail(value)){
          //             callback(new Error('邮箱格式错误'))
          //             boo=false;
          //           }else if(item==="4" && !isInteger(value)){
          //             callback(new Error('数字格式错误'))
          //             boo=false;
          //           }else if(item==="5" && !isDecimals(value)){
          //             callback(new Error('小数格式错误'))
          //             boo=false;
          //           }
          //         }
          //         if(boo){
          //           callback()
          //         }
          //       }else{
          //         callback()
          //       }
          //
          //       }
          //       , trigger: 'blur' }
            ]
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
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (id) {
            API[this.pathUrl].info(id).then(({data}) => {
              if (data && data.code === 0) {
                for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {
                  var cou = this.tableFieldMap[this.pathUrl].columns[i]
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
                  else if (cou.inputType === '9') {
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
      }
    }
  }
</script>
