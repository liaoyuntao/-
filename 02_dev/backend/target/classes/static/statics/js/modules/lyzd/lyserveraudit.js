$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'lyserver/auditlist',
        datatype: "json",
        colModel: [			
			//{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '服务名称', name: 'title', index: 'title', width: 80 }, 			
			{ label: '服务内容', name: 'content', index: 'content', width: 80 }, 			
			{ label: '地址', name: 'address', index: 'address', width: 80 }, 			
			{ label: '服务者', name: 'username', index: 'username', width: 80 }, 			
			//{ label: '分类id', name: 'classId', index: 'class_id', width: 80 }, 			
			{ label: '服务人数', name: 'presonNum', index: 'preson_num', width: 80 }, 			
			{ label: '服务价格/元', name: 'price', index: 'price', width: 80 }, 			
			{ label: '创建时间', name: 'createTime', index: 'create_time', width: 80 }, 			
			//{ label: '生活照url', name: 'lifeUrl', index: 'life_url', width: 80 }, 			
			//{ label: '专车接送照rl', name: 'carUrl', index: 'car_url', width: 80 }, 			
			//{ label: '房间照url', name: 'houseUrl', index: 'house_url', width: 80 }, 			
			{ label: '状态', name: 'status', index: 'status', width: 80, 
				formatter:function(value, options, row){
					return value === 0 ? 
							'<span class="label label-danger">待审核</span>':
							'<span class="label label-success">已审核</span>';
				}}, 			
			
//			{ label: '结果', name: 'audit', index: 'audit', width: 80 ,
//				formatter:function(value, options, row){
//					return value === 0 ? 
//							'<span class="label label-danger">驳回</span>' : 
//							'<span class="label label-success">通过</span>';
//				}			
//			}
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
		q:{title:"",price:"",classId:""},
		 serverIn:{},
	     classlist:[],
	    addServer:false,//添加服务页面
		showList: true,//查询.新增.修改类表单
		showRule:false,//查看详情
		showCar: false,
		showLife: false,
		showHouse: false,
	    //showMsg:false,
		title: null,//标题
		lyServer:{},
		carList:[],
		lifeList:[],
		houseList:[]	
	},
	//获取id 的方法
	mounted:function () {
		
		var url = "lyserverclass/getList";
		$.ajax({
			type: "GET",
		    url: baseURL + url,
		    contentType: "application/json",
		    success: function(r){
		    	if(r.code === 0){
		   
		    		vm.classlist = r.classlist;
	
				}else{
					alert(r.msg);
				}
			}
		});
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.showRule =false;
			vm.title = "新增";
			vm.addServer=true;
			vm.lyServer = {};
			//vm.reload();
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
			vm.addServer=true;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.lyServer.id == null ? "lyserver/save" : "lyserver/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.lyServer),
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
		saveConfig:function(event){
			vm.serverIn.status=1;
			vm.serverIn.audit=0;
			
			vm.showList = true;
			vm.addServer=false;
			vm.showRule=false;
			var url = "lyserver/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.serverIn),
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
		savePassConfig:function(event){
			vm.serverIn.status=1;
			vm.serverIn.audit=1;
			
			vm.showList = true;
			vm.addServer=false;
			vm.showRule=false;
			var url = "lyserver/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.serverIn),
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
		saveReject:function(event){
			vm.serverIn.status=1;
			vm.serverIn.audit=0;
			vm.showList = true;
			vm.addServer=false;
			vm.showRule=false;
			vm.reload();
		},
	    seein:function (event) {
	        var id = getSelectedRow();
			if(id == null){
				return ;
			}
            //console.log(ids);
            //页面转换
            //隐藏列表
			vm.showList = false;
            //展示信息
            vm.showRule=true;
            $.get(baseURL + "lyserver/infoById/"+id, function(r){
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
              //  console.log(r.lyserver)
                vm.serverIn=r.lyserver;
              //  console.log(vm.serverIn);
            });
	        },
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "lyserver/delete",
				    contentType: "application/json",
				    data: JSON.stringify(ids),
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
		getInfo: function(id){
			$.get(baseURL + "lyserver/info/"+id, function(r){
                vm.lyServer = r.lyServer;
            });
		},
		reload: function (event) {
			vm.showList = true;
			vm.addServer=false;
			vm.showRule=false;
			vm.showCar = false;
			vm.showLife = false;
			vm.showHouse = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
		/*		postData:{'title':vm.q.title,'price':vm.q.price, 'userId': vm.q.userId},*/
				postData:{'title':vm.q.title,'price':vm.q.price,'classId': vm.q.classId},
                page:page
            }).trigger("reloadGrid");
		}
	}
});