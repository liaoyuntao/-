<template>
  <div style="margin-left: 10px;">
    <el-select v-model="value" clearable placeholder="联系人关系">
      <el-option
        v-for="item in options"
        :key="item.value"
        :label="item.label"
        :value="item.value">
      </el-option>
    </el-select>
    <el-select v-model="value1" clearable placeholder="亲密程度">
      <el-option
        v-for="item in options1"
        :key="item.value1"
        :label="item.label"
        :value="item.value1">
      </el-option>
    </el-select>
    <el-input v-model="input" placeholder="姓名" style="width: 300px;"></el-input>
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
        label="姓名">
      </el-table-column>
      <el-table-column
        prop="sex"
        label="性别">
      </el-table-column>
      <el-table-column
        prop="mobile"
        label="手机">
      </el-table-column>
      <el-table-column
        prop="duty"
        label="职务">
      </el-table-column>
      <el-table-column
        prop="department"
        label="部门">
      </el-table-column>
      <el-table-column
        prop="roleRelation"
        label="联系人关系">
      </el-table-column>
      <el-table-column
        prop="density"
        label="亲密程度">
      </el-table-column>
      <el-table-column
        prop="linkmDitch"
        label="联系人来源">
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
        <el-form-item label="姓名"  prop="name">
          <el-input v-model="dataForm.name"   placeholder="姓名" ></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <!--<el-radio-group v-model="dataForm.sex">-->
            <el-radio v-model="dataForm.sex" label="男"></el-radio>
            <el-radio v-model="dataForm.sex" label="女" ></el-radio>
          <!--</el-radio-group>-->
        </el-form-item>
        <el-form-item label="客户"  prop="client">
          <el-input v-model="dataForm.client" placeholder="客户名称"></el-input>
          <el-popover ref="reference" placement="right" width="320" trigger="click" visible-arrow="true"
                      style="overflow: hidden;">
            <el-input v-model="clientName" placeholder="请输入搜索内容" width="100"></el-input>
            <el-button @click="searchclientName">搜索</el-button>

            <el-table :data="gridData" highlight-current-row height="320" @row-click="handleCurrentChange">
              <el-table-column align="center" width="100" property="name" label="姓名"></el-table-column>
              <el-table-column align="center" width="100" property="customState" label="客户状态"></el-table-column>
              <el-table-column align="center" width="100" property="belonger" label="归属人"></el-table-column>
            </el-table>

            <el-button slot="reference" @click="deparPname">点击选择客户</el-button>
          </el-popover>
        </el-form-item>
        <el-form-item label="手机"  prop="mobile">
          <el-input v-model="dataForm.mobile" auto-complete="off" placeholder="手机"></el-input>
        </el-form-item>
        <el-form-item label="地址" prop="location">
          <el-input v-model="dataForm.location" auto-complete="off" placeholder="地址"></el-input>
        </el-form-item>
        <el-form-item label="联系人关系" prop="roleRelation" style="padding-left: 7px;">
          <el-select v-model="dataForm.roleRelation" placeholder="请选择关系">
            <el-option label="经办人" value="0"></el-option>
            <el-option label="决策人" value="1"></el-option>
            <el-option label="意见影响人" value="2"></el-option>
            <el-option label="商务决策人" value="3"></el-option>
            <el-option label="使用人" value="4"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="亲密程度" prop="density">
          <el-select v-model="dataForm.density" placeholder="请选择亲密程度">
            <el-option label="初次认识" value="0"></el-option>
            <el-option label="一般关系" value="1"></el-option>
            <el-option label="朋友关系" value="2"></el-option>
            <el-option label="好友关系" value="3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="生日" prop="birthday">
          <el-date-picker
            v-model="dataForm.birthday"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="职务" prop="duty">
          <el-input v-model="dataForm.duty" auto-complete="off" placeholder="职务"></el-input>
        </el-form-item>
        <el-form-item label="部门" prop="department">
          <el-input v-model="dataForm.department" auto-complete="off" placeholder="部门"></el-input>
        </el-form-item>
        <el-form-item label="编号" prop="belonger">
          <el-input v-model="dataForm.belonger" auto-complete="off" placeholder="编号"></el-input>
        </el-form-item>
        <el-form-item label="备注"  prop="remarks">
          <el-input v-model="dataForm.remarks" auto-complete="off" placeholder="备注"></el-input>
        </el-form-item>
        <el-form-item label="联系人来源" prop="linkmDitch">
          <el-select v-model="dataForm.linkmDitch" placeholder="请选择来源">
            <el-option label="广告" value="0"></el-option>
            <el-option label="在线市场" value="1"></el-option>
            <el-option label="员工介绍" value="2"></el-option>
            <el-option label="外部介绍" value="3"></el-option>
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
          callback(new Error('请输入联系人名称'));
        }else {
          callback();
        }
      };
      return {
        currentRow: null,
        clientName:'',
        pageIndex: 1,
        pageSize: 20,
        totalPage: 0,
        tableData: [],
        gridData:[],
        sortData: {
          order: null,
          sidx: null
        },
        options: [{
          value: '0',
          label: '经办人'
        }, {
          value: 1,
          label: '决策人'
        }, {
          value: 2,
          label: '意见影响人'
        },{
          value: 3,
          label: '商务决策人'
        },{
          value: 4,
          label: '使用人'
        },

        ],
        options1: [{
          value1: '0',
          label: '初次认识'
        }, {
          value1: 1,
          label: '一般关系'
        }, {
          value1: 2,
          label: '朋友关系'
        },{
          value1: 3,
          label: '好友关系'
        },
        ],
        input:'',
        value: '',
        value1:'',
        value2: '',
        dataListLoading:false,
        dataListSelections: [],
        visible : false,
        dataForm: {
          id: 0,
          name: '',
          client:'',
          sex: '0',
          mobile: '',
          location: '',
          birthday: '',
          duty: '',
          department: '',
          serial: '',
          roleRelation: '',
          density: '',
          remarks: '',
          versionNo: '',
          createBy: '',
          createTime: '',
          updateBy: '',
          updateTime: '',
          deleteFlag: '',
          sort: '',
          linkmDitch: '',
          clientId: '',
          opportunityId: '',
        },
        dataRule: {
          name:[
            { validator: validatename, trigger: 'blur' },
          ],
          // email:[
          //   { validator: validateemail, trigger: 'blur' },
          //   { pattern: /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/, message: '邮箱格式不正确',trigger: 'blur' }
          // ],
          mobile:[
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
      //弹出表格数据
      deparPname() {
        API.crmmarketclient.list().then(({data}) => {
          //////console.log(data)
          //给弹出框表格赋值
          this.gridData = data.data.list;
        })
      },
      handleCurrentChange(val) {
        //////console.log(val)
        this.currentRow = val;
        this.dataForm.client = val.name;
        this.dataForm.clientId=val.id
      },
      //弹出表格数据搜素
      searchclientName(){
        var name=this.clientName
        //////console.log(name)
        API.crmmarketclient.infoname(name).then(({data}) => {
          this.gridData = data;
          //////console.log(data)
        })
      },
      //列表
      getMyList(){
        this.dataListLoading=true
        var parms={
          page: this.pageIndex,
          limit: this.pageSize,
          sidx: this.sortData.sidx,
          order: this.sortData.order
        }
        //联系人关系
        if(this.value!=""){
          parms.roleRelation=this.value
        }
        //亲密程度
        if(this.value1!=""){
          parms.density=this.value1
        }
        //
        if(this.input!=""){
          parms.name=this.input
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
        API.crmmarketlinkm.mylist(parms).then(({data}) =>{
          //////console.log(data)
          if (data && data.code === 0) {
            for(var i=0;i<data.data.list.length;i++){
              if(data.data.list[i].roleRelation==0){
                data.data.list[i].roleRelation="经办人"
              }else if(data.data.list[i].roleRelation==1){
                data.data.list[i].roleRelation="决策人"
              }else if(data.data.list[i].roleRelation==2){
                data.data.list[i].roleRelation="意见影响人"
              }else if(data.data.list[i].roleRelation==3){
                data.data.list[i].roleRelation="商务决策人"
              }else {
                data.data.list[i].roleRelation="使用人"
              }
              if(data.data.list[i].sex==0){
                data.data.list[i].sex="男"
              }else {
                data.data.list[i].sex="女"
              }

              if(data.data.list[i].density==0){
                data.data.list[i].density="初次认识"
              }else if(data.data.list[i].density==1){
                data.data.list[i].density="一般关系"
              }else if(data.data.list[i].density==2){
                data.data.list[i].density="朋友关系"
              }else{
                data.data.list[i].density="好友关系"
              }
              if(data.data.list[i].linkmDitch==0){
                data.data.list[i].linkmDitch="广告"
              }else if(data.data.list[i].linkmDitch==1){
                data.data.list[i].linkmDitch="在线市场"
              }else if(data.data.list[i].linkmDitch==2){
                data.data.list[i].linkmDitch="员工介绍"
              }else{
                data.data.list[i].linkmDitch="外部介绍"
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
        API.crmmarketlinkm.info(id).then(({data}) => {
          if(data.data.roleRelation==0){
            this.dataForm.roleRelation="经办人"
          }else if(data.data.roleRelation==1){
            this.dataForm.roleRelation="决策人"
          }else if(data.data.roleRelation==2){
            this.dataForm.roleRelation="意见影响人"
          }else if(data.data.roleRelation==3){
            this.dataForm.roleRelation="商务决策人"
          }else{
            this.dataForm.roleRelation="使用人"
          }
          if(data.data.density==0){
            this.dataForm.density="初次认识"
          }else if(data.data.density==1){
            this.dataForm.density="一般关系"
          }else if (data.data.density==2) {
            this.dataForm.density="朋友关系"
          }else {
            this.dataForm.density="好友关系"
          }
          if(data.data.linkmDitch==0){
            this.dataForm.linkmDitch="广告"
          }else if(data.data.linkmDitch==1){
            this.dataForm.linkmDitch="在线市场"
          }else if (data.data.linkmDitch==2) {
            this.dataForm.linkmDitch="员工介绍"
          }else {
            this.dataForm.linkmDitch="外部介绍"
          }
          if(data.data.sex==0){
            // this.dataForm.sex="男"
          }else {
            // this.dataForm.sex="女"
          }
          //////console.log(data)
          this.dataForm.id=data.data.id,
            this.dataForm.name = data.data.name,
            this.dataForm.sex = data.data.sex,
            this.dataForm.mobile = data.data.mobile,
            this.dataForm.birthday = data.data.birthday,
            this.dataForm.location = data.data.location,
            this.dataForm.duty = data.data.duty,
            this.dataForm.department = data.data.department,
            this.dataForm.serial = data.data.serial,
            this.dataForm.clientId = data.data.clientId,
            this.dataForm.opportunityId = data.data.opportunityId,
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
        if(this.dataForm.roleRelation="经办人"){
          this.dataForm.roleRelation=0
        }else if(this.dataForm.roleRelation="决策人"){
          this.dataForm.roleRelation=1
        }else if(this.dataForm.roleRelation="意见影响人"){
          this.dataForm.roleRelation=2
        }else if(this.dataForm.roleRelation="商务决策人"){
          this.dataForm.roleRelation=3
        }else {
          this.dataForm.roleRelation=4
        }
        if(this.dataForm.sex=="男"){
          this.dataForm.sex=0
        }else {
          this.dataForm.sex=1
        }

        if(this.dataForm.density="初次认识"){
          this.dataForm.density=0
        }else if(this.dataForm.density="一般关系"){
          this.dataForm.density=1
        }else if (this.dataForm.density="朋友关系") {
          this.dataForm.density=2
        }else {
          this.dataForm.density=3
        }
        if(this.dataForm.linkmDitch="广告"){
          this.dataForm.linkmDitch=0
        }else if(this.dataForm.linkmDitch="在线市场"){
          this.dataForm.linkmDitch=1
        }else if (this.dataForm.linkmDitch="员工介绍") {
          this.dataForm.linkmDitch=2
        }else {
          this.dataForm.linkmDitch=3
        }
        var parms={
          id: this.dataForm.id || undefined,
          name:this.dataForm.name,
          sex: this.dataForm.sex,
          mobile: this.dataForm.mobile,
          birthday: this.dataForm.birthday,
          location: this.dataForm.location,
          duty:this.dataForm.duty,
          department:this.dataForm.department,
          serial:this.dataForm.serial,
          roleRelation: this.dataForm.roleRelation,
          linkmDitch:this.dataForm.linkmDitch,
          remarks: this.dataForm.remarks,
          density: this.dataForm.density,
          versionNo: this.dataForm.versionNo,
          createBy: this.dataForm.createBy,
          createTime: this.dataForm.createTime,
          updateBy: this.dataForm.updateBy,
          updateTime: this.dataForm.updateTime,
          deleteFlag: this.dataForm.deleteFlag,
          sort: this.dataForm.sort,
          clientId:this.dataForm.clientId,
          opportunityId:this.dataForm.opportunityId
        }
        //////console.log(parms)
        this.$refs[formName].validate((valid) => {
          if (valid) {
            var tick = !this.dataForm.id
              ? API.crmmarketlinkm.add(parms)
              : API.crmmarketlinkm.update(parms);
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
          API.crmmarketlinkm.del(ids).then(({data}) => {
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

