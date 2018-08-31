<template>
    <el-dialog
            :title="!dataForm.id ? '新增' : '修改'"
            :close-on-click-modal="false"
            :visible.sync="visible">
        <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
                    <el-form-item label="栏目名" prop="areaname">
                                                            <el-input v-model="dataForm.areaname" placeholder="栏目名"></el-input>

                    </el-form-item>
                    <el-form-item label="父栏目" prop="parentid">
                                                            <el-input v-model="dataForm.parentid" placeholder="父栏目"></el-input>

                    </el-form-item>
                    <el-form-item label="经度" prop="lng">
                                                            <el-input v-model="dataForm.lng" placeholder="经度"></el-input>

                    </el-form-item>
                    <el-form-item label="纬度" prop="lat">
                                                            <el-input v-model="dataForm.lat" placeholder="纬度"></el-input>

                    </el-form-item>
                    <el-form-item label="层级" prop="level">
                                                            <el-input v-model="dataForm.level" placeholder="层级"></el-input>

                    </el-form-item>
                    <el-form-item label="创建时间" prop="createTime">
                                                            <el-date-picker v-model="dataForm.createTime"  placeholder="创建时间" type="date" style="width:100%;"></el-date-picker>

                    </el-form-item>
                    <el-form-item label="备注" prop="remarks">
                                                            <el-input v-model="dataForm.remarks" placeholder="备注"></el-input>

                    </el-form-item>
                    <el-form-item label="排序" prop="sort">
                                                            <el-input v-model="dataForm.sort" placeholder="排序"></el-input>

                    </el-form-item>
                    <el-form-item label="版本号" prop="versionNo">
                                                            <el-input v-model="dataForm.versionNo" placeholder="版本号"></el-input>

                    </el-form-item>
                    <el-form-item label="创建人id" prop="createBy">
                                                            <el-input v-model="dataForm.createBy" placeholder="创建人id"></el-input>

                    </el-form-item>
                    <el-form-item label="修改人id" prop="updateBy">
                                                            <el-input v-model="dataForm.updateBy" placeholder="修改人id"></el-input>

                    </el-form-item>
                    <el-form-item label="修改时间" prop="updateTime">
                                                            <el-date-picker v-model="dataForm.updateTime"  placeholder="修改时间" type="date" style="width:100%;"></el-date-picker>

                    </el-form-item>
        </el-form>
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
                busConfig: this.busConfig,
                sysurl: window.SITE_CONFIG.baseUrl,
                visible: false,
                dataForm: {
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
        },
            dataRule: {
                        areaname: [
                        { required: true, message: '栏目名不能为空', trigger: 'blur' }
                    ],
                        parentid: [
                        { required: true, message: '父栏目不能为空', trigger: 'blur' }
                    ],
                        lng: [
                        { required: true, message: '经度不能为空', trigger: 'blur' }
                    ],
                        lat: [
                        { required: true, message: '纬度不能为空', trigger: 'blur' }
                    ],
                        level: [
                        { required: true, message: '层级不能为空', trigger: 'blur' }
                    ],
                        createTime: [
                        { required: true, message: '创建时间不能为空', trigger: 'blur' }
                    ],
                        remarks: [
                        { required: true, message: '备注不能为空', trigger: 'blur' }
                    ],
                        sort: [
                        { required: true, message: '排序不能为空', trigger: 'blur' }
                    ],
                        versionNo: [
                        { required: true, message: '版本号不能为空', trigger: 'blur' }
                    ],
                        createBy: [
                        { required: true, message: '创建人id不能为空', trigger: 'blur' }
                    ],
                        updateBy: [
                        { required: true, message: '修改人id不能为空', trigger: 'blur' }
                    ],
                        updateTime: [
                        { required: true, message: '修改时间不能为空', trigger: 'blur' }
                    ],
            }
        }
        },
        methods: {
            init (id) {
                this.dataForm.id = id || 0
                this.visible = true
                this.$nextTick(() => {
                    this.$refs['dataForm'].resetFields()
                    if (this.dataForm.id) {
                        API.syspbarea.info(this.dataForm.id).then(({data}) => {
                            if (data && data.code === 0) {
                                        this.dataForm.areaname = data.data.areaname
                                        this.dataForm.parentid = data.data.parentid
                                        this.dataForm.lng = data.data.lng
                                        this.dataForm.lat = data.data.lat
                                        this.dataForm.level = data.data.level
                                        this.dataForm.createTime = data.data.createTime
                                        this.dataForm.remarks = data.data.remarks
                                        this.dataForm.sort = data.data.sort
                                        this.dataForm.versionNo = data.data.versionNo
                                        this.dataForm.createBy = data.data.createBy
                                        this.dataForm.updateBy = data.data.updateBy
                                        this.dataForm.updateTime = data.data.updateTime
                            }
                        })
                    }
                })
            },
            // 表单提交
            dataFormSubmit () {
                this.$refs['dataForm'].validate((valid) => {
                        if (valid) {
                    var params = {
                    'id': this.dataForm.id || undefined,
                    'areaname': this.dataForm.areaname,
                    'parentid': this.dataForm.parentid,
                    'lng': this.dataForm.lng,
                    'lat': this.dataForm.lat,
                    'level': this.dataForm.level,
                    'createTime': this.dataForm.createTime,
                    'remarks': this.dataForm.remarks,
                    'sort': this.dataForm.sort,
                    'versionNo': this.dataForm.versionNo,
                    'createBy': this.dataForm.createBy,
                    'updateBy': this.dataForm.updateBy,
                    'updateTime': this.dataForm.updateTime,
                }
                    var tick = !this.dataForm.id ? API.syspbarea.add(params) : API.syspbarea.update(params)
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