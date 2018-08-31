<template>
  <div v-show="!visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item :label="item.pageComment" :prop="item.fieldName" v-for="item in tableFieldMap[pathUrl].isSetList">
        <!--数字number-->
        <el-input-number v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" v-if="item.inputType==='1'" :min="1" ></el-input-number>
        <!--日期date-->
        <el-date-picker v-model="dataForm[item.fieldName]"  v-else-if="item.inputType==='2'" type="date" style="width:100%;" value-format="yyyy-MM-dd"  :placeholder="item.pageComment" format="yyyy-MM-dd"><template slot="prepend">{{item.pageComment}}</template> </el-date-picker>
        <!--时间datetime-->
        <el-date-picker v-model="dataForm[item.fieldName]"  value-format="yyyy-MM-dd HH:mm:ss"  format="yyyy-MM-dd HH:mm:ss" :placeholder="item.pageComment" type="datetime" style="width:100%;"  v-else-if="item.inputType==='3'"><template slot="prepend">{{item.pageComment}}</template></el-date-picker>
        <!--下拉选select-->
        <el-select v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" style="width:100%;" v-else-if="item.inputType=='4'">
          <el-option
            v-for="itemss in busConfig[pathUrl+item.fieldnames].list"
            :key="itemss.confName"
            :label="itemss.confName"
            :value="itemss.confVue"><template slot="prepend">{{item.pageComment}}</template>
          </el-option>
        </el-select>
        <!--复选框-->
        <el-select v-else-if="item.inputType=='5'" style="width:100%"
                   v-model="dataForm[item.fieldName]"  multiple  filterable allow-create default-first-option
                   :placeholder="item.pageComment">
          <el-option
            v-for="itemss in busConfig[pathUrl+item.fieldnames].list"
            :key="itemss.confVue"
            :label="itemss.confName"
            :value="itemss.confVue"><template slot="prepend">{{item.pageComment}}</template>
          </el-option>
        </el-select>
        <!--富文本框-->
        <div class="editor-container"  v-else-if="item.inputType=='6'">
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
        <el-input :autosize="{ minRows: 10, maxRows: 4}" v-else-if="item.inputType=='7'"
                  type="textarea"
                  :rows="2"
                  :placeholder="item.pageComment"
                  v-model="dataForm[item.fieldName]"><template slot="prepend">{{item.pageComment}}</template>
        </el-input>
        <!--上传图片-->
        <el-upload v-else-if="item.inputType=='8'"
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
        <!--多图片上传-->
        <el-upload v-else-if="item.inputType=='9'" :action="imgUrl"  :on-remove="handleRemove" :data="item" list-type="picture-card" :file-list="dataForm[item.fieldName]"  :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload"  :on-preview="handlePictureCardPreview">
          <i class="el-icon-plus"></i><template slot="prepend">{{item.pageComment}}</template>
        </el-upload>
        <el-input v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" v-else></el-input>
      </el-form-item>
    </el-form>
    <el-dialog :visible.sync="prewImgLoad" :modal="false">
      <img width="100%" :src="prewImg" alt="">
    </el-dialog>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = true">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </div>
</template>

<script>
  import API from '@/api'
  export default {
    name: 'save',
    data () {
      return {
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
        dialogImageUrl: '',
        dialogVisible: false
      }
    },
    props: {
      dataForm: {
        type: Object,
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
      list: {
        type: Array,
        default: function () {
          return []
        },
      },
      visible:{
        type:Boolean,
        required:true,
        default:false
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
        //console.log(this.dataForm[res.fieldName] instanceof Array)
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
      init: function (id) {
        this.dataForm.id = id || 0
        for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {
          var cou = this.tableFieldMap[this.pathUrl].columns[i]
          if (cou.isNull === '1') {
            this.dataRule[cou.fieldName] = [
              { required: true, message: cou.pageComment + '不能为空', trigger: 'blur' }
            ]
          }
        }
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (id) {
            API[this.pathUrl].info(id).then(({data}) => {
              if (data && data.code === 0) {
                for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {
                  var cou = this.tableFieldMap[this.pathUrl].columns[i]
                  // 多选框兼容
                  if (cou.inputType === '5') {
                    if (!data.data[cou.fieldName]) {
                      this.dataForm[cou.fieldName] = []
                    } else {
                      //console.log(data.data[cou.fieldName])
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
            //console.log(params)
            var tick = !this.dataForm.id ? API[this.pathUrl].add(params) : API[this.pathUrl].update(params)
            tick.then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
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
