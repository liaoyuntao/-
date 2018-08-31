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
                    <el-form-item label="订单编号" prop="orderNo">
                                                            <el-input v-model="dataForm.orderNo" placeholder="订单编号"></el-input>

                    </el-form-item>
                    <el-form-item label="用户id" prop="userId">
                                                            <el-input v-model="dataForm.userId" placeholder="用户id"></el-input>

                    </el-form-item>
                    <el-form-item label="收货地址" prop="address">
                                                            <el-input v-model="dataForm.address" placeholder="收货地址"></el-input>

                    </el-form-item>
                    <el-form-item label="详情地址" prop="detailedAddress">
                                                            <el-input v-model="dataForm.detailedAddress" placeholder="详情地址"></el-input>

                    </el-form-item>
                    <el-form-item label="订单金额" prop="orderMoney">
                                                            <el-input v-model="dataForm.orderMoney" placeholder="订单金额"></el-input>

                    </el-form-item>
                    <el-form-item label="优惠卷id" prop="couponId">
                                                            <el-input v-model="dataForm.couponId" placeholder="优惠卷id"></el-input>

                    </el-form-item>
                    <el-form-item label="支付方式" prop="payType">
                                                            <el-input v-model="dataForm.payType" placeholder="支付方式"></el-input>

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
                    orderNo: '',
                    userId: '',
                    address: '',
                    detailedAddress: '',
                    orderMoney: '',
                    couponId: '',
                    payType: '',
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
                        orderNo: [
                        { required: true, message: '订单编号不能为空', trigger: 'blur' }
                    ],
                        userId: [
                        { required: true, message: '用户id不能为空', trigger: 'blur' }
                    ],
                        address: [
                        { required: true, message: '收货地址不能为空', trigger: 'blur' }
                    ],
                        detailedAddress: [
                        { required: true, message: '详情地址不能为空', trigger: 'blur' }
                    ],
                        orderMoney: [
                        { required: true, message: '订单金额不能为空', trigger: 'blur' }
                    ],
                        couponId: [
                        { required: true, message: '优惠卷id不能为空', trigger: 'blur' }
                    ],
                        payType: [
                        { required: true, message: '支付方式不能为空', trigger: 'blur' }
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
                        API.wjadminorder.info(this.dataForm.id).then(({data}) => {
                            if (data && data.code === 0) {
                                        this.dataForm.remarks = data.data.remarks
                                        this.dataForm.versionNo = data.data.versionNo
                                        this.dataForm.createBy = data.data.createBy
                                        this.dataForm.createTime = data.data.createTime
                                        this.dataForm.updateBy = data.data.updateBy
                                        this.dataForm.updateTime = data.data.updateTime
                                        this.dataForm.deleteFlag = data.data.deleteFlag
                                        this.dataForm.sort = data.data.sort
                                        this.dataForm.orderNo = data.data.orderNo
                                        this.dataForm.userId = data.data.userId
                                        this.dataForm.address = data.data.address
                                        this.dataForm.detailedAddress = data.data.detailedAddress
                                        this.dataForm.orderMoney = data.data.orderMoney
                                        this.dataForm.couponId = data.data.couponId
                                        this.dataForm.payType = data.data.payType
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
                    'orderNo': this.dataForm.orderNo,
                    'userId': this.dataForm.userId,
                    'address': this.dataForm.address,
                    'detailedAddress': this.dataForm.detailedAddress,
                    'orderMoney': this.dataForm.orderMoney,
                    'couponId': this.dataForm.couponId,
                    'payType': this.dataForm.payType,
                }
                    var tick = !this.dataForm.id ? API.wjadminorder.add(params) : API.wjadminorder.update(params)
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