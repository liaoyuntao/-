package com.szt.modules.generator.service;

import com.szt.common.CommonService;
import com.szt.modules.generator.entity.GeneratorTableEntity;

import java.util.List;
import java.util.Map;

/**
 * 数据表管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 12:44:03
 */
public interface GeneratorTableService extends CommonService<GeneratorTableEntity> {

    /**
     * 预览生成
     * @param tableId
     * @param id
     */
    String preview(Long tableId, Long id);

    /**
     * 生成代码
     * @param ids
     */
    byte[] generate(Long[] ids);

    /**
     * 查询所有表格数据
     * @param o
     * @return
     */
    Map<String, GeneratorTableEntity> queryTableFilePreviewVO(Object o);

    void deleteTableBatchIds(List<Long> longs);
}

