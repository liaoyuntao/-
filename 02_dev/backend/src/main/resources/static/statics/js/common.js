//jqGrid的配置信息
$.jgrid.defaults.width = 1000;
$.jgrid.defaults.responsive = true;
$.jgrid.defaults.styleUI = 'Bootstrap';
var baseURL = "../../";
var urls = location.href.split('/');
var sysurl = urls[0]+"//" + urls[2] + '/' + urls[3] + '/';
//判断浏览器是否支持html5本地存储
function localStorageSupport() {
    return (('localStorage' in window) && window['localStorage'] !== null)
}




/* 获取根据下拉炫酷获取参数值*/
function getSelectData (type){
	if(localStorageSupport){
		var conf=JSON.parse(localStorage.getItem('config'));
		return conf[type];
	}else{
		return parent.window.sysconfig[type];
	}
}

/* 获取系统参数名称*/
function cfFormatter (value, options, row){
	var name="",type=options.colModel.type;
	
	if(localStorageSupport){
		var conf=JSON.parse(localStorage.getItem('config'));
		var nodes=conf[type];
		if(nodes){
			for(var i=0;i<nodes.length;i++){
				if(nodes[i]['value']==value) name = nodes[i]['key']
			}
		}		
		return name;
	}else{
		var nodes=parent.window.sysconfig[type];
		if(nodes){
			for(var i=0;i<nodes.length;i++){
				if(nodes[i]['value']==value) name = nodes[i]['key']
			}
		}
		return name;
	}
}

//工具集合Tools
window.T = {};

// 获取请求参数
// 使用示例
// location.href = http://localhost:8080/index.html?id=123
// T.p('id') --> 123;
var url = function(name) {
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)return  unescape(r[2]); return null;
};
T.p = url;

//全局配置
$.ajaxSetup({
	dataType: "json",
	cache: false
});

//重写alert
window.alert = function(msg, callback){
	parent.layer.alert(msg, function(index){
		parent.layer.close(index);
		if(typeof(callback) === "function"){
			callback("ok");
		}
	});
}

//带加载等待的AJAX请求
function AjaxLoadingPostJson(url,data, call){
      var ajaxload=window.layer.load(1, {
          shade: [0.5, '#fff']
      });
  $.ajax({ type: "POST",
      data: data,
      url:sysurl+url,
      contentType: "application/json",
      success: function (res) {
          if(ajaxload){ window.layer.close(ajaxload)}
          call(res);
      },
      error: function(err){console.log(err);  if(ajaxload)window.layer.close(ajaxload)}
  })
};
//带加载等待的AJAX请求
function AjaxLoadingGetJson(url,data, call){
    var ajaxload=window.layer.load(1, {
        shade: [0.5, '#fff']
    });
    $.ajax({ type: "GET",
        data: data,
        url:sysurl+url,
        contentType: "application/json",
        success: function (res) {
            if(ajaxload){ window.layer.close(ajaxload)}
            call(res);
        },
        error: function(err){console.log(err);  if(ajaxload)window.layer.close(ajaxload)}
    })
};
//不带加载等待的AJAX请求
function AjaxPostJson(url,data, call){

$.ajax({ type: "POST",
    data: data,
    url:baseURL+url,
    contentType: "application/json",
    success: function (res) {
        call(res);
    },
    error: function(err){console.log(err);  if(ajaxload)window.layer.close(ajaxload)}
})
};


//重写confirm式样框
window.confirm = function(msg, callback){
	parent.layer.confirm(msg, {btn: ['确定','取消']},
	function(){//确定事件
		if(typeof(callback) === "function"){
			callback("ok");
		}
	});
}

//选择一条记录
function getSelectedRow() {
    var grid = $("#jqGrid");
    var rowKey = grid.getGridParam("selrow");
    if(!rowKey){
    	alert("请选择一条记录");
    	return ;
    }
    
    var selectedIDs = grid.getGridParam("selarrrow");
    if(selectedIDs.length > 1){
    	alert("只能选择一条记录");
    	return ;
    }
    
    return selectedIDs[0];
}

//选择多条记录
function getSelectedRows() {
    var grid = $("#jqGrid");
    var rowKey = grid.getGridParam("selrow");
    if(!rowKey){
    	alert("请选择一条记录");
    	return ;
    }
    
    return grid.getGridParam("selarrrow");
}

//判断是否为空
function isBlank(value) {
    return !value || !/\S/.test(value)
}


function getFormatDate(time){    
    var nowDate = new Date(time);     
    var year = nowDate.getFullYear();    
    var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1) : nowDate.getMonth() + 1;    
    var date = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();    
    // var hour = nowDate.getHours()< 10 ? "0" + nowDate.getHours() : nowDate.getHours();    
    // var minute = nowDate.getMinutes()< 10 ? "0" + nowDate.getMinutes() : nowDate.getMinutes();    
    // var second = nowDate.getSeconds()< 10 ? "0" + nowDate.getSeconds() : nowDate.getSeconds();    
    return year + "-" + month + "-" + date;    
}  


function getFormatDateTime(time){    
    var nowDate = new Date(time);     
    var year = nowDate.getFullYear();    
    var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1) : nowDate.getMonth() + 1;    
    var date = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();    
    var hour = nowDate.getHours()< 10 ? "0" + nowDate.getHours() : nowDate.getHours();    
    var minute = nowDate.getMinutes()< 10 ? "0" + nowDate.getMinutes() : nowDate.getMinutes();    
    var second = nowDate.getSeconds()< 10 ? "0" + nowDate.getSeconds() : nowDate.getSeconds();    
    return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;    
}
//获取地址栏元素
function GetRequest() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for(var i = 0; i < strs.length; i ++) {
            theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
};

function dateTimeFormat(value, options, row){
	return getFormatDateTime(value);
}

function dateFormat(value, options, row){
	return getFormatDate(value);
}