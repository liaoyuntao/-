$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'housesource/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
						   	{ label: '区域,地址', name: 'region', index: 'region', width: 80 }, 						
						   	{ label: '联系人', name: 'name', index: 'name', width: 80 }, 						
						   	{ label: '联系电话', name: 'phone', index: 'phone', width: 80 }, 						
						   	{ label: '面积(平方米)', name: 'square', index: 'square', width: 80 }, 						
						   	{ label: '类型', name: 'houseStyle', index: 'house_style', width: 80 },
						   	{ label: '户型', name: 'houseType', index: 'house_type', width: 80 },
						   	//{ label: '朝向', name: 'orientation', index: 'orientation', width: 80 },
						   //	{ label: '楼龄(年)', name: 'buildingAge', index: 'building_age', width: 80 },
						   //	{ label: '提供人类型', name: 'providerType', index: 'provider_type', width: 80 },
						   	{ label: '楼层', name: 'floor', index: 'floor', width: 80 }, 						
						   	/*{ label: '楼高(总层数)', name: 'houseHeight', index: 'house_height', width: 80 },*/
						   	//{ label: '架构', name: 'houseFrame', index: 'house_frame', width: 80 },
						   	{ label: '电梯', name: 'hasElevator', index: 'has_elevator', width: 80 },
						   	{ label: '价格', name: 'price', index: 'price', width: 80 },
						   	//{ label: '装修', name: 'decoration', index: 'decoration', width: 80 },
						   	//{ label: '房源标签', name: 'label', index: 'label', width: 80 },
						   //	{ label: '房源图片', name: 'imagePath', index: 'image_path', width: 80 },
						   //	{ label: '房源描述', name: 'describe', index: 'describe', width: 80 },
						   	{ label: '模块', name: 'module', index: 'module', width: 80 },
                            { label: '创建时间', name: 'createDate', index: 'create_date', width: 80,formatter:dateFormat },
            //{ label: '配套设施', name: 'remarks', index: 'remarks', width: 80 },
            /*	{ label: '创建人', name: 'createBy', index: 'create_by', width: 80 },

                { label: '更新人', name: 'updateBy', index: 'update_by', width: 80 },
                { label: '更新时间', name: 'updateDate', index: 'update_date', width: 80 },

                { label: '删除标志', name: 'delFlag', index: 'del_flag', width: 80 },*/
						   	//{ label: '支付方式', name: 'payType', index: 'pay_type', width: 80 },
						   	//{ label: '其他(满二唯一,满五唯一,满五不唯一)', name: 'others', index: 'others', width: 80 },
						   	//{ label: '佣金方式', name: 'commissionType', index: 'commission_type', width: 80 },
            {label:'查看详情',name:'id',index:'id',width:60,
                formatter:function(value,options,row){
                    return '<a onclick="vm.showImfoButton('+ value +')">详情</a>'
                }
            }
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
		q:{module:''},
		showList: true,
		title: null,
		houseSource: {},
		imgs:[]
	},
	methods: {
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
			vm.houseSource = {};
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
			var url = vm.houseSource.id == null ? "housesource/save" : "housesource/update";
			AjaxLoadingPostJson(url,JSON.stringify(vm.houseSource),function(r){
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
			
			   AjaxLoadingPostJson("housesource/delete" ,JSON.stringify(ids),function(r){
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
			$.get(baseURL + "housesource/info/"+id, function(r){
                vm.houseSource = r.houseSource;
               var arr = vm.houseSource.imagePath.split(',');
               arr.pop();
               vm.imgs = arr;
            });
		},
		reload: function (event) {
			vm.showList = true;
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