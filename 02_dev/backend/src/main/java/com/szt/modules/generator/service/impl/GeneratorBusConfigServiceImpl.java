package com.szt.modules.generator.service.impl;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.szt.common.CommonServiceImpl;
import com.szt.common.exception.RRException;
import com.szt.modules.generator.config.InitBusConfig;
import com.szt.modules.generator.constant.GeneratorTableConstant;
import com.szt.modules.generator.dao.GeneratorBusConfigDao;
import com.szt.modules.generator.entity.ColumnListEntity;
import com.szt.modules.generator.entity.GeneratorBusConfigEntity;
import com.szt.modules.generator.entity.GeneratorTableEntity;
import com.szt.modules.generator.service.GeneratorBusConfigService;
import com.szt.modules.generator.service.GeneratorTableService;
import com.szt.modules.sys.vo.QuerySysBusConfigListVO;
import lombok.experimental.var;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private GeneratorTableService  generatorTableService;
    @Override
    public Map<String, QuerySysBusConfigListVO> querySysBusConfigList(String[] codes) {
        Map<String, QuerySysBusConfigListVO> map  = baseMapper.querySysBusConfigList(codes);
        for (Map.Entry<String, QuerySysBusConfigListVO> entry : map.entrySet()) {
            Map<String,String> map1 = new HashMap<>();
            QuerySysBusConfigListVO quer =  entry.getValue();
            for(GeneratorBusConfigEntity item : quer.getList()){
                map1.put(item.getConfVue(),item.getConfName());
            }
            quer.setMap(map1);
        }
//        //查询业务表格信息
//        EntityWrapper<GeneratorTableEntity> wr = new EntityWrapper<GeneratorTableEntity> ();
//        //查询所有业务表
//        wr.eq("is_business", GeneratorTableConstant.GENERATOR_TABLE_IS_BUSINESS_0);
//       List<GeneratorTableEntity> list =  generatorTableService.selectList(wr);
//       for(GeneratorTableEntity tab : list){
//           QuerySysBusConfigListVO quer = new QuerySysBusConfigListVO() ;
//           map.put(tab.getTableName().replaceAll("_",""),quer);
//           quer.setConfCode(tab.getTableName());
//           Map<Object,Object> map1 = new HashMap<>();
//           quer.setList(generatorTableService.queryData(tab.getTableName(),tab.getBusinessKey(),tab.getBusinessValue()));
//           for(Object items : quer.getList()){
//               Map<String,Object> item = (Map<String, Object>) items;
//               map1.put(item.get("confVue"),item.get("confName"));
//           }
//           quer.setMap(map1);
//       }
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
                    this.insertEntity(entity);
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

    @Override
    public QuerySysBusConfigListVO querySysBusConfigByKey(String key) {
        EntityWrapper<GeneratorTableEntity> wr = new EntityWrapper<GeneratorTableEntity> ();
        //查询所有业务表
        wr.eq("is_business", GeneratorTableConstant.GENERATOR_TABLE_IS_BUSINESS_0);
        wr.eq("table_name",key);
       List<GeneratorTableEntity> list =  generatorTableService.selectList(wr);
        QuerySysBusConfigListVO quer = new QuerySysBusConfigListVO() ;
       for(GeneratorTableEntity tab : list){
           quer.setConfCode(tab.getTableName());
           Map<String,String> map1 = new HashMap<>();
           quer.setList(generatorTableService.queryData(tab.getTableName(),tab.getBusinessKey(),tab.getBusinessValue()));
           for(GeneratorBusConfigEntity items : quer.getList()){
               map1.put(items.getConfVue(),items.getConfName());
           }
           quer.setMap(map1);
       }
        return quer;
    }

    @Override
    public Map<String, GeneratorBusConfigEntity> querySysBusConfigByCodeKey(String key) {
        return  baseMapper.querySysBusConfigByCodeKey(key);
    }

    @Override
    public void insertEntity(GeneratorBusConfigEntity entity){
        entity.insert();
        baseMapper.insert(entity);
        InitBusConfig.updateBuConfig(entity.getConfCode());
    }
    @Override
    public void updateEntity(GeneratorBusConfigEntity entity){
        entity.update();
        baseMapper.updateById(entity);
        InitBusConfig.updateBuConfig(entity.getConfCode());
    }
}
