<template>
    <el-dialog
            :title="!dataForm.id ? '新增' : '修改'" :modal-append-to-body="false"
            :close-on-click-modal="false"
            :visible.sync="visible">
        <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
            <el-form-item :label="item.pageComment" :prop="item.fieldName" v-for="(item,indexs) in tableFieldMap[pathUrl].isSetList">
                <!--数字number-->
                <el-input-number v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" v-if="item.inputType==='1'" :min="1" ></el-input-number>
                <!--日期date-->
                <el-date-picker v-model="dataForm[item.fieldName]"  v-else-if="item.inputType==='2'" type="date" style="width:100%;" value-format="yyyy-MM-dd"  :placeholder="item.pageComment" format="yyyy-MM-dd"> </el-date-picker>
                <!--时间datetime-->
                <el-date-picker v-model="dataForm[item.fieldName]"  value-format="yyyy-MM-dd HH:mm:ss"  format="yyyy-MM-dd HH:mm:ss" :placeholder="item.pageComment" type="datetime" style="width:100%;"  v-else-if="item.inputType==='3'"></el-date-picker>
                <!--下拉选select-->
                <el-select v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" style="width:100%;" v-else-if="item.inputType=='4'">
                    <el-option
                            v-for="itemss in busConfig[pathUrl+item.fieldnames].list"
                            :key="itemss.confName"
                            :label="itemss.confName"
                            :value="itemss.confVue">
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
                            :value="itemss.confVue">
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
                          v-model="dataForm[item.fieldName]">
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
                    <i class="el-icon-plus"></i>
                </el-upload>
                <el-input v-model="dataForm[item.fieldName]" :placeholder="item.pageComment" v-else></el-input>
            </el-form-item>
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
    export default {
        data () {
            return {
                config: {
                    initialFrameWidth: null,
                    initialFrameHeight: 350
                },
                prewImgLoad: false,
                prewImg: null,
                imgUrl: API.sysoss.upload(this.$cookie.get('token')),
                pathUrl:'slideshowslideshow',
                busConfig: this.busConfig,
                tableFieldMap:this.tableFieldMap,
                sysurl: window.SITE_CONFIG.baseUrl,
                visible: false,
                dataForm: {
					id: 0,
					remarks: '',
					versionNo: '',
					createBy: '',
					createTime: '',
					updateBy: '',
					updateTime: '',
					deleteFlag: '',
					sort: '',
					pic: '',
					href: '',
					site: '',
        },
            dataRule: {

            }
        }
        },
        methods: {
            onEditorChange: function (text, fielName) {
                console.log(text)

                this.dataForm[fielName] = text
            },
            init (id) {
                this.dataForm.id = id || 0
                this.visible = true
                for (var i = 0; i < this.tableFieldMap[this.pathUrl].isSetList.length; i++) {
                    var cou = this.tableFieldMap[this.pathUrl].isSetList[i]
                    if (cou.isNull === '1') {
                        this.dataRule[cou.fieldName] = [
                            { required: true, message: cou.pageComment + '不能为空', trigger: 'blur' }
                        ]
                    }
                }
                this.$nextTick(() => {
                    this.$refs['dataForm'].resetFields()
                    if (id) {
                        API.slideshowslideshow.info(id).then(({data}) => {
                            if (data && data.code === 0) {
                                for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {
                                    var cou = this.tableFieldMap[this.pathUrl].columns[i]
                                    // 初始化字段
                                    if (cou.inputType === '5') {
                                        if (!data.data[cou.fieldName]) {
                                            this.dataForm[cou.fieldName] = []
                                        } else {
                                            var arr = JSON.parse(data.data[cou.fieldName])
                                            if (arr instanceof Array) {
                                                this.dataForm[cou.fieldName] = arr
                                            } else {
                                                arr += ''
                                                this.dataForm[cou.fieldName] = [arr]
                                            }
                                        }
                                    } else if (cou.inputType === '9') {
                                        if (!data.data[cou.fieldName]) {
                                            this.dataForm[cou.fieldName] = []
                                        } else {
                                            var arrayImg = JSON.parse(data.data[cou.fieldName])
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
            handleAvatarSuccess (res, file) {
                if (this.dataForm[res.fieldName] instanceof Array) {
                    this.dataForm[res.fieldName].push({name: res.fieldName, url: res.url})
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
            // 表单提交
            dataFormSubmit () {
                this.$refs['dataForm'].validate((valid) => {
                        if (valid) {
                    var params = {

                    'id': this.dataForm.id,
                    'remarks': this.dataForm.remarks,
                    'versionNo': this.dataForm.versionNo,
                    'createBy': this.dataForm.createBy,
                    'createTime': this.dataForm.createTime,
                    'updateBy': this.dataForm.updateBy,
                    'updateTime': this.dataForm.updateTime,
                    'deleteFlag': this.dataForm.deleteFlag,
                    'sort': this.dataForm.sort,
                    'pic': this.dataForm.pic,
                    'href': this.dataForm.href,
                    'site': this.dataForm.site,                }
                    var tick = !this.dataForm.id ? API.slideshowslideshow.add(params) : API.slideshowslideshow.update(params)
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
