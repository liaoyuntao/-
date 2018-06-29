package com.szt.modules.generator.service;

import com.szt.common.CommonService;
import com.szt.modules.generator.entity.GeneratorModulesEntity;
import com.szt.modules.generator.entity.GeneratorTableEntity;

import java.util.List;

/**
 * 模块管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-05-27 19:01:10
 */
public interface GeneratorModulesService extends CommonService<GeneratorModulesEntity> {

    /**
     * 查询所有显示的模块
     * @return
     */
    List<GeneratorModulesEntity> queryGeneratorModulesList();

    /**
     * 导入本地
     * @param tableNames
     */
    void generatorCode(List<GeneratorTableEntity> tableNames);
}

