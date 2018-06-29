package com.szt.modules.pay.wx;

/**
 * 微信常量
 */
public class WxConstant {
    /**
     * 微信调用常量
     */
    //订单重复异常
    public static final String INVALID_REQUEST ="INVALID_REQUEST" ;
    //订单已支付
    public static final String ORDERPAID = "ORDERPAID";
    /**
     * 回调地址
     */
    public static  String DOMAIN_NAME="http://shuly.s1.natapp.cc/renren-fast/api/wxNotifyUrl" ;
}
