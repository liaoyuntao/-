package com.szt.modules.xjdc.constant;

/**
 * 需求信息常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:07:56
 */
public interface  XjdcDemandConstant{
    /**
     * 户型@1-一室一厅,2-二室一厅,3-三房两厅,4-其他 - xjdc_demand_house_type
     */
    //一室一厅
    String XJDC_DEMAND_HOUSE_TYPE_1 = "1";
    //二室一厅
    String XJDC_DEMAND_HOUSE_TYPE_2 = "2";
    //三房两厅
    String XJDC_DEMAND_HOUSE_TYPE_3 = "3";
    //其他
    String XJDC_DEMAND_HOUSE_TYPE_4 = "4";
    /**
     * 类型@1-住宅,2-公寓,3-别墅,4-商铺,5-车位,6-写字楼,7-其他 - xjdc_demand_type
     */
    //住宅
    String XJDC_DEMAND_TYPE_1 = "1";
    //公寓
    String XJDC_DEMAND_TYPE_2 = "2";
    //别墅
    String XJDC_DEMAND_TYPE_3 = "3";
    //商铺
    String XJDC_DEMAND_TYPE_4 = "4";
    //车位
    String XJDC_DEMAND_TYPE_5 = "5";
    //写字楼
    String XJDC_DEMAND_TYPE_6 = "6";
    //其他
    String XJDC_DEMAND_TYPE_7 = "7";
    /**
     * 装修@1-毛胚,2-普装,3-精装,4-豪装 - xjdc_demand_decoration
     */
    //毛胚
    String XJDC_DEMAND_DECORATION_1 = "1";
    //普装
    String XJDC_DEMAND_DECORATION_2 = "2";
    //精装
    String XJDC_DEMAND_DECORATION_3 = "3";
    //豪装
    String XJDC_DEMAND_DECORATION_4 = "4";
    /**
     * 逻辑删除@0-存在,1-隐藏,2-删除,3-停用 - xjdc_demand_delete_flag
     */
    //存在
    String XJDC_DEMAND_DELETE_FLAG_0 = "0";
    //隐藏
    String XJDC_DEMAND_DELETE_FLAG_1 = "1";
    //删除
    String XJDC_DEMAND_DELETE_FLAG_2 = "2";
    //停用
    String XJDC_DEMAND_DELETE_FLAG_3 = "3";
}
