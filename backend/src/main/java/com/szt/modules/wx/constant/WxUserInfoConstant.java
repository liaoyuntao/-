package com.szt.modules.wx.constant;

/**
 * 微信公众号管理常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-22 14:49:05
 */
public interface  WxUserInfoConstant{
    /**
     * 申请类型@0-订阅号,1-服务号,2-企业号 - wx_user_info_application_type
     */
    //订阅号
    String WX_USER_INFO_APPLICATION_TYPE_0 = "0";
    //服务号
    String WX_USER_INFO_APPLICATION_TYPE_1 = "1";
    //企业号
    String WX_USER_INFO_APPLICATION_TYPE_2 = "2";
    /**
     * 类型@0-开发平台公众号,1-普通公众号 - wx_user_info_type
     */
    //开发平台公众号
    String WX_USER_INFO_TYPE_0 = "0";
    //普通公众号
    String WX_USER_INFO_TYPE_1 = "1";
    /**
     * 逻辑删除@0-存在,1-隐藏,2-删除,3-停用 - wx_user_info_delete_flag
     */
    //存在
    String WX_USER_INFO_DELETE_FLAG_0 = "0";
    //隐藏
    String WX_USER_INFO_DELETE_FLAG_1 = "1";
    //删除
    String WX_USER_INFO_DELETE_FLAG_2 = "2";
    //停用
    String WX_USER_INFO_DELETE_FLAG_3 = "3";
}
