package com.szt.modules.wjadmin.constant;

/**
 * 支付记录管理常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
public interface  WjadminPaymentHistoryConstant{
    /**
     * 逻辑删除@0-存在,1-隐藏,2-删除,3-停用 - wjadmin_payment_history_delete_flag
     */
    //存在
    String WJADMIN_PAYMENT_HISTORY_DELETE_FLAG_0 = "0";
    //隐藏
    String WJADMIN_PAYMENT_HISTORY_DELETE_FLAG_1 = "1";
    //删除
    String WJADMIN_PAYMENT_HISTORY_DELETE_FLAG_2 = "2";
    //停用
    String WJADMIN_PAYMENT_HISTORY_DELETE_FLAG_3 = "3";
    /**
     * 支付标题@0-订单支付,1-余额充值 - wjadmin_payment_history_title
     */
    //订单支付
    String WJADMIN_PAYMENT_HISTORY_TITLE_0 = "0";
    //余额充值
    String WJADMIN_PAYMENT_HISTORY_TITLE_1 = "1";
    /**
     * 支付类型@0-微信,1-余额 - wjadmin_payment_history_type
     */
    //微信
    String WJADMIN_PAYMENT_HISTORY_TYPE_0 = "0";
    //余额
    String WJADMIN_PAYMENT_HISTORY_TYPE_1 = "1";
    /**
     * 订单状态@0-待支付,1-已支付,2-待开柜,3-已开柜,4-已完成 - wjadmin_payment_history_state
     */
    //待支付
    String WJADMIN_PAYMENT_HISTORY_STATE_0 = "0";
    //已支付
    String WJADMIN_PAYMENT_HISTORY_STATE_1 = "1";
    //待开柜
    String WJADMIN_PAYMENT_HISTORY_STATE_2 = "2";
    //已开柜
    String WJADMIN_PAYMENT_HISTORY_STATE_3 = "3";
    //已完成
    String WJADMIN_PAYMENT_HISTORY_STATE_4 = "4";
}
