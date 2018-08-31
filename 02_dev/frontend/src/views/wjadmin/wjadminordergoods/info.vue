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
                    <el-form-item label="商品名称" prop="name">
                                                            <el-input v-model="dataForm.name" placeholder="商品名称"></el-input>

                    </el-form-item>
                    <el-form-item label="订单id" prop="orderId">
                                                            <el-input v-model="dataForm.orderId" placeholder="订单id"></el-input>

                    </el-form-item>
                    <el-form-item label="商品id" prop="goodsId">
                                                            <el-input v-model="dataForm.goodsId" placeholder="商品id"></el-input>

                    </el-form-item>
                    <el-form-item label="商品原价" prop="originalPrice">
                                                            <el-input v-model="dataForm.originalPrice" placeholder="商品原价"></el-input>

                    </el-form-item>
                    <el-form-item label="优惠价" prop="preferentialPrice">
                                                            <el-input v-model="dataForm.preferentialPrice" placeholder="优惠价"></el-input>

                    </el-form-item>
                    <el-form-item label="商品图片" prop="pic">
                                                            <el-input v-model="dataForm.pic" placeholder="商品图片"></el-input>

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
                    name: '',
                    orderId: '',
                    goodsId: '',
                    originalPrice: '',
                    preferentialPrice: '',
                    pic: '',
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
                        name: [
                        { required: true, message: '商品名称不能为空', trigger: 'blur' }
                    ],
                        orderId: [
                        { required: true, message: '订单id不能为空', trigger: 'blur' }
                    ],
                        goodsId: [
                        { required: true, message: '商品id不能为空', trigger: 'blur' }
                    ],
                        originalPrice: [
                        { required: true, message: '商品原价不能为空', trigger: 'blur' }
                    ],
                        preferentialPrice: [
                        { required: true, message: '优惠价不能为空', trigger: 'blur' }
                    ],
                        pic: [
                        { required: true, message: '商品图片不能为空', trigger: 'blur' }
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
                        API.wjadminordergoods.info(this.dataForm.id).then(({data}) => {
                            if (data && data.code === 0) {
                                        this.dataForm.remarks = data.data.remarks
                                        this.dataForm.versionNo = data.data.versionNo
                                        this.dataForm.createBy = data.data.createBy
                                        this.dataForm.createTime = data.data.createTime
                                        this.dataForm.updateBy = data.data.updateBy
                                        this.dataForm.updateTime = data.data.updateTime
                                        this.dataForm.deleteFlag = data.data.deleteFlag
                                        this.dataForm.sort = data.data.sort
                                        this.dataForm.name = data.data.name
                                        this.dataForm.orderId = data.data.orderId
                                        this.dataForm.goodsId = data.data.goodsId
                                        this.dataForm.originalPrice = data.data.originalPrice
                                        this.dataForm.preferentialPrice = data.data.preferentialPrice
                                        this.dataForm.pic = data.data.pic
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
                    'name': this.dataForm.name,
                    'orderId': this.dataForm.orderId,
                    'goodsId': this.dataForm.goodsId,
                    'originalPrice': this.dataForm.originalPrice,
                    'preferentialPrice': this.dataForm.preferentialPrice,
                    'pic': this.dataForm.pic,
                }
                    var tick = !this.dataForm.id ? API.wjadminordergoods.add(params) : API.wjadminordergoods.update(params)
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