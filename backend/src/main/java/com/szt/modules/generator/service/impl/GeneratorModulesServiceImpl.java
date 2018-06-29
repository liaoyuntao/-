package com.szt.modules.generator.service.impl;

import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.generator.constant.GeneratorTableFieldConstant;
import com.szt.modules.generator.dao.GeneratorModulesDao;
import com.szt.modules.generator.dao.SysGeneratorDao;
import com.szt.modules.generator.entity.*;
import com.szt.modules.generator.service.*;
import com.szt.common.utils.GenUtils;
import com.szt.modules.sys.service.SysMenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 模块管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-05-27 19:01:10
 */
@Slf4j
@Service("generatorModulesService")
public class GeneratorModulesServiceImpl extends CommonServiceImpl<GeneratorModulesDao, GeneratorModulesEntity> implements GeneratorModulesService {
    @Autowired
    private SysGeneratorDao sysGeneratorDao;
    @Autowired
    private GeneratorBusConfigService generatorBusConfigService;
    @Autowired
    private GeneratorTemplateConfigService generatorTemplateConfigService;
    @Autowired
    private GeneratorTableFieldService generatorTableFieldService;
    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private GeneratorTableService generatorTableService;
    @Override
    public List<GeneratorModulesEntity> queryGeneratorModulesList() {
        Wrapper wrapper = Condition.create();
        wrapper.eq("delete_flag", "0");
        return baseMapper.selectList(wrapper);
    }
    @Transactional
    @Override
    public void generatorCode(List<GeneratorTableEntity> tableNames) {
        List<ColumnListEntity> lists = new ArrayList<ColumnListEntity>();
        Map<String,Boolean> map = new HashMap<String,Boolean>();
        Map<String, GeneratorTemplateConfigEntity> config  = generatorTemplateConfigService.queryGeneratorTemplateConfig();
        for(GeneratorTableEntity tableName : tableNames){
            //查询表信息
            GeneratorTableEntity tab = sysGeneratorDao.queryTable(tableName.getTableName());
            //查询列信息
            List<GeneratorTableFieldEntity> columns = sysGeneratorDao.queryColumns(tableName.getTableName());
            tab.setColumns(columns);
            Map<String,Object> obj = new HashMap<>();
            tab=GenUtils.readerTable(tab,map,lists,config,false,obj);
            GeneratorTableEntity t = new GeneratorTableEntity();
            t.insert();
            t.setTableComment(tab.getTableComment());
            t.setTableName(tab.getTableName());
            t.setModulesId(tableName.getModulesId());
            generatorTableService.insert(t);
            sysMenuService.insertPermission((String)obj.get("comments"),(String)obj.get("moduleName"),(String)obj.get("pathName"));
            int i =1;
            for(GeneratorTableFieldEntity fieldEntity : tab.getColumns()){
                if(fieldEntity.getSelectKey()!=null){
                    generatorBusConfigService.insertSysBusConfigPar(fieldEntity.getSelectKey(),fieldEntity.getList());
                }
                ///GeneratorTableFieldEntity tableEntity = new GeneratorTableFieldEntity();
                fieldEntity.insert();
                fieldEntity.setSort(i++);
                fieldEntity.setTableId(t.getId());
                fieldEntity.setCheckout("0");
                fieldEntity.setDeleteFlag(GeneratorTableFieldConstant.DELETE_FLAG_0);
                fieldEntity.setIsExport(GeneratorTableFieldConstant.GENTERATE_TABLE_FIELD_IS_EXPORT_1);
                fieldEntity.setIsSeek(GeneratorTableFieldConstant.GENTERATE_TABLE_FIELD_IS_SEEK_1);
                fieldEntity.setTableSet(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_TABLE_SET_0);
                fieldEntity.setIsDataBase(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_IS_DATA_BASE_0);
                fieldEntity.setIsSet(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_IS_SET_0);
                //判断上拉
                if(fieldEntity.getAttrType().equals("Date")) {
                    fieldEntity.setInputType(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_INPUT_TYPE_2);
                }else if(fieldEntity.getAttrType().equals("Integer")){
                    fieldEntity.setInputType(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_INPUT_TYPE_1);
                }
                //判断是否下拉
                else if(fieldEntity.getSelectKey()!=null){
                    if(fieldEntity.getComment().indexOf("@")!=-1){
                        fieldEntity.setInputType(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_INPUT_TYPE_4);
                    }else{
                        fieldEntity.setInputType(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_INPUT_TYPE_5);
                    }
                }else{
                    fieldEntity.setInputType(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_INPUT_TYPE_0);
                }
                fieldEntity.setFieldType(fieldEntity.getDataType());
                generatorTableFieldService.insert(fieldEntity);
            }
        }
    }
}
