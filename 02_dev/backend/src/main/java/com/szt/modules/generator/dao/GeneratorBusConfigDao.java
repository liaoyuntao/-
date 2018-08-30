package com.szt.modules.generator.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.szt.modules.generator.entity.GeneratorBusConfigEntity;
import com.szt.modules.sys.vo.QuerySysBusConfigListVO;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

/**
 * 自动生成参数管理
 * 
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 15:18:03
 */
@Mapper
public interface GeneratorBusConfigDao extends BaseMapper<GeneratorBusConfigEntity> {
    @MapKey("confCode")
    Map<String, QuerySysBusConfigListVO> querySysBusConfigList(String[] codes);
    @MapKey("confCode")
    Map<String,Object> queryAppSysBusConfigList();
    @MapKey("confCode")
    @Select("select id,conf_name,conf_code,conf_vue from generator_bus_config where conf_code=#{key}")
    Map<String,GeneratorBusConfigEntity> querySysBusConfigByCodeKey(String key);
}
