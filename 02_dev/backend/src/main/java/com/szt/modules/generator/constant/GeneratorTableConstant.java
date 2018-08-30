package com.szt.modules.generator.constant;

/**
 * 数据表管理常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 12:44:03
 */
public interface  GeneratorTableConstant{
    /**
     * 逻辑删除 - delete_flag
     */
    //存在
    String DELETE_FLAG_0 = "0";
    //隐藏
    String DELETE_FLAG_1 = "1";
    //删除
    String DELETE_FLAG_2 = "2";
    //停用
    String DELETE_FLAG_3 = "3";
    /**
     * 是否为业务表@0-是,1-否 - generator_table_is_business
     */
    //是
    String GENERATOR_TABLE_IS_BUSINESS_0 = "0";
    //否
    String GENERATOR_TABLE_IS_BUSINESS_1 = "1";
}
