package com.szt.modules.generator.config;

import com.szt.common.utils.SpringContextUtils;
import com.szt.modules.generator.service.GeneratorBusConfigService;
import com.szt.modules.sys.vo.QuerySysBusConfigListVO;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Map;

/**
 * 初始化系统参数
 */
public class InitBusConfig {
    /**
     * 业务参数封装所有业务参数统一表名+字段名
     */
    public static Map<String, QuerySysBusConfigListVO> buconfig;
    private static GeneratorBusConfigService generatorBusConfigService;
    static {
        generatorBusConfigService=SpringContextUtils.getBean("generatorgeneratorBusConfigService",GeneratorBusConfigService.class);
        buconfig=generatorBusConfigService.querySysBusConfigList();
    }

}
