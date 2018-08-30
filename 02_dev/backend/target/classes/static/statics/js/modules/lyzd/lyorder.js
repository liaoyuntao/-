$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'lyorder/list',
        datatype: "json",
        colModel: [
            // {label: 'id', name: 'id', index: 'id', width: 50, key: true},
            {label: '订单号', name: 'code', index: 'code', width: 80},
            {label: '服务内容', name: 'title', index: 'title', width: 80},
            {label: '金额', name: 'price', index: 'price', width: 80},
            {label: '旅行者', name: 'yusername', index: 'yusername', width: 80},
            {label: '服务者', name: 'susername', index: 'susername', width: 80},
            {
                label: '订单来源', name: 'orderFrom', index: 'orderFrom', width: 60,
                formatter: function (value, options, row) {
                    if (value === 0) {
                        return '<span class="label label-danger">App</span>';
                    } else if (value === 1) {
                        return '<span class="label label-success">微信</span>';
                    }
                }
            },
            {
                label: '支付方式', name: 'payType', index: 'payType', width: 80,
                formatter: function (value, options, row) {
                    if (value === 0) {
                        return '<span class="label label-danger">微信支付</span>';
                    } else if (value === 1) {
                        return '<span class="label label-success">支付宝支付</span>';
                    }
                }
            },
            {
                label: '状态', name: 'status', width: 60, formatter: function (value, options, row) {
                if (value === 0) {
                    return '<span class="label label-danger">已预约</span>';
                } else if (value === 1) {
                    return '<span class="label label-success">已完成</span>';
                } else if (value === 2) {
                    return '<span class="label label-success">待退款</span>';
                } else if (value === 3) {
                    return '<span class="label label-success">已退款</span>';
                } else if (value === 4) {
                    return '<span class="label label-success">待评价</span>';
                }else if (value === 5) {
                    return '<span class="label label-success">已评价</span>';
                }
            }
            },
            {label: '提交时间', name: 'createTime', index: 'createTime', width: 100},
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        orderIn:{
            code:90909
        },
        refound:false,
        reOrder:{},
        showRule:false,
        showMsg:false,
        showList: true,
        title: null,
        order:{},
        q: {
            yusername: null,
            susername: null,
            code: null,
            status:9
        },

        status:[
            { text: '选择订单状态', value: '9' },
            { text: '已预约', value: '0' },
            { text: '已完成', value: '1' },
            { text: '待退款', value: '2' },
            { text: '已退款', value: '3' },
            { text: '待评价', value: '4' },
            { text: '已评价', value: '5' },
        ],
        config:{
          endday:null,
          overday:null
        },
        lyOrder: {},

    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.lyOrder = {};
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
        },
        saveOrUpdate: function (event) {
            var url = vm.lyOrder.id == null ? "lyorder/save" : "lyorder/update";
            $.ajax({
                type: "POST",
                url: baseURL + url,
                contentType: "application/json",
                data: JSON.stringify(vm.lyOrder),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        seein:function (event) {
          var ids = getSelectedRows();
            console.log(ids);
            //获取选中的订单对象

            var order;
            //隐藏列表
            vm.showList = false;
            $.get(baseURL + "lyorder/info/" + ids[0], function (r) {
               console.log(r);
                order = r.lyOrder;
                console.log(order);
                //判断是否为待退款或已退款订单
                if(order.status==2 || order.status==3){
                    //展示退款订单信息
                    vm.refound=true;
                    $.get(baseURL + "lyorder/findReOrder/"+ids[0], function(r){
                        console.log(r)
                        vm.reOrder=r.reOrder;
                    });
                }else{
                    //展示非退款订单信息
                    vm.showMsg=true;
                    $.get(baseURL + "lyorder/infoById/"+ids[0], function(r){
                        console.log(r)
                        vm.orderIn=r.lyOrder;
                    });
                }
            });
        },
        //驳回退款
        disAgreeRefound:function(){
            var end = vm.reOrder;
            end.restatus=2;
            $.ajax({
                type: "POST",
                url: baseURL + 'lyorder/agressRefoundOrder',
                contentType: "application/json",
                data: JSON.stringify(end),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        //同意退款
        agreeRefound:function(){
            var end = vm.reOrder;
            end.restatus=1;
            $.ajax({
                type: "POST",
                url: baseURL + 'lyorder/agressRefoundOrder',
                contentType: "application/json",
                data: JSON.stringify(end),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        getOrderConfig:function () {
            $.get(baseURL + "lyorder/getOrderConfig", function(r){
                console.log(r)
                vm.config.endday = r.endday.value;
                vm.config.overday = r.overday.value;
            });
            vm.showList = false;
            vm.showRule=true;
            vm.title = "订单规则设置";
        },
        saveConfig: function () {
            var end = vm.config;
            if(end.overday=='' || end.overday==null){
                alert("请输入服务完成后自动交易时间");
                return;
            }
            if(end.endday=='' || end.endday==null){
                alert("请输入订单完成后自动评价时间");
                return;
            }
            $.ajax({
                type: "POST",
                url: baseURL + 'lyorder/setOrderConfig',
                contentType: "application/json",
                data: JSON.stringify(end),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: baseURL + "lyorder/delete",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.code == 0) {
                            alert('操作成功', function (index) {
                                $("#jqGrid").trigger("reloadGrid");
                            });
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        getInfo: function (id) {
            $.get(baseURL + "lyorder/info/" + id, function (r) {
                vm.lyOrder = r.lyOrder;
            });
        },
        reload: function (event) {
            vm.showList = true;
            vm.refound=false;
            vm.showMsg=false;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {
                    'yusername': vm.q.yusername,
                    'susername': vm.q.susername,
                    'code': vm.q.code,
                    'status':vm.q.status
                },
                page: page
            }).trigger("reloadGrid");
        }
    }
});