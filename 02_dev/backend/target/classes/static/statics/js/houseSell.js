

var vm = new Vue({
    el:'#test',
    data:{
        q:{},
        labelList : [],
preoviderList:[],
busconfig:{},
        request:GetRequest(),
        houseSource:{
            name:null,//称呼
            phone:null,//电话
            region:null,//地址
            ads:null,//详细地址
            square:null,//面积
            houseStyle:null,//类型
            houseType:null,//户型
            orientation:null,//朝向
            buildingAge:null,//楼龄
            floor:null,//楼层
            hasElevator:null,//电梯
            price:null,//租金
            label:'',//房源标签
            describe:null,//房源描述
            houseFrame:null,//结构
            decoration:null,//装修
            imagePath:'',//图片
            module:"0",
            providerType:"0",//我是
            payType:"5",//支付方式
        },
        label1:null,//近地铁
        label2:null,//近商圈
        label3:null,//电梯楼
        label4:null,//押一付一
        label5:null,//品质小区
        label6:null,//小区管理
        label7:null,//随时看房
        label8:null,//安全性高
        anjie:null,//按揭
        yicixing:null,//一次性
        addbq:'',//添加标签
    },
    methods: {
        addb: function(){
            if(vm.addbq==null || vm.addbq==''){
                alert("标签不能为空！")
            }else{
                this.labelList.push({title:vm.addbq});
                alert("添加成功！")
                vm.addbq = '';
            }
            console.log(vm.addbq);

        },

        conmit: function(){
var that = this;
            var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
            if (!myreg.test(vm.houseSource.phone)) {
                alert("请输入正确的手机号！");
                return
            }
            var regPos = /^\d+(\.\d+)?$/;
            if (!regPos.test(vm.houseSource.square)) {
                alert("请输入正确格式的房屋面积！");
                return
            }
            if (!regPos.test(vm.houseSource.price)) {
                alert("请输入正确格式的售价！");
                return
            }
            if (!regPos.test(vm.houseSource.buildingAge)) {
                alert("请输入正确格式的楼龄！");
                return
            }


            if (vm.houseSource.providerType == null || vm.houseSource.name == null || vm.houseSource.phone == null){
                alert("发布人信息请填写完整！")
                return
            }

            vm.houseSource.region = $('#ssx').val();//区域
            vm.houseSource.hasElevator = $('#dt').val();//电梯
            vm.houseSource.houseFrame = $('#xzjg')[0].dataset.values;//结构
            vm.houseSource.decoration = $('#zffs')[0].dataset.values;//装修
            vm.houseSource.houseType =$('#hx')[0].dataset.values;
            vm.houseSource.region = $('#ssx').val();
            vm.houseSource.houseStyle = $('#type')[0].dataset.values;
            vm.houseSource.hasElevator = $('#dt')[0].dataset.values;
            vm.houseSource.region += vm.houseSource.ads;
            var labs = [];
            for(var ii in vm.labelList){
                var obj = vm.labelList[ii];
                console.log(obj);
                if(obj.chebox){
                    labs.push(obj.title)
                }
            }
            vm.houseSource.labelTag = labs.join();
            vm.houseSource.openid=that.request.openid;
            AjaxLoadingPostJson("/xjdcapp/xjdchousesource/save?appid="+that.request.appid,JSON.stringify(vm.houseSource),function(r){
                if(r.code === 0){
                    alert('操作成功', function(index){
                        vm.reload();
                    });
                }else{
                    alert(r.msg);
                }
            });
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
            location.reload();
        },
        init: function(){
            var that =this;
            AjaxLoadingGetJson("/xjdc/generatorbusconfig/querySysBusConfigList" ,{},function(r){
                    if(r.code == 0) {
                        that.busconfig = r.data;
                        that.labelList = that.busconfig.xjdchousesourcelabeltag.list;
                        that.preoviderList = that.busconfig.xjdchousesourceprovidertype.list;
                        $("#type").select({
                            title: "选择类型",
                            items: [
                                {
                                    title: "商品房",
                                    value: "1",
                                },
                                {
                                    title: "房改房",
                                    value: "6",
                                },
                                {
                                    title: "公寓",
                                    value: "3",
                                },
                                {
                                    title: "其他",
                                    value: "4",
                                }
                            ]
                        });
                        $("#hx").select({
                            title: "选择户型",
                            items: that.busconfig.xjdchousesourcehousetype.list
                        });

                        $("#dt").select({
                            title: "电梯",
                            items: that.busconfig.xjdchousesourcehaselevator.list
                        });

                        $("#xzjg").select({
                            title: "选择结构",
                            items: that.busconfig.xjdchousesourcehouseframe.list
                        });
                        // $("#zffs").select({
                        //     title: "选择支付方式",
                        //     items: that.busconfig.xjdcgousesourcepaytype.list
                        // });
                        //选择框颜色
                        $(".publi_sf label,.fy_choos label").click(function () {
                            $(this).addClass("publi_inp_act");
                            $(this).siblings().removeClass("publi_inp_act");
                        });

                        $(".fybq_more label,.publi_zf label").click(function () {
                            $(this).addClass("publi_inp_act");
                            // if ($(this).hasClass('publi_inp_act')) {
                            //     $(this).removeClass('publi_inp_act');
                            // } else {
                            //     $(this).addClass('publi_inp_act');
                            // }
                        });

//打开关闭图片切换
                        $(".publi_shou").click(function () {
                            if ($(this).hasClass('publi_open')) {
                                $(this).removeClass('publi_open');
                            } else {
                                $(this).addClass('publi_open');
                            }
                        });

//打开收起效果
                        $('#publi_btn').click(function () {
                            var tese_box = $('#publi_msg');
                            if (tese_box.is(':visible')) {
                                tese_box.slideUp();
                            } else {
                                tese_box.slideDown();
                            }
                        });

                        $('#fy_btn').click(function () {
                            var tese_box = $('#fy_msg');
                            if (tese_box.is(':visible')) {
                                tese_box.slideUp();
                            } else {
                                tese_box.slideDown();
                            }
                        });

                        $('#qy_btn').click(function () {
                            var tese_box = $('#qy_msg');
                            if (tese_box.is(':visible')) {
                                tese_box.slideUp();
                            } else {
                                tese_box.slideDown();
                            }
                        });

                        $('#ptss_btn').click(function () {
                            var tese_box = $('#ptss_msg');
                            if (tese_box.is(':visible')) {
                                tese_box.slideUp();
                            } else {
                                tese_box.slideDown();
                            }
                        });

                        $('#fybq_btn').click(function () {
                            var tese_box = $('#fybq_msg');
                            if (tese_box.is(':visible')) {
                                tese_box.slideUp();
                            } else {
                                tese_box.slideDown();
                            }
                        });

                        $('#upload_btn').click(function () {
                            var tese_box = $('#upload_msg');
                            if (tese_box.is(':visible')) {
                                tese_box.slideUp();
                            } else {
                                tese_box.slideDown();
                            }
                        });

                        $('#fyms_btn').click(function () {
                            var tese_box = $('#fyms_msg');
                            if (tese_box.is(':visible')) {
                                tese_box.slideUp();
                            } else {
                                tese_box.slideDown();
                            }
                        });

                        $("#ssx").cityPicker({
                            title: "选择省市县"
                        });

                        $("#type").select({
                            title: "选择类型",
                            items: [
                                {
                                    title: "商品房",
                                    value: "1",
                                },
                                {
                                    title: "房改房",
                                    value: "6",
                                },
                                {
                                    title: "公寓",
                                    value: "3",
                                },
                                {
                                    title: "其他",
                                    value: "5",
                                }
                            ]
                        });

                        $("#hx").select({
                            title: "选择户型",
                            items: that.busconfig.xjdchousesourcehousetype.list
                        });

                        $("#dt").select({
                            title: "电梯",
                            items: that.busconfig.xjdchousesourcehaselevator.list
                        });


                        $("#zffs").select({
                            title: "选择装修",
                            items: that.busconfig.xjdchousesourcedecoration.list
                        });

                        $("#sjqt").select({
                            title: "选择其他",
                            items: [
                                {
                                    title: "支付宝",
                                    value: "001"
                                },
                                {
                                    title: "微信",
                                    value: "002"
                                }
                            ]
                        });

                    }});

        }
    },
    mounted:function () {
        var self = this;
        self.init();
    }
});