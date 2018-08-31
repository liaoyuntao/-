<template>
  <div style="margin-left: 10px;">
    <span class="demonstration">状态：</span>
    <el-select v-model="value" clearable placeholder="请选择">
      <el-option
        v-for="item in options"
        :key="item.value"
        :label="item.label"
        :value="item.value">
      </el-option>
    </el-select>
    <span class="demonstration">线索渠道：</span>
    <el-select v-model="value1" clearable placeholder="请选择">
      <el-option
        v-for="item in options1"
        :key="item.value1"
        :label="item.label"
        :value="item.value1">
      </el-option>
    </el-select>
    <span class="demonstration">创建时间：</span>
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
        prop="company"
        label="线索名称"
        width="180">
      </el-table-column>
      <el-table-column
        prop="mobile"
        label="手机"
        width="180">
      </el-table-column>
      <el-table-column
        prop="state"
        label="状态">
      </el-table-column>
      <el-table-column
        prop="belonger"
        label="归属人">
      </el-table-column>
      <el-table-column
        prop="clueDitch"
        label="线索渠道">
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
        <el-form-item label="线索名称"  prop="company">
          <el-input v-model="dataForm.company"   placeholder="线索名称" ></el-input>
        </el-form-item>
        <el-form-item label="手机" prop="mobile">
          <el-input v-model="dataForm.mobile" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="电话"  prop="phone">
          <el-input v-model="dataForm.phone" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="地址" prop="location">
          <el-input v-model="dataForm.location" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="状态" prop="state">
          <el-select v-model="dataForm.state" placeholder="请选择状态">
            <el-option label="已转化" value="0"></el-option>
            <el-option label="已关闭" value="1"></el-option>
            <el-option label="跟进中" value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="归属人" prop="belonger">
          <el-input v-model="dataForm.belonger" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注"  prop="remarks">
          <el-input v-model="dataForm.remarks" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="线索渠道" prop="clueDitch">
          <el-select v-model="dataForm.clueDitch" placeholder="请选择渠道">
            <el-option label="广告" value="0"></el-option>
            <el-option label="在线市场" value="1"></el-option>
            <el-option label="员工介绍" value="2"></el-option>
            <el-option label="外部介绍" value="3"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="visible = false">取 消</el-button>
        <el-button type="primary" @click="dataSubmit()">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
  import API from '@/api'
  import save from '@/components/generator/save.vue'
  export default {
    data() {
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
          label: '已转化'
        }, {
          value: 1,
          label: '已关闭'
        }, {
          value: 2,
          label: '跟进中'
        },],
        options1: [{
          value1: '0',
          label: '广告'
        }, {
          value1: 1,
          label: '在线市场'
        }, {
          value1: 2,
          label: '员工介绍 '
        },{
          value1: 3,
          label: '外部介绍'
        },
        ],
        value: '',
        value1:'',
        value2: '',
        dataListLoading:false,
        dataListSelections: [],
        visible : false,
        dataForm: {
          id: 0,
          company: '',
          mobile: '',
          phone: '',
          location: '',
          state: '',
          belonger: '',
          remarks: '',
          clueDitch: '',
          versionNo: '',
          createBy: '',
          createTime: '',
          updateBy: '',
          updateTime: '',
          deleteFlag: '',
          sort: '',
          // desc: ''
        },
        dataRule: {

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
      getMyList(){
        this.dataListLoading=true
        var parms={
          page: this.pageIndex,
          limit: this.pageSize,
          sidx: this.sortData.sidx,
          order: this.sortData.order
        }
        if(this.value!=""&&this.value==0){
          parms.state=this.value
        }
        //线索查询
        if(this.value1!=""){
          parms.clueDitch=this.value1
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
        API.crmmarketclue.derllist(parms).then(({data}) =>{

          //////console.log(data)
          if (data && data.code === 0) {
            for(var i=0;i<data.data.list.length;i++){
              if(data.data.list[i].state==0){
                data.data.list[i].state="已转化"
              }else if(data.data.list[i].state==1){
                data.data.list[i].state="已关闭"
              }else {
                data.data.list[i].state="跟进中"
              }
              if(data.data.list[i].clueDitch==0){
                data.data.list[i].clueDitch="广告"
              }else if(data.data.list[i].clueDitch==1){
                data.data.list[i].clueDitch="在线市场"
              }else if(data.data.list[i].clueDitch==2){
                data.data.list[i].clueDitch="员工介绍"
              }else{
                data.data.list[i].clueDitch="外部介绍"
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

      addClue(){
        this.visible = true;
        this.$nextTick(() => {
          this.$refs["dataForm"].resetFields();
        });
      },
      //修改
      handleClick(id){
        this.visible = true;
        API.crmmarketclue.info(id).then(({data}) => {
          if(data.data.state==0){
            this.dataForm.state="已转化"
          }else if(data.data.state==1){
            this.dataForm.state="已关闭"
          }else {
            this.dataForm.state="进行中"
          }
          if(data.data.clueDitch==0){
            this.dataForm.clueDitch="广告"
          }else if(data.data.clueDitch==1){
            this.dataForm.clueDitch="在线市场"
          }else if (data.data.clueDitch==2) {
            this.dataForm.clueDitch="员工介绍"
          }else {
            this.dataForm.clueDitch="外部介绍"
          }
          //////console.log(data)
          this.dataForm.id=data.data.id,
            this.dataForm.company = data.data.company,
            this.dataForm.mobile = data.data.mobile,
            this.dataForm.belonger = data.data.belonger,
            this.dataForm.location = data.data.location,
            // this.dataForm.state = data.data.state,
            // this.dataForm.clueDitch = data.data.clueDitch,
            this.dataForm.phone=data.data.phone
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
      dataSubmit () {
        if(this.dataForm.state="已转化"){
          this.dataForm.state=0
        }else if(this.dataForm.state="已关闭"){
          this.dataForm.state=1
        }else {
          this.dataForm.state=2
        }
        if(this.dataForm.clueDitch="广告"){
          this.dataForm.clueDitch=0
        }else if(this.dataForm.clueDitch="在线市场"){
          this.dataForm.clueDitch=1
        }else if (this.dataForm.clueDitch="员工介绍") {
          this.dataForm.clueDitch=2
        }else {
          this.dataForm.clueDitch=3
        }
        var parms={
          id: this.dataForm.id || undefined,
          company: this.dataForm.company,
          mobile: this.dataForm.mobile,
          belonger: this.dataForm.belonger,
          location: this.dataForm.location,
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
        var tick = !this.dataForm.id
          ? API.crmmarketclue.insert(parms)
          : API.crmmarketclue.update(parms);
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
          API.crmmarketclue.del(ids).then(({data}) => {
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
