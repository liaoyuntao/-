


//图片上传
function previewImage(file) {
    var MAXWIDTH = 100;
    var MAXHEIGHT = 200;
    if (file.files && file.files[0]) {
        var reader = new FileReader();
        reader.onload = function (evt) {
            $('#img1').html('<li class="weui_uploader_file" style="background-image:url(' + evt.target.result + ')"></li>');
        };
        reader.readAsDataURL(file.files[0]);//
        console.log(file.files[0]);
    }
}
function previewImage1(file) {
    var MAXWIDTH = 100;
    var MAXHEIGHT = 200;
    for (var i = 0; i < file.files.length; i++) {
        if (file.files && file.files[i]) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                $('#img2x').append('<li class="weui_uploader_file" style="background-image:url(' + evt.target.result + ')"></li>');
            };
            reader.readAsDataURL(file.files[i]);
        }
    }
}
$(function () {
    var f = document.querySelector('#headimgurl');
    f.onchange = function () {
        lrz(this.files[0], {width: 640, fieldName: "file"}).then(function (rst) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '1.php');

            xhr.onload = function () {
                if (xhr.status === 200) {
                    var obj = eval('(' + xhr.responseText + ')');
                    $('#img').html('<li onclick="var delimg=$(this);$.confirm(\'您确定要删除吗?\', \'确认删除?\', function() {delimg.remove();},function(){$.toast(\'取消操作\', \'cancel\');});" class="weui_uploader_file weui_uploader_status" style="background-image:url(' + obj.src + ')"><div class="weui_uploader_status_content"><i class="weui_icon_cancel"></i></div></li>');
                    $("#headimgurl1").val(obj.src);
                } else {
                    // 处理其他情况
                }
            };

            xhr.onerror = function () {
                // 处理错误
            };

            xhr.upload.onprogress = function (e) {
                // 上传进度
                var percentComplete = ((e.loaded / e.total) || 0) * 100;
            }

            // 添加参数
            rst.formData.append('size', rst.fileLen);
            rst.formData.append('base64', rst.base64);
            // 触发上传
            xhr.send(rst.formData);

            return rst;
        })

            .catch(function (err) {
                alert(err);
            })

            .always(function () {// 不管是成功失败，这里都会执行
            });
    };
//多图上传
    var f2 = document.querySelector('#headimgurl2');
    f2.onchange = function (e) {

        var files = e.target.files;
        var len = files.length;
        for (var i = 0; i < len; i++) {
            lrz(files[i], {width: 640, fieldName: "file1"}).then(function (rst) {
                var xhr = new XMLHttpRequest();
                xhr.open('POST', '2.php');

                xhr.onload = function () {
                    if (xhr.status === 200) {
                        var obj = eval('(' + xhr.responseText + ')');
                        $('#img2').append('<li onclick="var delimg=$(this);$.confirm(\'您确定要删除吗?\', \'确认删除?\', function() {delimg.remove();},function(){$.toast(\'取消操作\', \'cancel\');});" class="weui_uploader_file weui_uploader_status" style="background-image:url(' + obj.src + ')"><div class="weui_uploader_status_content"><i class="weui_icon_cancel"></i></div></li>');
                        $('#file2').append('<input value="' + obj.src + '"  type="hidden"  name="files" />');
                    } else {
                        // 处理其他情况
                    }
                };

                xhr.onerror = function () {
                    // 处理错误
                };

                xhr.upload.onprogress = function (e) {
                    // 上传进度
                    var percentComplete = ((e.loaded / e.total) || 0) * 100;
                };

                // 添加参数
                rst.formData.append('size', rst.fileLen);
                rst.formData.append('base64', rst.base64);
                // 触发上传
                xhr.send(rst.formData);

                return rst;
            })

                .catch(function (err) {
                    alert(err);
                })

                .always(function () {// 不管是成功失败，这里都会执行
                });

        }//for end
    }
});

var vm = new Vue({
    el:'#test',
    data:{
        busconfig:{},
        request:GetRequest(),
        list1:[],
        lists:{

        },
        q:{},
        demand:{
            region:'',//区域
            price:null,//价格
            buildingAge:null,//楼龄
            houseType:'1',//户型
            floor:'0',//楼层
            decoration:'',//装修
            payType:'',//支付方式
            label:'',//房源标签
            name:null,//称呼
            phone:null,//电话
            remarks:null,//备注
            demandType:"0",//房需类型
            ads:null,//详细地址
            household:'0'
        },
        danjian:null,
        yifang:null,
        erfang:null,
        sanfang:null,
        qita:null,
        diceng:null,
        zhongceng:null,
        gaoceng:null,
        jianzhuang:null,
        jingzhuang:null,
        yicixing:null,
        anjie:null,
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
                this.lists.list5.push({title:vm.addbq});
                alert("添加成功！")
                vm.addbq = '';
            }
            console.log(vm.addbq);

        },
        conmit: function(){
            var that = this;
            var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
            if (!myreg.test(vm.demand.phone)) {
                alert("请输入正确的手机号！");
                return
            }
            if (vm.demand.price == null){
                alert("期望价格不能为空！")
                return
            }
            if (vm.demand.name == null){
                alert("称呼不能为空！")
                return
            }
            if (vm.demand.phone == null){
                alert("电话不能为空！")
                return
            }

            vm.demand.region = $('#qyyq').val();//区域
            if (vm.demand.region == null){
                alert("区域要求不能为空！")
                return
            }
            vm.demand.region += vm.demand.ads;
            var list1=[];
            for(var i in that.lists.list5){
                var item =that.lists.list5[i];
                if(item.chebox){
                    list1.push(item.title);
                }
            }
            vm.demand.labelTag=list1.join();


            var list1=[];
            for(var i in that.list1){
                var item =that.list1[i];
                if(item.chebox){
                    list1.push(item.value);
                }
            }
            vm.demand.houseType=JSON.stringify(list1);
            vm.demand.openid=that.request.openid;
            AjaxLoadingPostJson("/xjdcapp/xjdcdemand/save?appid="+that.request.appid,JSON.stringify(vm.demand),function(r){
                if(r.code === 0){
                    WeixinJSBridge.invoke("closeWindow",{},function(e){})
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
            var that = this;
            AjaxLoadingGetJson("/xjdc/generatorbusconfig/querySysBusConfigList" ,{},function(r){
                if(r.code == 0) {
                    that.busconfig = r.data;
                    that.list1=that.busconfig.xjdcdemandhousetype.list;
                    that.lists.list2=that.busconfig.xjdcdemandfloor.list
                    that.lists.list3=that.busconfig.xjdcdemandhousehold.list
                    that.lists.list5=that.busconfig.xjdcdemandlabeltag.list
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
                        $("#ssx,#qyyq").cityPicker({
                            title: "选择省市县"
                        });
        }
            });}
    },
    mounted:function () {
        var self = this;
        self.init();
    }

});