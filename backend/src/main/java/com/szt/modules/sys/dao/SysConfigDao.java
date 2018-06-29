package com.szt.modules.sys.dao;

import com.szt.modules.sys.entity.SysConfigEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 系统字典管理
 * 
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 20:36:35
 */
@Mapper
public interface SysConfigDao extends BaseMapper<SysConfigEntity> {
    /**
     * 根据key，查询value
     */
    SysConfigEntity queryByKey(String paramKey);

    /**
     * 根据key，更新value
     */
    int updateValueByKey(@Param("key") String key, @Param("value") String value);

}
