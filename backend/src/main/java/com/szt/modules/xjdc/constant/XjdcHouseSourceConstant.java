package com.szt.modules.xjdc.constant;

/**
 * 佣金方式常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:07:56
 */
public interface  XjdcHouseSourceConstant{
    /**
     * 类型@1-商品房,2-房改房,3-公寓,4-其他 - xjdc_house_source_house_style
     */
    //商品房
    String XJDC_HOUSE_SOURCE_HOUSE_STYLE_1 = "1";
    //房改房
    String XJDC_HOUSE_SOURCE_HOUSE_STYLE_2 = "2";
    //公寓
    String XJDC_HOUSE_SOURCE_HOUSE_STYLE_3 = "3";
    //其他
    String XJDC_HOUSE_SOURCE_HOUSE_STYLE_4 = "4";
    /**
     * 户型@1-一室一厅,2-二室一厅,3-三室一厅,4-其他 - xjdc_house_source_house_type
     */
    //一室一厅
    String XJDC_HOUSE_SOURCE_HOUSE_TYPE_1 = "1";
    //二室一厅
    String XJDC_HOUSE_SOURCE_HOUSE_TYPE_2 = "2";
    //三室一厅
    String XJDC_HOUSE_SOURCE_HOUSE_TYPE_3 = "3";
    //其他
    String XJDC_HOUSE_SOURCE_HOUSE_TYPE_4 = "4";
    /**
     * 逻辑删除@0-存在,1-隐藏,2-删除,3-停用 - xjdc_house_source_delete_flag
     */
    //存在
    String XJDC_HOUSE_SOURCE_DELETE_FLAG_0 = "0";
    //隐藏
    String XJDC_HOUSE_SOURCE_DELETE_FLAG_1 = "1";
    //删除
    String XJDC_HOUSE_SOURCE_DELETE_FLAG_2 = "2";
    //停用
    String XJDC_HOUSE_SOURCE_DELETE_FLAG_3 = "3";
}
