$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'demand/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true, hidden:true },
			{ label: '联系人', name: 'name', index: 'name', width: 80 },
			{ label: '联系电话', name: 'phone', index: 'phone', width: 80 },
			{ label: '区域', name: 'region', index: 'region', width: 80 },
			{ label: '价格', name: 'price', index: 'price', width: 80 },
			//：1.一室一厅，2.二室一厅，3.三房两厅，4.其他
			{ label: '户型', name: 'houseType', index: 'house_type', width: 80 },
			//{ label: '平方数', name: 'square', index: 'square', width: 80 },
			//：1.住宅,2.公寓,3.别墅,4.商铺,5.车位,6.写字楼,7.其他
			//{ label: '类型', name: 'type', index: 'type', width: 80 },
			{ label: '楼龄', name: 'buildingAge', index: 'building_age', width: 80 },
			{ label: '楼层', name: 'floor', index: 'floor', width: 80 },
			{ label: '配置', name: 'decoration', index: 'decoration', width: 80 },
			{ label: '房源标签', name: 'label', index: 'label', width: 80 },
            { label: '房需类型', name: 'demandType', index: 'demand_type', width: 80},
			// { label: '创建人', name: 'createBy', index: 'create_by', width: 80 },
			{ label: '创建时间', name: 'createDate', index: 'create_date', width: 80 ,formatter:dateFormat},
			// { label: '更新人', name: 'updateBy', index: 'update_by', width: 80 },
			// { label: '更新时间', name: 'updateDate', index: 'update_date', width: 80 },
			//{ label: '备注', name: 'remarks', index: 'remarks', width: 80 },
            {label:'查看详情',name:'id',index:'id',width:60,
                formatter:function(value,options,row){
                    return '<a onclick="vm.showImfoButton('+ value +')">详情</a>'
                }
            }
			// { label: '删除标志', name: 'delFlag', index: 'del_flag', width: 80 }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{demandType : ''},
		showList: true,
		showInfo:false,
		title: null,
		demand: {}
	},
	methods: {
        importNum:function () {
            var _this = this;
            var file=_this.$refs.file.files[0]
			var files = _this.$refs.file.files;
            console.log(file);
            console.log(files);
            debugger
            // if(file.type+"" === "application/vnd.ms-excel"
            //     || file.type+"" === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
            //     var formData = new FormData();
            //     formData.append('file',file);
            //     $.ajax({
            //         url: baseURL+'demand/uploadResource',
            //         type: 'POST',
            //         cache: false,
            //         data: formData,
            //         processData: false,
            //         contentType: false
            //     }).done(function(res) {
            //         alert(res.msg);
            //     }).fail(function(res){});
            // }else{
            //     alert('文件类型必须为:"*.xls"或"*.xlsx"');
            // }
        },
        showImfoButton:function (id) {
			var _this = this;
			_this.showInfo = true;
			_this.showList = false;
			_this.getInfo(id)
        },
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.demand = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.demand.id == null ? "demand/save" : "demand/update";
			AjaxLoadingPostJson(url,JSON.stringify(vm.demand),function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}			
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
			
			   AjaxLoadingPostJson("demand/delete" ,JSON.stringify(ids),function(r){
					if(r.code == 0){
						alert('操作成功', function(index){
							$("#jqGrid").trigger("reloadGrid");
						});
					}else{
						alert(r.msg);
					}			
				});
			});
		},
        // 删除需求信息
        delData: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}

			confirm('确定要删除选中的记录？', function(){

			   AjaxLoadingPostJson("demand/delData" ,JSON.stringify(ids),function(r){
					if(r.code == 0){
						alert('操作成功', function(index){
							$("#jqGrid").trigger("reloadGrid");
						});
					}else{
						alert(r.msg);
					}
				});
			});
		},
		getInfo: function(id){
			$.get(baseURL + "demand/info/"+id, function(r){
                vm.demand = r.demand;
            });
		},
		reload: function (event) {
			vm.showList = true;
            vm.showInfo = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page,
                 postData:vm.q,
            }).trigger("reloadGrid");
		}
	},
	mounted:function () {
		var self = this;
	}
});