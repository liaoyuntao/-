<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="表id" prop="tableId">
        <el-input v-model="dataForm.tableId" placeholder="表id"></el-input>

      </el-form-item>
      <el-form-item label="字段名称" prop="fieldName">
        <el-input v-model="dataForm.fieldName" placeholder="字段名称"></el-input>

      </el-form-item>
      <el-form-item label="字段类型" prop="fieldType">
        <el-input v-model="dataForm.fieldType" placeholder="字段类型"></el-input>

      </el-form-item>
      <el-form-item label="是否为空@0-可以空,1-非空" prop="isNull">
        <el-input v-model="dataForm.isNull" placeholder="是否为空@0-可以空,1-非空"></el-input>

      </el-form-item>
      <el-form-item label="是否搜索@0-搜索,1-非搜索" prop="isSeek">
        <el-input v-model="dataForm.isSeek" placeholder="是否搜索@0-搜索,1-非搜索"></el-input>

      </el-form-item>
      <el-form-item label="正则校验&0-手机号,1-非空,2-身份证,3-邮箱,4-数字,5-小数" prop="checkout">
        <el-input v-model="dataForm.checkout" placeholder="正则校验&0-手机号,1-非空,2-身份证,3-邮箱,4-数字,5-小数"></el-input>

      </el-form-item>
      <el-form-item label="是否导出@0-导出,1-非导出" prop="isExport">
        <el-input v-model="dataForm.isExport" placeholder="是否导出@0-导出,1-非导出"></el-input>

      </el-form-item>
      <el-form-item label="页面注释" prop="pageComment">
        <el-input v-model="dataForm.pageComment" placeholder="页面注释"></el-input>

      </el-form-item>
      <el-form-item label="字段注释" prop="comment">
        <el-input v-model="dataForm.comment" placeholder="字段注释"></el-input>

      </el-form-item>
      <el-form-item label="表格中字段是否显示@0-是,1-否" prop="tableSet">
        <el-input v-model="dataForm.tableSet" placeholder="表格中字段是否显示@0-是,1-否"></el-input>

      </el-form-item>
      <el-form-item label="是否数据库字段@0-是,1-否" prop="isDataBase">
        <el-input v-model="dataForm.isDataBase" placeholder="是否数据库字段@0-是,1-否"></el-input>

      </el-form-item>
      <el-form-item label="修改时是否显示@0-是,1-否" prop="isSet">
        <el-input v-model="dataForm.isSet" placeholder="修改时是否显示@0-是,1-否"></el-input>

      </el-form-item>
      <el-form-item label="输入框类型@0-普通文本,1-数字框,2-日期,3-时间,4-下拉选,5-复选框,6-富文本,7-文本域,8-上传单图像" prop="inputType">
        <el-input v-model="dataForm.inputType" placeholder="输入框类型@0-普通文本,1-数字框,2-日期,3-时间,4-下拉选,5-复选框,6-富文本,7-文本域,8-上传单图像"></el-input>

      </el-form-item>
      <el-form-item label="数据默认值" prop="dataDefault">
        <el-input v-model="dataForm.dataDefault" placeholder="数据默认值"></el-input>

      </el-form-item>
      <el-form-item label="是否主键@0-是,1-否" prop="columnKey">
        <el-input v-model="dataForm.columnKey" placeholder="是否主键@0-是,1-否"></el-input>

      </el-form-item>
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
          tableId: '',
          fieldName: '',
          fieldType: '',
          isNull: '',
          isSeek: '',
          checkout: '',
          isExport: '',
          pageComment: '',
          comment: '',
          tableSet: '',
          isDataBase: '',
          isSet: '',
          inputType: '',
          dataDefault: '',
          columnKey: '',
          remarks: '',
          versionNo: '',
          createBy: '',
          createTime: '',
          updateBy: '',
          updateTime: '',
          deleteFlag: '',
          sort: '',
        },
        dataRule: {
          tableId: [
            { required: true, message: '表id不能为空', trigger: 'blur' }
          ],
          fieldName: [
            { required: true, message: '字段名称不能为空', trigger: 'blur' }
          ],
          fieldType: [
            { required: true, message: '字段类型不能为空', trigger: 'blur' }
          ],
          isNull: [
            { required: true, message: '是否为空@0-可以空,1-非空不能为空', trigger: 'blur' }
          ],
          isSeek: [
            { required: true, message: '是否搜索@0-搜索,1-非搜索不能为空', trigger: 'blur' }
          ],
          checkout: [
            { required: true, message: '正则校验&0-手机号,1-非空,2-身份证,3-邮箱,4-数字,5-小数不能为空', trigger: 'blur' }
          ],
          isExport: [
            { required: true, message: '是否导出@0-导出,1-非导出不能为空', trigger: 'blur' }
          ],
          pageComment: [
            { required: true, message: '页面注释不能为空', trigger: 'blur' }
          ],
          comment: [
            { required: true, message: '字段注释不能为空', trigger: 'blur' }
          ],
          tableSet: [
            { required: true, message: '表格中字段是否显示@0-是,1-否不能为空', trigger: 'blur' }
          ],
          isDataBase: [
            { required: true, message: '是否数据库字段@0-是,1-否不能为空', trigger: 'blur' }
          ],
          isSet: [
            { required: true, message: '修改时是否显示@0-是,1-否不能为空', trigger: 'blur' }
          ],
          inputType: [
            { required: true, message: '输入框类型@0-普通文本,1-数字框,2-日期,3-时间,4-下拉选,5-复选框,6-富文本,7-文本域,8-上传单图像不能为空', trigger: 'blur' }
          ],
          dataDefault: [
            { required: true, message: '数据默认值不能为空', trigger: 'blur' }
          ],
          columnKey: [
            { required: true, message: '是否主键@0-是,1-否不能为空', trigger: 'blur' }
          ],
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
            API.generatortablefield.info(this.dataForm.id).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.tableId = data.data.tableId
                this.dataForm.fieldName = data.data.fieldName
                this.dataForm.fieldType = data.data.fieldType
                this.dataForm.isNull = data.data.isNull
                this.dataForm.isSeek = data.data.isSeek
                this.dataForm.checkout = data.data.checkout
                this.dataForm.isExport = data.data.isExport
                this.dataForm.pageComment = data.data.pageComment
                this.dataForm.comment = data.data.comment
                this.dataForm.tableSet = data.data.tableSet
                this.dataForm.isDataBase = data.data.isDataBase
                this.dataForm.isSet = data.data.isSet
                this.dataForm.inputType = data.data.inputType
                this.dataForm.dataDefault = data.data.dataDefault
                this.dataForm.columnKey = data.data.columnKey
                this.dataForm.remarks = data.data.remarks
                this.dataForm.versionNo = data.data.versionNo
                this.dataForm.createBy = data.data.createBy
                this.dataForm.createTime = data.data.createTime
                this.dataForm.updateBy = data.data.updateBy
                this.dataForm.updateTime = data.data.updateTime
                this.dataForm.deleteFlag = data.data.deleteFlag
                this.dataForm.sort = data.data.sort
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
              'tableId': this.dataForm.tableId,
              'fieldName': this.dataForm.fieldName,
              'fieldType': this.dataForm.fieldType,
              'isNull': this.dataForm.isNull,
              'isSeek': this.dataForm.isSeek,
              'checkout': this.dataForm.checkout,
              'isExport': this.dataForm.isExport,
              'pageComment': this.dataForm.pageComment,
              'comment': this.dataForm.comment,
              'tableSet': this.dataForm.tableSet,
              'isDataBase': this.dataForm.isDataBase,
              'isSet': this.dataForm.isSet,
              'inputType': this.dataForm.inputType,
              'dataDefault': this.dataForm.dataDefault,
              'columnKey': this.dataForm.columnKey,
              'remarks': this.dataForm.remarks,
              'versionNo': this.dataForm.versionNo,
              'createBy': this.dataForm.createBy,
              'createTime': this.dataForm.createTime,
              'updateBy': this.dataForm.updateBy,
              'updateTime': this.dataForm.updateTime,
              'deleteFlag': this.dataForm.deleteFlag,
              'sort': this.dataForm.sort,
            }
            var tick = !this.dataForm.id ? API.generatortablefield.add(params) : API.generatortablefield.update(params)
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
