package com.szt.modules.generator.service;

import com.alibaba.fastjson.JSON;
import com.szt.common.CommonService;
import com.szt.common.exception.RRException;
import com.szt.modules.generator.entity.ColumnListEntity;
import com.szt.modules.generator.entity.GeneratorBusConfigEntity;
import com.szt.modules.sys.entity.SysBusConfigEntity;
import com.szt.modules.sys.vo.QuerySysBusConfigListVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 自动生成参数管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 15:18:03
 */
public interface GeneratorBusConfigService extends CommonService<GeneratorBusConfigEntity>  {

    /**
     * 查询所有业务参数
     */
    Map<String, QuerySysBusConfigListVO> querySysBusConfigList();

    /**
     * 插入业务参数
     * @param selectKey
     * @param list
     */
    void insertSysBusConfigPar(String selectKey, List<ColumnListEntity> list);

    /**
     * 查询app业务参数
     * * @return
     */
    Map<String,Object> queryAppSysBusConfigList();
}

