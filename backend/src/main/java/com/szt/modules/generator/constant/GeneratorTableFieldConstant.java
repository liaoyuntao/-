package com.szt.modules.generator.constant;

/**
 * 字段管理常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 12:52:07
 */
public interface  GeneratorTableFieldConstant{
    /**
     * 是否为空 - genterate_table_field_is_null
     */
    //可以空
    String GENTERATE_TABLE_FIELD_IS_NULL_0 = "0";
    //非空
    String GENTERATE_TABLE_FIELD_IS_NULL_1 = "1";
    /**
     * 是否搜索 - genterate_table_field_is_seek
     */
    //搜索
    String GENTERATE_TABLE_FIELD_IS_SEEK_0 = "0";
    //非搜索
    String GENTERATE_TABLE_FIELD_IS_SEEK_1 = "1";
    /**
     * 是否导出 - genterate_table_field_is_export
     */
    //导出
    String GENTERATE_TABLE_FIELD_IS_EXPORT_0 = "0";
    //非导出
    String GENTERATE_TABLE_FIELD_IS_EXPORT_1 = "1";
    /**
     * 表格中字段是否显示 - generator_table_field_table_set
     */
    //是
    String GENERATOR_TABLE_FIELD_TABLE_SET_0 = "0";
    //否
    String GENERATOR_TABLE_FIELD_TABLE_SET_1 = "1";
    /**
     * 是否数据库字段 - generator_table_field_is_data_base
     */
    //是
    String GENERATOR_TABLE_FIELD_IS_DATA_BASE_0 = "0";
    //否
    String GENERATOR_TABLE_FIELD_IS_DATA_BASE_1 = "1";
    /**
     * 修改时是否显示 - generator_table_field_is_set
     */
    //是
    String GENERATOR_TABLE_FIELD_IS_SET_0 = "0";
    //否
    String GENERATOR_TABLE_FIELD_IS_SET_1 = "1";
    /**
     * 输入框类型 - generator_table_field_input_type
     */
    //text
    String GENERATOR_TABLE_FIELD_INPUT_TYPE_0 = "0";
    //number
    String GENERATOR_TABLE_FIELD_INPUT_TYPE_1 = "1";
    //date
    String GENERATOR_TABLE_FIELD_INPUT_TYPE_2 = "2";
    //datetime
    String GENERATOR_TABLE_FIELD_INPUT_TYPE_3 = "3";
    //select
    String GENERATOR_TABLE_FIELD_INPUT_TYPE_4 = "4";
    //chebox
    String GENERATOR_TABLE_FIELD_INPUT_TYPE_5 = "5";
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
}
