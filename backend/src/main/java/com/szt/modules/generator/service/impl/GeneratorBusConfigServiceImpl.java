package com.szt.modules.generator.service.impl;


import com.alibaba.fastjson.JSON;
import com.szt.common.CommonServiceImpl;
import com.szt.common.exception.RRException;
import com.szt.modules.generator.dao.GeneratorBusConfigDao;
import com.szt.modules.generator.entity.ColumnListEntity;
import com.szt.modules.generator.entity.GeneratorBusConfigEntity;
import com.szt.modules.generator.service.GeneratorBusConfigService;
import com.szt.modules.sys.entity.SysBusConfigEntity;
import com.szt.modules.sys.vo.QuerySysBusConfigListVO;
import org.springframework.stereotype.Service;

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
@Service("generatorgeneratorBusConfigService")
public class GeneratorBusConfigServiceImpl extends CommonServiceImpl<GeneratorBusConfigDao, GeneratorBusConfigEntity> implements GeneratorBusConfigService {
    @Override
    public Map<String, QuerySysBusConfigListVO> querySysBusConfigList() {
        Map<String, QuerySysBusConfigListVO> map  = baseMapper.querySysBusConfigList();
        for (Map.Entry<String, QuerySysBusConfigListVO> entry : map.entrySet()) {
            Map<String,String> map1 = new HashMap<>();
            QuerySysBusConfigListVO quer = entry.getValue();
            for(GeneratorBusConfigEntity item : quer.getList()){
                map1.put(item.getConfVue().replaceAll("_",""),item.getConfName());
            }
            quer.setMap(map1);
        }
        return map ;
    }

    @Override
    public void insertSysBusConfigPar(String selectKey, List<ColumnListEntity> list) {
        for(ColumnListEntity item : list){
            Map<String, Object> map = new HashMap<>();
            map.put("conf_code",selectKey);
            map.put("conf_vue",item.getMapKey());

            if (baseMapper.selectByMap(map).size() == 0) {
                GeneratorBusConfigEntity entity = new GeneratorBusConfigEntity();
                try {
                    entity.setConfCode(selectKey);
                    entity.setConfVue(item.getMapKey());
                    entity.setConfName(item.getMapValue());
                    entity.insert();
                    baseMapper.insert(entity);
                }catch (Exception e){
                    e.printStackTrace();
                    throw new RRException("业务参数异常"+ JSON.toJSONString(entity),e);
                }
            }

        }
    }

    @Override
    public Map<String, Object> queryAppSysBusConfigList() {
        return baseMapper.queryAppSysBusConfigList();
    }


}
