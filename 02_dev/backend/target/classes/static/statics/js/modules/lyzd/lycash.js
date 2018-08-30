$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'lycash/list',
        datatype: "json",
        colModel: [			
			{ label: '用户名', name: 'username', index: 'username', width: 50 },
			{ label: '提现金额', name: 'price', index: 'price', width: 40 },
            { label: '账户金额', name: 'money', index: 'money', width: 40 },
            { label: '联系电话', name: 'mobile', index: 'mobile', width: 60 },
            { label: '用户类型', name: 'type', index: 'type', width: 40 ,formatter: function(value, options, row){
                return value === 0 ?
                    '<span >旅行者</span>' :
                    '<span >服务者</span>';
            }},
            { label: '提现方式', name: 'payWay', index: 'payWay', width: 30 ,formatter: function(value, options, row){
                return value === 0 ?
                    '<span class="label label-danger">微信</span>' :
                    '<span class="label label-success">支付宝</span>';
            }},
            { label: '提现状态', name: 'status', index: 'status', width: 50  ,formatter: function(value, options, row){
                return value === 0 ?
                    '<span class="label label-default">审核中</span>'
					:(value==1?'<span class="label label-success">审核通过</span>':'<span class="label label-danger">申请驳回</span>');
            }},
            { label: '创建时间', name: 'createTime', index: 'createTime', width: 60 },
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
			type:null
		},
		showList: true,
		title: null,
		lyCash: {},
		showRule:true,
        cashRule:{
			percent:50,
			minMany:200
		},
        selected: 'A',
		q:{
			type:9,
			statu:9
		},
        options: [
            { text: '选择用户类型', value: '9' },
            { text: '旅行者', value: '0' },
            { text: '服务者', value: '1' }
        ],
		status:[
            { text: '全部状态', value: '9' },
            { text: '待审核', value: '0' },
			{ text: '审核通过', value: '1' },
            { text: '审核驳回', value: '2' },

		]
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.lyCash = {};
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
			var url = vm.lyCash.id == null ? "lycash/save" : "lycash/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.lyCash),
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
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "lycash/delete",
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
			$.get(baseURL + "lycash/info/"+id, function(r){
                vm.lyCash = r.lyCash;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                postData:{'usertype': vm.q.type,'status':vm.q.statu},
                page:page
            }).trigger("reloadGrid");
		},
		//获取当地人提现记录
        localGet:function(){
			this.q.type=1;
            vm.reload();
		},
		//获取旅客提现记录
        otherGet:function(){
            this.q.type=0;
        	vm.reload();
		},
		//提现规则
        setRules:function(){
        	//查询提现规则
            $.get(baseURL + "lycash/getCashConfig", function(r){
            	console.log(r)
                vm.cashRule.percent = r.percent.value;
                vm.cashRule.minMany = r.minMany.value;
                vm.cashRule.space= r.space.value;
            });

            vm.showList = false;
            vm.title = "提现规则";
        },
		//保存修改后的提现规则
		saveRule:function(){
        	console.log( vm.cashRule)
			var end =  vm.cashRule;
        	if(end.minMany==''){
               alert('请输入最低提现金额');
        		return;
			}
            if(end.percent==''){
                alert('请输入提现百分比');
                return;
            }
            $.ajax({
                type: "POST",
                url: baseURL + "lycash/setCashConfig",
                contentType: "application/json",
                data: JSON.stringify(end),
                success: function(r){
                    if(r.code == 0){
                        alert('操作成功')
                    }else{
                        alert(r.msg);
                    }
                }
            });

		},
		//提现审核
        //同意提现
		audit:function(event){
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }
            console.log(ids);
            var send ={
            	audits:ids
			}
            confirm('确定审核通过？', function() {
                $.ajax({
                    type: "POST",
                    url: baseURL + "lycash/agreeAudit",
                    contentType: "application/json",
                    data: JSON.stringify(send),
                    success: function (r) {
                        if (r.code == 0) {
                            vm.reload();
                            alert('操作成功')
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            })
		},
		//拒绝提现
        noaudit:function (event) {
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }
            var send ={
                audits:ids
            }
            confirm('确定驳回申请？', function() {
                $.ajax({
                    type: "POST",
                    url: baseURL + "lycash/disAgreeAudit",
                    contentType: "application/json",
                    data: JSON.stringify(send),
                    success: function (r) {
                        if (r.code == 0) {
                            vm.reload();
                            alert('操作成功')
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            })
        }
	}
});