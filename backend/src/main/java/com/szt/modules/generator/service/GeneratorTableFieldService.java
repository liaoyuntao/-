package com.szt.modules.generator.service;

import com.szt.common.CommonService;
import com.szt.modules.generator.entity.GeneratorTableFieldEntity;

import java.util.List;
import java.util.Map;

/**
 * 字段管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 12:52:07
 */
public interface GeneratorTableFieldService extends CommonService<GeneratorTableFieldEntity> {

    /**
     * 批量隐藏表格字段
     * @param longs
     */
    void hideTableField(List<Long> longs);

    /**
     * 批量隐藏设置字段
     * @param longs
     */
    void hideSetField(List<Long> longs);

    /**
     * 显示导出字段
     * @param longs
     */
    void showExportField(List<Long> longs);

    /**
     * 显示搜索字段
     * @param longs
     */
    void showSeekField(List<Long> longs);
}