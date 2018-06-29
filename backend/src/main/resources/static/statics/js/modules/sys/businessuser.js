$(function () {
	vm.getDept();//加载部门树
	vm.getStatus();//加载状态等信息
    $("#jqGrid").jqGrid({
        url: baseURL + 'businessuser/list',
        datatype: "json",
        colModel: [			
			{ label: '用户名', name: 'username', index: 'username', width: 80 }, 
			{ label: '所属部门', name: 'deptId', index: 'deptId', width: 80,formatter: "select", editoptions:{value:getDeptName()} },
			{ label: '详细地址', name: 'detailedAddress', index: 'detailedAddress', width: 80 },
			{ label: '手机号', name: 'mobile', index: 'mobile', width: 80 }, 			
			{ label: '状态', name: 'buserStatus', index: 'userType', width: 80,formatter: "select", editoptions:{value:getState()} }, 			
			{ label: '是否登录', name: 'landing', index: 'landing', width: 80,formatter: "select", editoptions:{value:getLandingState()} },
			{ label: '用户类型', name: 'userType', index: 'userType', width: 80,formatter: "select", editoptions:{value:getTypeState()} }	
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
function getDeptName(){
	var str = "";
	
	//获取商家id与名字
	var obj = vm.deptList;
	console.log(obj);
	for(var i = 0; i < obj.length; i++){
		if(str == "")
			str += obj[i].deptId + ":" + obj[i].name;
		else
			str += ";" + obj[i].deptId + ":" + obj[i].name;
	}
	console.log(str);
	return str;
}
function getState(){
	var str = "";
	//获取参数表的参数值和参数名
	var obj = vm.sysConfigEntityStatusList;

	for(var i = 0; i < obj.length; i++){
		if(str == "")
			str += obj[i].value + ":" + obj[i].key;
		else
			str += ";" + obj[i].value + ":" + obj[i].key;
	}
	return str;
}
function getLandingState(){
	var str = "";
	//获取参数表的参数值和参数名
	var obj = vm.sysConfigEntityLandingList;
	for(var i = 0; i < obj.length; i++){
		if(str == "")
			str += obj[i].value + ":" + obj[i].key;
		else
			str += ";" + obj[i].value + ":" + obj[i].key;
	}

	return str;
}
function getTypeState(){
	var str = "";
	//获取参数表的参数值和参数名
	var obj = vm.sysConfigEntityTypeList;
	for(var i = 0; i < obj.length; i++){
		if(str == "")
			str += obj[i].value + ":" + obj[i].key;
		else
			str += ";" + obj[i].value + ":" + obj[i].key;
	}

	return str;
}
var setting = {
	    data: {
	        simpleData: {
	            enable: true,
	            idKey: "deptId",
	            pIdKey: "parentId",
	            rootPId: -1
	        },
	        key: {
	            url:"nourl"
	        }
	    }
};
var ztree;
var vm = new Vue({
	el:'#rrapp',
	data:{
		q: {
			username:null,
			userType:null,
			test: null,
			modify:false			
		},
		addrId:null,
		citysId:null,
		districtsId: null,
		showList:true,
		isModify:true,
		title: null,
		businessUser: {},
		address:{},
	    citys:{},
	    districts:{},
		sysConfigEntityStatusList: {},
		sysConfigEntityLandingList: {},
		sysConfigEntityTypeList: {},
		dept:{
            name:null,
            parentId:0,
            orderNum:0
        },
        newPassword:null,
        deptList:{}
	},
	methods: {
		findproven: function(){
			$.ajax({
				type: "POST",
			    url: baseURL + "shoporder/findAddress",
			    data: {id:null},
			    dataType: "json",
			    success: function(r){
			    	vm.address=r.sysArea;
				}
			});
		},
		findCity: function(value){
			vm.businessUser.province = $("#province option:selected").text();
			console.log($("#province option:selected").text());
			$.ajax({
				type: "POST",
			    url: baseURL + "shoporder/findAddress",
			    data: {id:vm.addrId},
			    dataType: "json",
			    success: function(r){
			    	vm.citys=r.sysArea;
				}
			});
		},
		findDistrict: function(){
			vm.businessUser.city = $("#city option:selected").text();
			console.log($("#city option:selected").text());
			var data="id="+vm.citys.id;
			$.ajax({
				type: "POST",
			    url: baseURL + "shoporder/findAddress",
			    data: {id:vm.citysId},
			    dataType: "json",
			    success: function(r){
			    	vm.districts=r.sysArea;
				}
			});
		},
		setDistrict: function(){
			vm.businessUser.district = $("#district option:selected").text();
			console.log(vm.businessUser.district);
		},
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.modify = false;
			vm.showList = false;
			vm.isModify = true;
			vm.title = "新增";
			vm.businessUser = {};
			vm.findproven();
		},
		update: function (event) {
			
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.modify = true;
			vm.showList = false;
			vm.isModify = false;
            vm.title = "修改";
            vm.findproven();
            vm.getInfo(id);
            
		},
		saveOrUpdate: function (event) {
			var url = vm.businessUser.id == null ? "businessuser/save" : "businessuser/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.businessUser),
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
		isEnable: function(event){
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要启用选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "businessuser/isEnable",
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
		isDisable: function(event){
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要启用选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "businessuser/isDisable",
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
		isExist: function(){
			if(vm.businessUser.mobile != null){
				var reg = /^1[3|4|5|7|8][0-9]{9}$/;
				var flag = reg.test(vm.businessUser.mobile);
				if(flag){
					if(!vm.modify){//判断是否是新增页面
						//判断该手机号是否已经存在
						$.get(baseURL + "businessuser/isExistPhone?phone="+vm.businessUser.mobile, function(r){
							if(r.code != 0){
								alert(r.msg);
							}
			            });
					}
				}else{
					alert("手机号格式不正确!");
				}
			}else{
				alert("手机号不能为空!");
			}
		},
		/*isExistName: function(){
			if(vm.businessUser.username != null){
				if(!vm.modify){//判断是否是新增页面
					//判断该用户名是否已经存在
					$.get(baseURL + "businessuser/isExistName?username="+vm.businessUser.username, function(r){
						if(r.code != 0){
							alert(r.msg);
						}
		            });
				}
			}else{
				alert("用户名不能为空!");
			}
		},*/
		getInfo: function(id){
			$.get(baseURL + "businessuser/info/"+id, function(r){
				vm.businessUser = r.businessUser;
				vm.sysConfigEntityStatusList = r.sysConfigEntityStatusList;
                vm.sysConfigEntityLandingList = r.sysConfigEntityLandingList;
                vm.sysConfigEntityTypeList = r.sysConfigEntityTypeList;
                $.get(baseURL + "sys/dept/info/"+vm.businessUser.deptId, function(r){
                    vm.dept = r.dept;
                    vm.getDept();
                });
    			
                
                var province=$("#province option").length;
                for(var i=0;i<province;i++){//遍历省           
                	if($("#province").get(0).options[i].text == vm.businessUser.province){ 
                         vm.addrId = $("#province").get(0).options[i].value;
                         $.ajax({
             				type: "POST",
             			    url: baseURL + "shoporder/findAddress",
             			    data: {id:vm.addrId},
             			    dataType: "json",
             			    success: function(r){
             			    	vm.citys=r.sysArea;
             			    	for(var i = 0; i < vm.citys.length;i++){//遍历市
             			    		if(vm.citys[i].name == vm.businessUser.city){
             			    			vm.citysId = vm.citys[i].id;
             			    			$.ajax({
	             			   				type: "POST",
	             			   			    url: baseURL + "shoporder/findAddress",
	             			   			    data: {id:vm.citysId},
	             			   			    dataType: "json",
	             			   			    success: function(r){
	             			   			    	vm.districts=r.sysArea;
	             			   			    	console.log(vm.districts);
	             			   			    	for(var i = 0; i < vm.districts.length;i++){//遍历区
	             			   			    		if(vm.districts[i].name == vm.businessUser.district){
	             			   			    			vm.districtsId = vm.districts[i].id;
	             			   			    			break;
	             			   			    		}
	             			   			    	}
	             			   				}
             			   			    });
             			    			break;
             			    		}
             			    	}
             				}
             			});
                        break;  
                     }  
                 }
               
            });
		},
		getStatus: function(){
			$.ajax({  
		        type: "post",         
		        url: baseURL + "businessuser/status",  
		        async: false,  
		        success: function (r) {
		        	 vm.sysConfigEntityStatusList = r.sysConfigEntityStatusList;
		                vm.sysConfigEntityLandingList = r.sysConfigEntityLandingList;
		                vm.sysConfigEntityTypeList = r.sysConfigEntityTypeList;
		        }
		    });
			
		},
		getDept: function(){
			//加载部门树
			$.ajax({  
		        type: "post",         
		        url: baseURL + "sys/dept/select",
		        async: false,  
		        success: function (r) {
		        	vm.deptList = r.deptList;
	                ztree = $.fn.zTree.init($("#deptTree"), setting, r.deptList);
	                var node = ztree.getNodeByParam("deptId", vm.dept.parentId);
	                ztree.selectNode(node);

	                vm.dept.name = node.name;
	                console.log(vm.dept.name);
	                console.log(node.name);
		        }
		    });
        },
        getSysConfig: function(){
        	 $.get(baseURL + "sys/dept/select", function(r){
                 ztree = $.fn.zTree.init($("#deptTree"), setting, r.deptList);
                 var node = ztree.getNodeByParam("deptId", vm.dept.parentId);
                 ztree.selectNode(node);

                 vm.dept.name = node.name;
             })
        },
		deptTree: function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择部门",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#deptLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    //选择上级部门
                    vm.businessUser.deptId = node[0].deptId;
                    vm.dept.name = node[0].name;
                    layer.close(index);
                }
            });
        },
        resetPassword: function(){
        	var id = getSelectedRow();
			if(id == null){
				return ;
			}
			$.get(baseURL + "businessuser/resetPassword/"+id, function(r){
				vm.businessUser = r.businessUser;
				vm.businessUser.password = "";
				vm.newPassword = "";
            });
        	layer.open({
				type: 1,
				skin: 'layui-layer-molv',
				title: "修改密码",
				area: ['550px', '270px'],
				shadeClose: false,
				content: jQuery("#passwordLayer"),
				btn: ['修改','取消'],
				btn1: function (index) {
					console.log(vm.test);
					var data = "id="+vm.businessUser.id+"&password="+vm.businessUser.password+"&newPassword="+vm.newPassword;
					$.ajax({
						type: "POST",
					    url: baseURL + "businessuser/updatePassword",
					    data: data,
					    dataType: "json",
					    success: function(r){
							if(r.code == 0){
								alert('操作成功', function(index){
									location.reload();
								});
							}else{
								alert(r.msg);
							}
						}
					});
	            }
			});
		},
		correctPassword:function(){//校验密码格式是否正确
			if(vm.businessUser.password != null){
				var reg = /^[A-Za-z0-9]{6,12}$/;
				var flag = reg.test(vm.businessUser.password);
				if(!flag){
					alert("密码是6到12个的数字或字母!");
				}
			}else{
				alert("密码不能为空");
			}
			
		},
		reload: function () {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
				postData:{
					'username': vm.q.username,
					'userType':vm.q.userType
				},
                page:page
            }).trigger("reloadGrid");
		}
	}
});