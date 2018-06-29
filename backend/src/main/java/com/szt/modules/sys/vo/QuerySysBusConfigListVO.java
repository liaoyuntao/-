package com.szt.modules.sys.vo;

import com.szt.modules.generator.dao.GeneratorBusConfigDao;
import com.szt.modules.generator.entity.GeneratorBusConfigEntity;
import com.szt.modules.sys.entity.SysBusConfigEntity;

import java.util.List;
import java.util.Map;

/**
 * 所有业务参数
 */
public class QuerySysBusConfigListVO {
    private String confCode;



    List<GeneratorBusConfigEntity> list ;
    private Map<String,String> map;
    public List<GeneratorBusConfigEntity> getList() {
        return list;
    }

    public void setList(List<GeneratorBusConfigEntity> list) {
        this.list = list;
    }
    public String getConfCode() {
        return confCode;
    }

    public void setConfCode(String confCode) {
        this.confCode = confCode;
    }

    public Map<String, String> getMap() {
        return map;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }
}
