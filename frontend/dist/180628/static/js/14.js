webpackJsonp([14,36],{BVMK:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n=a("mvHQ"),l=a.n(n),r=a("gyMJ"),i={data:function(){return{pathUrl:this.$route.path.split("/")[this.$route.path.split("/").length-1],queryGeneratorModulesList:[],busConfig:this.busConfig,sysurl:window.SITE_CONFIG.baseUrl,visible:!1,dataForm:{tableName:"",modulesId:"",engine:"",tableComment:"",versionNo:"",createBy:"",createTime:"",updateBy:"",updateTime:"",deleteFlag:"",sort:""},dataRule:{tableName:[{required:!0,message:"表名不能为空",trigger:"blur"}],modulesId:[{required:!0,message:"模块名不能为空",trigger:"blur"}],tableComment:[{required:!0,message:"表备注不能为空",trigger:"blur"}],deleteFlag:[{required:!0,message:"状态不能为空",trigger:"blur"}]}}},methods:{init:function(e){var t=this;this.visible=!0,r.a.generatormodules.queryGeneratorModulesList().then(function(e){var a=e.data;a&&0===a.code?t.queryGeneratorModulesList=a.data:t.queryGeneratorModulesList=[]}),this.$nextTick(function(){t.$refs.dataForm.resetFields(),t.dataForm.tableName=e.tableName,t.dataForm.tableComment=e.tableComment})},dataFormSubmit:function(){var e=this;this.$refs.dataForm.validate(function(t){if(t){var a={tableName:e.dataForm.tableName,engine:e.dataForm.engine,tableComment:e.dataForm.tableComment,modulesId:e.dataForm.modulesId,createTime:e.dataForm.createTime,sort:e.dataForm.sort};(e.dataForm.id?r.a.generator.update(l()([a])):r.a.generator.add(l()([a]))).then(function(t){var a=t.data;a&&0===a.code?e.$message({message:"操作成功",type:"success",duration:1500,onClose:function(){e.visible=!1,e.$emit("refreshDataList")}}):e.$message.error(a.msg)})}})}}},o={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{attrs:{title:e.dataForm.id?"修改":"新增","close-on-click-modal":!1,visible:e.visible},on:{"update:visible":function(t){e.visible=t}}},[a("el-form",{ref:"dataForm",attrs:{model:e.dataForm,rules:e.dataRule,"label-width":"80px"},nativeOn:{keyup:function(t){if(!("button"in t)&&e._k(t.keyCode,"enter",13,t.key))return null;e.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"表名",prop:"tableName"}},[a("el-input",{attrs:{placeholder:"表名"},model:{value:e.dataForm.tableName,callback:function(t){e.$set(e.dataForm,"tableName",t)},expression:"dataForm.tableName"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"模块名称",prop:"modulesId"}},[a("el-select",{staticStyle:{width:"100%"},attrs:{placeholder:"请选择"},model:{value:e.dataForm.modulesId,callback:function(t){e.$set(e.dataForm,"modulesId",t)},expression:"dataForm.modulesId"}},e._l(e.queryGeneratorModulesList,function(e){return a("el-option",{key:e.name,attrs:{label:e.theme,value:e.id}})}))],1),e._v(" "),a("el-form-item",{attrs:{label:"表注释",prop:"tableComment"}},[a("el-input",{attrs:{placeholder:"表注释"},model:{value:e.dataForm.tableComment,callback:function(t){e.$set(e.dataForm,"tableComment",t)},expression:"dataForm.tableComment"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"状态",prop:"deleteFlag"}},[a("el-select",{staticStyle:{width:"100%"},attrs:{placeholder:"请选择"},model:{value:e.dataForm.deleteFlag,callback:function(t){e.$set(e.dataForm,"deleteFlag",t)},expression:"dataForm.deleteFlag"}},e._l(e.busConfig.deleteflag.list,function(e){return a("el-option",{key:e.confName,attrs:{label:e.confName,value:e.confVue}})}))],1)],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.visible=!1}}},[e._v("取消")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){e.dataFormSubmit()}}},[e._v("确定")])],1)],1)},staticRenderFns:[]},s=a("VU/8")(i,o,!1,null,null,null);t.default=s.exports},rioc:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n=a("mvHQ"),l=a.n(n),r=a("gyMJ"),i={data:function(){return{pathUrl:this.$route.path.split("/")[this.$route.path.split("/").length-1],dataForm:{tableName:""},picked:"202181",dataList:[],pageIndex:1,pageSize:10,totalPage:0,dataListLoading:!1,dataListSelections:[],addOrUpdateVisible:!1,url:window.SITE_CONFIG.baseUrl}},components:{AddOrUpdate:a("BVMK").default},mounted:function(){this.getDataList()},methods:{getDataList:function(){var e=this;this.dataListLoading=!0;var t={page:this.pageIndex,limit:this.pageSize,tableName:this.dataForm.tableName};r.a.generator.list(t).then(function(t){var a=t.data;a&&0===a.code?(e.dataList=a.data.list,e.totalPage=a.data.totalCount):(e.dataList=[],e.totalPage=0),e.dataListLoading=!1})},sizeChangeHandle:function(e){this.pageSize=e,this.pageIndex=1,this.getDataList()},currentChangeHandle:function(e){this.pageIndex=e,this.getDataList()},selectionChangeHandle:function(e){this.dataListSelections=e},addOrUpdateHandle:function(e){var t=this;this.addOrUpdateVisible=!0,this.$nextTick(function(){t.$refs.addOrUpdate.init(e)})},generate:function(e){var t=this,a=e?[e]:this.dataListSelections.map(function(e){return e.tableName});this.$confirm("确定对[id="+a.join(",")+"]进行["+(e?"生成":"批量生成")+"]操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){location.href=t.url+"/sys/generator/code?tables="+l()(a)})},deleteHandle:function(e){var t=this,a=e?[e]:this.dataListSelections.map(function(e){return e.id});this.$confirm("确定对[id="+a.join(",")+"]进行["+(e?"删除":"批量删除")+"]操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){r.a.generator.del(a).then(function(e){var a=e.data;a&&0===a.code?t.$message({message:"操作成功",type:"success",duration:1500,onClose:function(){t.getDataList()}}):t.$message.error(a.msg)})})}}},o={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"mod-generator"},[a("el-form",{attrs:{inline:!0,model:e.dataForm},nativeOn:{keyup:function(t){if(!("button"in t)&&e._k(t.keyCode,"enter",13,t.key))return null;e.getDataList()}}},[a("el-form-item",[a("el-input",{attrs:{placeholder:"表名",clearable:""},model:{value:e.dataForm.tableName,callback:function(t){e.$set(e.dataForm,"tableName",t)},expression:"dataForm.tableName"}})],1),e._v(" "),a("el-form-item",[a("el-button",{on:{click:function(t){e.getDataList()}}},[e._v("查询")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){e.generate()}}},[e._v("生成")])],1)],1),e._v(" "),a("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.dataListLoading,expression:"dataListLoading"}],staticStyle:{width:"100%"},attrs:{data:e.dataList,border:""},on:{"selection-change":e.selectionChangeHandle}},[a("el-table-column",{attrs:{type:"selection","header-align":"center",align:"center",width:"50"}}),e._v(" "),a("el-table-column",{attrs:{prop:"tableName","header-align":"center",align:"center",label:"表名"}}),e._v(" "),a("el-table-column",{attrs:{prop:"engine","header-align":"center",align:"center",label:"Engine"}}),e._v(" "),a("el-table-column",{attrs:{prop:"tableComment","header-align":"center",align:"center",label:"表备注"}}),e._v(" "),a("el-table-column",{attrs:{prop:"createTime","header-align":"center",align:"center",label:"创建时间"}}),e._v(" "),a("el-table-column",{attrs:{fixed:"right","header-align":"center",align:"center",width:"150",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){e.addOrUpdateHandle(t.row)}}},[e._v("导入本地")])]}}])})],1),e._v(" "),a("el-pagination",{attrs:{"current-page":e.pageIndex,"page-sizes":[10,20,50,100],"page-size":e.pageSize,total:e.totalPage,layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.sizeChangeHandle,"current-change":e.currentChangeHandle}}),e._v(" "),e.addOrUpdateVisible?a("add-or-update",{ref:"addOrUpdate",on:{refreshDataList:e.getDataList}}):e._e()],1)},staticRenderFns:[]},s=a("VU/8")(i,o,!1,null,null,null);t.default=s.exports}});