package com.szt.modules.xjdc.constant;

/**
 * 用户信息常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:07:56
 */
public interface  XjdcUserConstant{
    /**
     * 性别@0-未知,1-男,2-女 - xjdc_user_sex
     */
    //未知
    String XJDC_USER_SEX_0 = "0";
    //男
    String XJDC_USER_SEX_1 = "1";
    //女
    String XJDC_USER_SEX_2 = "2";
    /**
     * 逻辑删除@0-存在,1-隐藏,2-删除,3-停用 - xjdc_user_delete_flag
     */
    //存在
    String XJDC_USER_DELETE_FLAG_0 = "0";
    //隐藏
    String XJDC_USER_DELETE_FLAG_1 = "1";
    //删除
    String XJDC_USER_DELETE_FLAG_2 = "2";
    //停用
    String XJDC_USER_DELETE_FLAG_3 = "3";
}
