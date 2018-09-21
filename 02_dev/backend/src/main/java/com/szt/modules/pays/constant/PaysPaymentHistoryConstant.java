package com.szt.modules.pays.constant;

/**
 * 支付记录管理常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-09-18 12:24:24
 */
public interface  PaysPaymentHistoryConstant{
    /**
     * 逻辑删除@0-存在,1-隐藏,2-删除,3-停用 - pays_payment_history_delete_flag
     */
    //存在
    String PAYS_PAYMENT_HISTORY_DELETE_FLAG_0 = "0";
    //隐藏
    String PAYS_PAYMENT_HISTORY_DELETE_FLAG_1 = "1";
    //删除
    String PAYS_PAYMENT_HISTORY_DELETE_FLAG_2 = "2";
    //停用
    String PAYS_PAYMENT_HISTORY_DELETE_FLAG_3 = "3";
    /**
     * 支付标题@0-订单支付,1-余额充值 - pays_payment_history_title
     */
    //订单支付
    String PAYS_PAYMENT_HISTORY_TITLE_0 = "0";
    //余额充值
    String PAYS_PAYMENT_HISTORY_TITLE_1 = "1";
    /**
     * 支付状态@0-待支付,1-已支付,2-支付异常 - pays_payment_history_state
     */
    //待支付
    String PAYS_PAYMENT_HISTORY_STATE_0 = "0";
    //已支付
    String PAYS_PAYMENT_HISTORY_STATE_1 = "1";
    //支付异常
    String PAYS_PAYMENT_HISTORY_STATE_2 = "2";
}
