package com.szt.modules.generator.dao;

import com.baomidou.mybatisplus.plugins.Page;
import com.szt.modules.generator.entity.GeneratorTableEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.szt.modules.generator.vo.TableFieldVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 数据表管理
 * 
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 12:44:03
 */
@Mapper
public interface GeneratorTableDao extends BaseMapper<GeneratorTableEntity> {
    /**
     * 查询表格与字段的结果集
     * @param longs
     * @return
     */
    List<TableFieldVo> queryTableFieldVO(List<Long> longs);

    List<GeneratorTableEntity> selectPageList(Page<GeneratorTableEntity> page, Map<String,Object> params);

    List<GeneratorTableEntity> queryTableFilePreviewVO(Long tableId);
}
