$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'lyarticle/list',
        datatype: "json",
        colModel: [			
       			//{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
       			
       			{ label: '文章标题', name: 'title', index: 'title', width: 80 }, 			
       			{ label: '用户名称', name: 'username', index: 'username', width: 80 }, 			
       			{ label: '分类名称', name: 'name', index: 'name', width: 80 }, 	
       			{ label: '发布时间', name: 'createTime', index: 'create_time', width: 80 }, 			
       			{ label: '是否审核', name: 'status', index: 'status', width: 80,
       				formatter:function(value,options,row){
       					
       					return value===0?
       					'<span class="label label-danger">未审核</span>':'<span class="label label-success">已审核</span>'
       				}}, 			
       			{ label: '审核情况', name: 'audit', index: 'audit', width: 80,
       					formatter:function(value,options,row){
       						
       						return value===0?
       						'<span class="label label-danger">驳回</span>':'<span class="label label-success">通过</span>'
       					}	}			
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
		q:{username:null,title:null,classId:''},
		classlist:[],//已获得查询的所有值id,name,status

		showList: true,
		title: null,
		lyArticle: {},
        showMsg:false,
        showAdd:false,
        showupdate:false,
		artmsg:{},
        content:[],
        cmany:'',
	},
	//获取id的方法
	mounted:function () {
		
		var url = "lyarticleclass/getList";
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
	
        //查看详情
		lookin:function () {
            var id = getSelectedRow();
            if(id == null){
                return ;
            }
            vm.showList = false;
			vm.showMsg=true;
            $.get(baseURL + "lyarticle/infoById/"+id, function(r){
            	console.log(r);
            	var a = r.lyArticle.article;
            	var b =  r.lyArticle.content;
            	console.log(a);
            	console.log(b);
            	//用户及文章信息
               vm.artmsg = a;
               //
               vm.content = b;
               vm.cmany=b[0].cmany;
            });
        },


		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.showupdate=false;
			vm.showAdd=true;
			vm.title = "新增";
			vm.lyArticle = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
			vm.showAdd=false;
            vm.showupdate=true;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.lyArticle.id == null ? "lyarticle/save" : "lyarticle/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.lyArticle),
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
				    url: baseURL + "lyarticle/delete",
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
			$.get(baseURL + "lyarticle/info/"+id, function(r){
                vm.lyArticle = r.lyArticle;
            });
		},
		reload: function (event) {
			vm.showMsg=false;
			vm.showList = true;
			   vm.showupdate=false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
				postData:{'username':vm.q.username,'title':vm.q.title,'classId':vm.q.classId},
                page:page
            }).trigger("reloadGrid");
		}
	}
});