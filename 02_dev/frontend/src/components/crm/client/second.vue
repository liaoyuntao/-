<template>
  <div style="margin-left: 10px;">
    <el-select v-model="value" clearable placeholder="客户状态">
      <el-option
        v-for="item in options"
        :key="item.value"
        :label="item.label"
        :value="item.value">
      </el-option>
    </el-select>
    <el-select v-model="value1" clearable placeholder="客户等级">
      <el-option
        v-for="item in options1"
        :key="item.value1"
        :label="item.label"
        :value="item.value1">
      </el-option>
    </el-select>
    <el-select v-model="value3" clearable placeholder="客户分类">
      <el-option
        v-for="item in options2"
        :key="item.value3"
        :label="item.label"
        :value="item.value3">
      </el-option>
    </el-select>
    <el-date-picker
      v-model="value2"
      type="daterange"
      range-separator="至"
      start-placeholder="开始日期"
      end-placeholder="结束日期">
    </el-date-picker>
    <div style="float: right;margin-top: 50px;">
      <el-button @click="onSubmit">查询</el-button>
      <el-button type="primary" @click="addClue()">新增</el-button>
      <el-button type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
    </div>
    <el-table
      @selection-change="selectionChangeHandle"
      v-loading="dataListLoading"
      :data="tableData"
      border
      style="width: 100%;">
      <el-table-column
        type="selection"
        width="55">
      </el-table-column>
      <el-table-column
        prop="name"
        label="客户名称"
        width="180">
      </el-table-column>
      <el-table-column
        prop="phone"
        label="电话"
        width="180">
      </el-table-column>
      <el-table-column
        prop="customState"
        label="客户状态">
      </el-table-column>
      <el-table-column
        prop="belonger"
        label="归属人">
      </el-table-column>
      <el-table-column
        prop="clientGrade"
        label="客户等级">
      </el-table-column>
      <el-table-column
        prop="clientType"
        label="客户分类">
      </el-table-column>
      <el-table-column
        fixed="right"
        label="操作"
        width="100">
        <template slot-scope="scope">
          <el-button @click="handleClick(scope.row.id)" type="text" size="small">修改</el-button>
          <el-button type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageIndex"
      :page-sizes="[10, 20, 50, 100]"
      :page-size="pageSize"
      :total="totalPage"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <!--新增/修改弹出框-->
    <el-dialog :title="!dataForm.id ? '新增' : '修改'" :close-on-click-modal="false" :visible.sync="visible">
      <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
        <el-form-item label="客户名称"  prop="name">
          <el-input v-model="dataForm.name"   placeholder="客户名称" ></el-input>
        </el-form-item>
        <el-form-item label="公司" prop="company">
          <el-input v-model="dataForm.company" auto-complete="off" placeholder="公司"></el-input>
        </el-form-item>
        <el-form-item label="电话"  prop="phone">
          <el-input v-model="dataForm.phone" auto-complete="off" placeholder="电话"></el-input>
        </el-form-item>
        <el-form-item label="地址" prop="location">
          <el-input v-model="dataForm.location" auto-complete="off" placeholder="地址"></el-input>
        </el-form-item>
        <el-form-item label="客户状态" prop="customState">
          <el-select v-model="dataForm.customState" placeholder="请选择状态">
            <el-option label="确定意向" value="0"></el-option>
            <el-option label="重点跟进" value="1"></el-option>
            <el-option label="签约客户" value="2"></el-option>
            <el-option label="丢单了" value="3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="客户等级" prop="clientGrade">
          <el-select v-model="dataForm.clientGrade" placeholder="请选择等级">
            <el-option label="大客户" value="0"></el-option>
            <el-option label="中客户" value="1"></el-option>
            <el-option label="小客户" value="2"></el-option>
            <el-option label="VIP客户" value="3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="网址" prop="url">
          <el-input v-model="dataForm.url" auto-complete="off" placeholder="网址"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="dataForm.email" auto-complete="off" placeholder="邮箱"></el-input>
        </el-form-item>
        <el-form-item label="邮编" prop="postcode">
          <el-input v-model="dataForm.postcode" auto-complete="off" placeholder="邮编"></el-input>
        </el-form-item>
        <el-form-item label="归属人" prop="belonger">
          <el-input v-model="dataForm.belonger" auto-complete="off" placeholder="归属人"></el-input>
        </el-form-item>
        <el-form-item label="备注"  prop="remarks">
          <el-input v-model="dataForm.remarks" auto-complete="off" placeholder="备注"></el-input>
        </el-form-item>
        <el-form-item label="客户分类" prop="clientType">
          <el-select v-model="dataForm.clientType" placeholder="请选择渠道">
            <el-option label="经销商" value="0"></el-option>
            <el-option label="投资者" value="1"></el-option>
            <el-option label="合作伙伴" value="2"></el-option>
            <el-option label="其他" value="3"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="visible = false">取 消</el-button>
        <el-button type="primary" @click="dataSubmit('dataForm')">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
  import API from '@/api'
  import save from '@/components/generator/save.vue'
  export default {
    data() {
      var validatePhone=(rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入手机号'));
        }else {
          callback();
        }
      };
      var validatename=(rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入客户名称'));
        }else {
          callback();
        }
      };
      var validateemail=(rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入邮箱'));
        }else {
          callback();
        }
      };
      return {
        pageIndex: 1,
        pageSize: 20,
        totalPage: 0,
        tableData: [],
        sortData: {
          order: null,
          sidx: null
        },
        options: [{
          value: '0',
          label: '确定意向'
        }, {
          value: 1,
          label: '重点跟进'
        }, {
          value: 2,
          label: '签约客户'
        },{
          value: 3,
          label: '丢单了'
        },
        ],
        options1: [{
          value1: '0',
          label: '大客户'
        }, {
          value1: 1,
          label: '中客户'
        }, {
          value1: 2,
          label: '小客户'
        },{
          value1: 3,
          label: 'vip客户'
        },
        ],
        options2: [{
          value3: '0',
          label: '投资者'
        }, {
          value3: 1,
          label: '经销商'
        }, {
          value3: 2,
          label: '合作伙伴'
        },{
          value3: 3,
          label: '其他'
        },
        ],
        value: '',
        value1:'',
        value2: '',
        value3:'',
        dataListLoading:false,
        dataListSelections: [],
        visible : false,
        dataForm: {
          id: 0,
          name: '',
          company: '',
          phone: '',
          customState: '',
          clientGrade: '',
          location: '',
          url: '',
          email: '',
          postcode: '',
          clientType:'',
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
          name:[
            { validator: validatename, trigger: 'blur' },
          ],
          email:[
            { validator: validateemail, trigger: 'blur' },
            { pattern: /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/, message: '邮箱格式不正确',trigger: 'blur' }
          ],
          phone:[
            { validator: validatePhone, trigger: 'blur' },
            { required: true, message: '请输入手机号', trigger: 'blur' },
            { pattern: /^1[34578]\d{9}$/, message: '手机号格式不正确',trigger: 'blur' }
          ],
        },
        formLabelWidth: '120px'
      }
    },
    //控制多选
    watch: {
      dataListSelections (val) {
        //////console.log(val)
      }
    },
    mounted () {
      this.getMyList();
    },
    methods: {
      //列表
      getMyList(){
        this.dataListLoading=true
        var parms={
          page: this.pageIndex,
          limit: this.pageSize,
          sidx: this.sortData.sidx,
          order: this.sortData.order
        }
        //客户状态
        if(this.value!=""){
          parms.customState=this.value
        }
        //客户等级
        if(this.value1!=""){
          parms.clientGrade=this.value1
        }
        //客户分类
        if(this.value3!=""){
          parms.clientType=this.value3
        }
        //时间查询
        if(this.value2!=""){
          // parms.createTime=this.value2
          var starttime=null;
          var endtime=null;
          //时间转化
          for(var i=0;i<this.value2.length;i++){
            starttime=this.value2[0]
            endtime=this.value2[1]
          }
          parms.startTime=starttime
          parms.endTime=endtime
        }
        //////console.log(parms)
        API.crmmarketclient.mylist(parms).then(({data}) =>{

          //////console.log(data)
          if (data && data.code === 0) {
            for(var i=0;i<data.data.list.length;i++){
              if(data.data.list[i].customState==0){
                data.data.list[i].customState="确定意向"
              }else if(data.data.list[i].customState==1){
                data.data.list[i].customState="重点跟进"
              }else if(data.data.list[i].customState==2){
                data.data.list[i].customState="签约客户"
              }else {
                data.data.list[i].customState="丢单了"
              }
              if(data.data.list[i].clientGrade==0){
                data.data.list[i].clientGrade="大客户"
              }else if(data.data.list[i].clientGrade==1){
                data.data.list[i].clientGrade="中客户"
              }else if(data.data.list[i].clientGrade==2){
                data.data.list[i].clientGrade="小客户"
              }else{
                data.data.list[i].clientGrade="vip客户"
              }
              if(data.data.list[i].clientType==0){
                data.data.list[i].clientType="投资者"
              }else if(data.data.list[i].clientType==1){
                data.data.list[i].clientType="经销商"
              }else if(data.data.list[i].clientType==2){
                data.data.list[i].clientType="合作伙伴"
              }else{
                data.data.list[i].clientType="其他"
              }
            }
            this.tableData = data.data.list
            this.totalPage = data.data.totalCount
            if (data.data.totalPage < this.pageIndex && data.data.totalPage !== 0) {
              this.pageIndex = 1
              this.getMyList()
            }
          }else {
            this.tableData = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
      },
      //新增清空
      addClue(){
        this.visible = true;
        this.$nextTick(() => {
          this.$refs["dataForm"].resetFields();
        });
      },
      //修改
      handleClick(id){
        this.visible = true;
        API.crmmarketclient.info(id).then(({data}) => {
          if(data.data.customState==0){
            this.dataForm.customState="确定意向"
          }else if(data.data.customState==1){
            this.dataForm.customState="重点跟进"
          }else if(data.data.customState==2){
            this.dataForm.customState="签约客户"
          }else {
            this.dataForm.customState="丢单了"
          }
          if(data.data.clientGrade==0){
            this.dataForm.clientGrade="大客户"
          }else if(data.data.clientGrade==1){
            this.dataForm.clientGrade="中客户"
          }else if (data.data.clientGrade==2) {
            this.dataForm.clientGrade="小客户"
          }else {
            this.dataForm.clientGrade="vip客户"
          }
          if(data.data.clientType==0){
            this.dataForm.clientType="投资者"
          }else if(data.data.clientType==1){
            this.dataForm.clientType="经销商"
          }else if (data.data.clientType==2) {
            this.dataForm.clientType="合作伙伴"
          }else {
            this.dataForm.clientType="其他"
          }
          //////console.log(data)
          this.dataForm.id=data.data.id,
            this.dataForm.name = data.data.name,
            this.dataForm.company = data.data.company,
            this.dataForm.phone = data.data.phone,
            this.dataForm.belonger = data.data.belonger,
            this.dataForm.location = data.data.location,
            this.dataForm.url = data.data.url,
            this.dataForm.email = data.data.email,
            this.dataForm.postcode = data.data.postcode,
            // this.dataForm.clueDitch = data.data.clueDitch,
          this.dataForm.remarks=data.data.remarks
          this.dataForm.versionNo=data.data.versionNo,
            this.dataForm.createBy=data.data.createBy,
            this.dataForm.createTime=data.data.createTime,
            this.dataForm.updateBy=data.data.updateBy,
            this.dataForm.updateTime=data.data.updateTime,
            this.dataForm.deleteFlag=data.data.deleteFlag,
            this.dataForm.sort=data.data.sort
        });
      },

      //表单提交
      dataSubmit (formName) {
        if(this.dataForm.customState="确定意向"){
          this.dataForm.state=0
        }else if(this.dataForm.customState="重点跟进"){
          this.dataForm.state=1
        }else if(this.dataForm.customState="签约客户"){
          this.dataForm.state=2
        }else {
          this.dataForm.state=3
        }
        if(this.dataForm.clientGrade="大客户"){
          this.dataForm.clientGrade=0
        }else if(this.dataForm.clientGrade="中客户"){
          this.dataForm.clientGrade=1
        }else if (this.dataForm.clientGrade="小客户") {
          this.dataForm.clientGrade=2
        }else {
          this.dataForm.clientGrade=3
        }
        if(this.dataForm.clientType="投资者"){
          this.dataForm.clientType=0
        }else if(this.dataForm.clientType="经销商"){
          this.dataForm.clientType=1
        }else if (this.dataForm.clientType="合作伙伴") {
          this.dataForm.clientType=2
        }else {
          this.dataForm.clientType=3
        }
        var parms={
          id: this.dataForm.id || undefined,
          name:this.dataForm.name,
          company: this.dataForm.company,
          phone: this.dataForm.phone,
          belonger: this.dataForm.belonger,
          location: this.dataForm.location,
          url:this.dataForm.url,
          email:this.dataForm.email,
          postcode:this.dataForm.postcode,
          state: this.dataForm.state,
          remarks: this.dataForm.remarks,
          clueDitch: this.dataForm.clueDitch,
          versionNo: this.dataForm.versionNo,
          createBy: this.dataForm.createBy,
          createTime: this.dataForm.createTime,
          updateBy: this.dataForm.updateBy,
          updateTime: this.dataForm.updateTime,
          deleteFlag: this.dataForm.deleteFlag,
          sort: this.dataForm.sort,
        }
        //////console.log(parms)
        this.$refs[formName].validate((valid) => {
          if (valid) {
            var tick = !this.dataForm.id
              ? API.crmmarketclient.add(parms)
              : API.crmmarketclient.update(parms);
            tick.then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false;
                    this.getMyList()
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          } else {
            //////console.log('error submit!!');
            return false;
          }
        });

      },
      // 每页数
      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getMyList()
      },
      // 当前页
      currentChangeHandle (val) {
        this.pageIndex = val
        this.getMyList()
      },
      onSubmit() {
        this.getMyList()
      },
      // 多选
      selectionChangeHandle (val) {
        this.dataListSelections = val
      },

      // 删除
      deleteHandle (id) {
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          API.crmmarketclient.del(ids).then(({data}) => {
            //////console.log(ids)
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.getMyList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        })
      }
    }
  }
</script>

