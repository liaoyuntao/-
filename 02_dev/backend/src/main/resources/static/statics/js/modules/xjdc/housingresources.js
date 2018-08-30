$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'housingresources/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', width: 50, key: true,hidden: true},
            {label: '联系人', name: 'name', index: 'name', width: 80},
            {label: '联系电话', name: 'phone', index: 'phone', width: 80},
            {label: '区域', name: 'region', index: 'region', width: 80},
            {label: '价格', name: 'price', index: 'price', width: 80},
            {label: '户型', name: 'houseType', index: 'house_type', width: 80},
            {label: '平方数', name: 'square', index: 'square', width: 80},
            {label: '类型', name: 'type', index: 'type', width: 80},
            {label: '楼龄', name: 'buildingAge', index: 'building_age', width: 80},
            {label: '楼层', name: 'floor', index: 'floor', width: 80},
            {label: '装修', name: 'decoration', index: 'decoration', width: 80},
            {label: '房源标签', name: 'label', index: 'label', width: 80},
            {label: '房源描述', name: 'describe', index: 'describe', width: 80},
            {label: '模块', name: 'module', index: 'module', width: 80},
            {label:'查看详情',name:'id',index:'id',width:60,
                formatter:function(value,options,row){
                    return '<a onclick="vm.showImfoButton('+ value +')">详情</a>'
                }
            }
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
        q: {},
        showList: true,
        title: null,
        housingResources: {}
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
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.housingResources = {};
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
            var url = vm.housingResources.id == null ? "housingresources/save" : "housingresources/update";
            AjaxLoadingPostJson(url, JSON.stringify(vm.housingResources), function (r) {
                if (r.code === 0) {
                    alert('操作成功', function (index) {
                        vm.reload();
                    });
                } else {
                    alert(r.msg);
                }
            });
        },
        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {

                AjaxLoadingPostJson("housingresources/delete", JSON.stringify(ids), function (r) {
                    if (r.code == 0) {
                        alert('操作成功', function (index) {
                            $("#jqGrid").trigger("reloadGrid");
                        });
                    } else {
                        alert(r.msg);
                    }
                });
            });
        },
        getInfo: function (id) {
            $.get(baseURL + "housingresources/info/" + id, function (r) {
                vm.housingResources = r.housingResources;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page,
                postData: vm.q,
            }).trigger("reloadGrid");
        }
    },
    mounted: function () {
        var self = this;

    }
});