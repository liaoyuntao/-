
// layui.use('upload', function(){
//     var upload = layui.upload;
//
//     //执行实例
//     var uploadInst = upload.render({
//         elem: '#test1' //绑定元素
//         ,url: '/upload/' //上传接口
//         ,done: function(res){
//             //上传完毕回调
//         }
//         ,error: function(){
//             //请求异常回调
//         }
//     });
// });
// layui.use('upload', function () {
//     var upload = layui.upload;
//     var uploadInst = upload.render({//上传主图
//         elem: '#uploadMasterMap' //绑定元素
//         , url: sysurl + "xjdc/sysoss/upload" //上传接口
//         ,multiple: true
//         //,size: '1024' //限制大小单位KB
//         , done: function (r) {
//             if (r.code == 0) {
//                  $("#pictureFrame").prepend('<div><img style="border: none; width: 80px;height: 80px;margin-right: 10px;" src="'+r.url+'"/></p></div>');
//                 vm.houseSource.imagePath += r.url+',';
//             } else {
//                 alert(r.msg);
//             }
//         }
//         , error: function (r) {
//             alert("图片上传失败!");
//         }
//     });
//
// });
var vm = new Vue({
    el:'#test',
    data:{
        busconfig:{},
        request:GetRequest(),
        q:{},
        list :[
            {
                name:'电视',
                style1:'the_icon1',
                style2:'the_icon1_2',
                value:"0",
                select:false
            },
            {
                name:'冰箱',
                style1:'the_icon2',
                style2:'the_icon2_2',
                value:"1",
                select:false
            },
            {
                name:'洗衣机',
                style1:'the_icon3',
                style2:'the_icon3_2',
                value:"2",
                select:false
            },
            {
                name:'空调',
                style1:'the_icon4',
                style2:'the_icon4_2',
                value:"3",
                select:false
            },

            {
                name:'沙发',
                style1:'the_icon5',
                style2:'the_icon5_2',
                value:"4",
                select:false
            },
            {
                name:'柜子',
                style1:'the_icon6',
                style2:'the_icon6_2',
                value:"5",
                select:false
            },
            {
                name:'床',
                style1:'the_icon7',
                style2:'the_icon7_2',
                value:"6",
                select:false
            },
            {
                name:'衣橱',
                style1:'the_icon8',
                style2:'the_icon8_2',
                value:"7",
                select:false
            },
            {
                name:'宽带',
                style1:'the_icon9',
                style2:'the_icon9_2',
                value:"8",
                select:false
            },
            {
                name:'暖气',
                style1:'the_icon10',
                style2:'the_icon10_2',
                value:"9",
                select:false
            },
            {
                name:'热水器',
                style1:'the_icon11',
                style2:'the_icon11_2',
                value:"10",
                select:false
            },
            {
                name:'天然气',
                style1:'the_icon12',
                style2:'the_icon12_2',
                value:"11",
                select:false
            }


        ],
        preoviderList:[],
        houseSource:{
            module:null,
            providerType:"0",//我是
            name:null,//称呼
            phone:null,//电话
            region:null,//地址
            ads:'',//详细地址
            square:null,//面积
            houseStyle:null,//类型
            houseType:null,//户型
            floor:null,//楼层
            hasElevator:null,//电梯
            price:null,//租金
            payType:null,//支付方式
            labelTag:'',//房源标签
            facility:null,//房源描述
            remarks:null,//配套设施
            imagePath:'',//图片
            module:"1",
        },
        labelList:[],
        label1:null,//近地铁
        label2:null,//近商圈
        label3:null,//电梯楼
        label4:null,//押一付一
        label5:null,//品质小区
        label6:null,//小区管理
        label7:null,//随时看房
        label8:null,//安全性高
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
                alert("请输入正确格式的租金！");
                return
            }

                var a = vm.list.length==0?null:[];
            for(i = 0; i<vm.list.length; i++){
                if (vm.list[i].select == true){
                    a.push(vm.list[i].value)
                }
            }
            vm.houseSource.facility = JSON.stringify(a);
            if (vm.houseSource.providerType == null || vm.houseSource.name == null || vm.houseSource.phone == null){
                alert("发布人信息请填写完整！")
                return
            }
            vm.houseSource.houseType =$('#hx')[0].dataset.values;
            vm.houseSource.region = $('#ssx').val();
            vm.houseSource.houseStyle = $('#type')[0].dataset.values;
            vm.houseSource.hasElevator = $('#dt')[0].dataset.values;
            vm.houseSource.payType = $('#zffs')[0].dataset.values;
            vm.houseSource.module ='1';
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
            console.log(vm.houseSource.labelTag);
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
            var url ="xjdc/demand/save" ;
            AjaxLoadingPostJson(url,JSON.stringify(vm.demand),function(r){
                alert();
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
        wxImgUpload:function(){
            wx.chooseImage({
                count: 9, //张数， 默认9
                sizeType: ['compressed'], //建议压缩图
                sourceType: ['album', 'camera'], // 来源是相册、相机
                success: function (res) {
                    var $iosActionsheet = $('#iosActionsheet');
                    var $iosMask = $('#iosMask');
                    $iosActionsheet.removeClass('weui-actionsheet_toggle');
                    $iosMask.fadeOut(200);
                    alert(JSON.stringify(res.localIds))
                    //var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
                    uploadPhoto.uploadToWeixinServer(res.localIds[0],'car')
                }
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
            var that = this;
            AjaxLoadingGetJson("/api/wxapi/getWxJsdkInfo" ,{
                appid:that.request.appid,
                url:location.href,
            },function(r) {
                var data = r.data;
                data.jsApiList=[
                    'chooseImage',//拍照或从手机相册中选图接口
                    'previewImage',//预览图片接口
                    'uploadImage',//上传图片接口
                    'downloadImage'//下载图片接口
                ]
                wx.config(data);
            });



            AjaxLoadingGetJson("/xjdc/generatorbusconfig/querySysBusConfigList" ,{},function(r){
                if(r.code == 0){
                    that.busconfig=r.data;
                    that.labelList=that.busconfig.xjdchousesourcelabeltag.list;
                    that.preoviderList=that.busconfig.xjdchousesourceprovidertype.list;
                    $("#hx").select({
                        title: "选择户型",
                        items: that.busconfig.xjdchousesourcehousetype.list
                    });

                    $("#dt").select({
                        title: "电梯",
                        items: that.busconfig.xjdchousesourcehaselevator.list
                    });
                    $("#type").select({
                        title: "选择类型",
                        items: [
                            {
                                title: "商品房",
                                value: "1",
                            },
                            {
                                title: "自建房",
                                value: "2",
                            },
                            {
                                title: "公寓",
                                value: "3",
                            },
                            {
                                title: "宅基地",
                                value: "4",
                            }
                        ]
                    });
                    $("#zffs").select({
                        title: "选择支付方式",
                        items: [
                            {
                                title: "押一付一",
                                value: "0",
                            },
                            {
                                title: "押二付一",
                                value: "1",
                            },
                            {
                                title: "押三付一",
                                value: "2",
                            },
                            {
                                title: "其他",
                                value: "3",
                            },
                        ]
                    });
                    // $("#type").select({
                    //     title: "选择类型",
                    //     items:that.busconfig.xjdchousesourcehousetype.list
                    // });


                    // $("#zffs").select({
                    //     title: "选择支付方式",
                    //     items: that.busconfig.xjdchousesourcepaytype.list
                    // });
                    // //选择框颜色
                    // $(".publi_sf label").click(function () {
                    //     $(this).addClass("publi_inp_act");
                    //     $(this).siblings().removeClass("publi_inp_act");
                    // });

                    $(".fybq_more label").click(function () {
                        if ($(this).hasClass("publi_inp_act")) {
                            $(this).removeClass("publi_inp_act");
                        } else {
                            $(this).addClass("publi_inp_act");
                        }
                        /*$(this).addClass("publi_inp_act");*/
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

                }else{
                    alert(r.msg);
                }
            });

        }
    },
    mounted:function () {
        var self = this;
        self.init();
    }
});