$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'lyuser/local/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'userId', hidden: true, index: 'user_id', width: 50, key: true },
			{ label: '用户名', name: 'username', index: 'username', width: 80 },
            // { label: '密码', name: 'password', index: 'password', width: 80 },
            { label: '手机号', name: 'mobile', index: 'mobile', width: 80 },
            // { label: '邮箱', name: 'email', index: 'email', width: 80 },
			{ label: '地址', name: 'address', index: 'address', width: 80 },
			{ label: '余额', name: 'price', index: 'price', width: 80 },
			{ label: '积分', name: 'integral', index: 'integral', width: 80 },
			{ label: '注册时间', name: 'createTime', index: 'create_time', width: 80 },
			{ label: '状态', name: 'status', index: 'status', width: 80, width: 60, formatter: function(value, options, row){
				return value === 0 ? 
					'<span class="label label-danger">禁用</span>' : 
					'<span class="label label-success">正常</span>';
			}},
			//{ label: '类型', name: 'type', index: 'type', width: 80 }
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
		 q:{
	            username: null,
	            mobile: null,
	            type: null
		 },
		showList: true,
		showCar: false,
		showLife: false,
		showHouse: false,
		title: null,
		lyUser: {},
		carList:[],
		lifeList:[],
		houseList:[]
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.lyUser = {
					type: 0
			};
		},
		update: function (event) {
			var userId = getSelectedRow();
			if(userId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            vm.getInfo(userId);
		},
		saveOrUpdate: function (event) {
			var url = vm.lyUser.userId == null ? "lyuser/save" : "lyuser/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.lyUser),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var userIds = getSelectedRows();
			if(userIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "lyuser/delete",
				    contentType: "application/json",
				    data: JSON.stringify(userIds),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(userId){
			$.get(baseURL + "lyuser/localinfo/"+userId, function(r){
				vm.lifeList = r.lifeList;
				vm.houseList = r.houseList;
				vm.carList = r.carList;
				if(vm.carList != null){
					vm.showCar = true;
				}
				if(vm.lifeList != null){
					vm.showLife = true;
				}
				if(vm.houseList != null){
					vm.showHouse = true;
				}
                vm.lyUser = r.lyUser;
            });
		},
		reload: function (event) {
			vm.showList = true;
			vm.showCar = false;
			vm.showLife = false;
			vm.showHouse = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
				postData:{'username': vm.q.username, 'mobile': vm.q.mobile},
                page:page
            }).trigger("reloadGrid");
		}
	}
});