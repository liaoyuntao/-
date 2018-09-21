<template>
    <el-dialog
            :title="!dataForm.id ? '新增' : '修改'"
            :close-on-click-modal="false"
            :visible.sync="visible">
        <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
                    <el-form-item label="备注" prop="remarks">
                                                            <el-input v-model="dataForm.remarks" placeholder="备注"></el-input>

                    </el-form-item>
                    <el-form-item label="版本号" prop="versionNo">
                                                            <el-input v-model="dataForm.versionNo" placeholder="版本号"></el-input>

                    </el-form-item>
                    <el-form-item label="创建人id" prop="createBy">
                                                            <el-input v-model="dataForm.createBy" placeholder="创建人id"></el-input>

                    </el-form-item>
                    <el-form-item label="创建时间" prop="createTime">
                                                            <el-date-picker v-model="dataForm.createTime"  placeholder="创建时间" type="date" style="width:100%;"></el-date-picker>

                    </el-form-item>
                    <el-form-item label="修改人id" prop="updateBy">
                                                            <el-input v-model="dataForm.updateBy" placeholder="修改人id"></el-input>

                    </el-form-item>
                    <el-form-item label="修改时间" prop="updateTime">
                                                            <el-date-picker v-model="dataForm.updateTime"  placeholder="修改时间" type="date" style="width:100%;"></el-date-picker>

                    </el-form-item>
                    <el-form-item label="逻辑删除@0-存在,1-隐藏,2-删除,3-停用" prop="deleteFlag">
                                                            <el-input v-model="dataForm.deleteFlag" placeholder="逻辑删除@0-存在,1-隐藏,2-删除,3-停用"></el-input>

                    </el-form-item>
                    <el-form-item label="排序" prop="sort">
                                                            <el-input v-model="dataForm.sort" placeholder="排序"></el-input>

                    </el-form-item>
                    <el-form-item label="支付金额" prop="payMoney">
                                                            <el-input v-model="dataForm.payMoney" placeholder="支付金额"></el-input>

                    </el-form-item>
                    <el-form-item label="支付标题@0-订单支付,1-余额充值" prop="title">
                                                            <el-input v-model="dataForm.title" placeholder="支付标题@0-订单支付,1-余额充值"></el-input>

                    </el-form-item>
                    <el-form-item label="支付时间" prop="payTime">
                                                            <el-date-picker v-model="dataForm.payTime"  placeholder="支付时间" type="date" style="width:100%;"></el-date-picker>

                    </el-form-item>
                    <el-form-item label="支付状态@0-待支付,1-已支付,2-支付异常" prop="state">
                                                            <el-input v-model="dataForm.state" placeholder="支付状态@0-待支付,1-已支付,2-支付异常"></el-input>

                    </el-form-item>
                    <el-form-item label="订单号" prop="orderNo">
                                                            <el-input v-model="dataForm.orderNo" placeholder="订单号"></el-input>

                    </el-form-item>
                    <el-form-item label="支付异常描述" prop="errorInfo">
                                                            <el-input v-model="dataForm.errorInfo" placeholder="支付异常描述"></el-input>

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
                    remarks: '',
                    versionNo: '',
                    createBy: '',
                    createTime: '',
                    updateBy: '',
                    updateTime: '',
                    deleteFlag: '',
                    sort: '',
                    payMoney: '',
                    title: '',
                    payTime: '',
                    state: '',
                    orderNo: '',
                    errorInfo: '',
        },
            dataRule: {
                        remarks: [
                        { required: true, message: '备注不能为空', trigger: 'blur' }
                    ],
                        versionNo: [
                        { required: true, message: '版本号不能为空', trigger: 'blur' }
                    ],
                        createBy: [
                        { required: true, message: '创建人id不能为空', trigger: 'blur' }
                    ],
                        createTime: [
                        { required: true, message: '创建时间不能为空', trigger: 'blur' }
                    ],
                        updateBy: [
                        { required: true, message: '修改人id不能为空', trigger: 'blur' }
                    ],
                        updateTime: [
                        { required: true, message: '修改时间不能为空', trigger: 'blur' }
                    ],
                        deleteFlag: [
                        { required: true, message: '逻辑删除@0-存在,1-隐藏,2-删除,3-停用不能为空', trigger: 'blur' }
                    ],
                        sort: [
                        { required: true, message: '排序不能为空', trigger: 'blur' }
                    ],
                        payMoney: [
                        { required: true, message: '支付金额不能为空', trigger: 'blur' }
                    ],
                        title: [
                        { required: true, message: '支付标题@0-订单支付,1-余额充值不能为空', trigger: 'blur' }
                    ],
                        payTime: [
                        { required: true, message: '支付时间不能为空', trigger: 'blur' }
                    ],
                        state: [
                        { required: true, message: '支付状态@0-待支付,1-已支付,2-支付异常不能为空', trigger: 'blur' }
                    ],
                        orderNo: [
                        { required: true, message: '订单号不能为空', trigger: 'blur' }
                    ],
                        errorInfo: [
                        { required: true, message: '支付异常描述不能为空', trigger: 'blur' }
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
                        API.payspaymenthistory.info(this.dataForm.id).then(({data}) => {
                            if (data && data.code === 0) {
                                        this.dataForm.remarks = data.data.remarks
                                        this.dataForm.versionNo = data.data.versionNo
                                        this.dataForm.createBy = data.data.createBy
                                        this.dataForm.createTime = data.data.createTime
                                        this.dataForm.updateBy = data.data.updateBy
                                        this.dataForm.updateTime = data.data.updateTime
                                        this.dataForm.deleteFlag = data.data.deleteFlag
                                        this.dataForm.sort = data.data.sort
                                        this.dataForm.payMoney = data.data.payMoney
                                        this.dataForm.title = data.data.title
                                        this.dataForm.payTime = data.data.payTime
                                        this.dataForm.state = data.data.state
                                        this.dataForm.orderNo = data.data.orderNo
                                        this.dataForm.errorInfo = data.data.errorInfo
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
                    'remarks': this.dataForm.remarks,
                    'versionNo': this.dataForm.versionNo,
                    'createBy': this.dataForm.createBy,
                    'createTime': this.dataForm.createTime,
                    'updateBy': this.dataForm.updateBy,
                    'updateTime': this.dataForm.updateTime,
                    'deleteFlag': this.dataForm.deleteFlag,
                    'sort': this.dataForm.sort,
                    'payMoney': this.dataForm.payMoney,
                    'title': this.dataForm.title,
                    'payTime': this.dataForm.payTime,
                    'state': this.dataForm.state,
                    'orderNo': this.dataForm.orderNo,
                    'errorInfo': this.dataForm.errorInfo,
                }
                    var tick = !this.dataForm.id ? API.payspaymenthistory.add(params) : API.payspaymenthistory.update(params)
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