package com.szt.modules.wjadmin.constant;

/**
 * 商品管理常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
public interface  WjadminGoodsConstant{
    /**
     * 逻辑删除@0-存在,1-隐藏,2-删除,3-停用 - wjadmin_goods_delete_flag
     */
    //存在
    String WJADMIN_GOODS_DELETE_FLAG_0 = "0";
    //隐藏
    String WJADMIN_GOODS_DELETE_FLAG_1 = "1";
    //删除
    String WJADMIN_GOODS_DELETE_FLAG_2 = "2";
    //停用
    String WJADMIN_GOODS_DELETE_FLAG_3 = "3";
    /**
     * 首页推荐@0-是,1-否 - wjadmin_goods_is_recommend
     */
    //是
    String WJADMIN_GOODS_IS_RECOMMEND_0 = "0";
    //否
    String WJADMIN_GOODS_IS_RECOMMEND_1 = "1";
}
