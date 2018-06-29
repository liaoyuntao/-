package com.szt.modules.generator.service.impl;

import com.szt.common.CommonServiceImpl;
import com.szt.common.exception.RRException;
import com.szt.common.utils.CloneOper;
import com.szt.common.utils.DateUtils;
import com.szt.common.utils.GenUtils;
import com.szt.modules.generator.constant.GeneratorTableFieldConstant;
import com.szt.modules.generator.dao.GeneratorTableDao;
import com.szt.modules.generator.dao.GeneratorTableFieldDao;
import com.szt.modules.generator.dao.GeneratorTemplateDao;
import com.szt.modules.generator.entity.*;
import com.szt.modules.generator.service.GeneratorTableService;
import com.szt.modules.generator.service.GeneratorTemplateConfigService;
import com.szt.modules.generator.vo.TableFieldVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

//import org.apache.velocity.Template;
//import org.apache.velocity.VelocityContext;
//import org.apache.velocity.app.Velocity;

/**
 * 数据表管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 12:44:03
 */
@Slf4j
@Service("generatorTableService")
public class GeneratorTableServiceImpl extends CommonServiceImpl<GeneratorTableDao, GeneratorTableEntity> implements GeneratorTableService {
    @Autowired
    private GeneratorTemplateDao generatorTemplateDao;
    @Autowired
    private GeneratorTableFieldDao generatorTableFieldDao;
    @Autowired
    private GeneratorTemplateConfigService generatorTemplateConfigService;

    @Override
    public String preview(Long tableId, Long id) {
        List<GeneratorTableEntity> tableEntityList = baseMapper.queryTableFilePreviewVO(tableId);
        if (tableEntityList.size() == 0) {
            throw new RRException("表格不存在");
        }
        GeneratorTableEntity tableEntity = tableEntityList.get(0);
        GeneratorTemplateEntity template = generatorTemplateDao.selectById(id);
        //设置velocity资源加载器
        List<ColumnListEntity> lists = new ArrayList<ColumnListEntity>();
        Properties prop = new Properties();
        prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        Velocity.init(prop);
        Map<String, GeneratorTemplateConfigEntity> config = generatorTemplateConfigService.queryGeneratorTemplateConfig();
        String mainPath = config.get("mainPath").getModelVal();
        mainPath = StringUtils.isBlank(mainPath) ? "io.renren" : mainPath;
        Map<String, Object> map = new HashMap<>();
        tableEntity = GenUtils.readerTable(tableEntity, new HashMap<String, Boolean>(), lists, config, false, map);
        String className = GenUtils.tableToJava(tableEntity.getTableName(), config.get("tablePrefix").getModelVal());
        tableEntity.setClassName(className);
        tableEntity.setClassname(StringUtils.uncapitalize(className));
        map.put("moduleName", tableEntity.getModulesName());
        //封装模板数据
       /*
        map.put("tableName", tableEntity.getTableName());
        map.put("comments", tableEntity.getTableComment());
        map.put("pk", tableEntity.getPk());
        map.put("className", tableEntity.getClassName());
        map.put("classname", tableEntity.getClassname());
        map.put("pathName", tableEntity.getClassname().toLowerCase());
        map.put("columns", tableEntity.getColumns());
        map.put("lists", lists);
        map.put("hasBigDecimal", true);
        map.put("mainPath", mainPath);
        map.put("package", config.get("package").getModelVal());
        map.put("moduleName", config.get("moduleName").getModelVal());
        map.put("author", config.get("author").getModelVal());
        map.put("email", config.get("email").getModelVal());
        map.put("datetime", DateUtils.format(new Date(), DateUtils.DATE_TIME_PATTERN));*/
        VelocityContext context = new VelocityContext(map);
        //渲染模板
        StringWriter sw = new StringWriter();
        Velocity.evaluate(context, sw, "mystring", template.getText());
        return sw.toString();
    }

//    @Override
//    public PageUtils queryPage(Map<String, Object> params) {
//        Page<GeneratorTableEntity> page = new Page<GeneratorTableEntity>(
//                Integer.parseInt((String) params.get("page")),
//                Integer.parseInt((String) params.get("limit"))
//        );
//        page.setRecords(baseMapper.selectPageList(page, params));
//        return new PageUtils(page);
//    }

    @Override
    public byte[] generate(Long[] ids) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        List<ColumnListEntity> lists = new ArrayList<ColumnListEntity>();
        Map<String, GeneratorTemplateConfigEntity> config = generatorTemplateConfigService.queryGeneratorTemplateConfig();
        List<GeneratorTemplateEntity> templates = generatorTemplateDao.queryGeneratorTemplateList();
        List<TableFieldVo> tableEntitys = baseMapper.queryTableFieldVO(Arrays.asList(ids));
        Map<String, Boolean> maps = new HashMap<String, Boolean>();
        for (TableFieldVo tableEntity : tableEntitys) {
            // tableEntity = GenUtils.readerTable(tableEntity,map,lists,config,tableEntity.getList(),true);
            //生成代码
            //设置velocity资源加载器
            Properties prop = new Properties();
            prop.put("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
            Velocity.init(prop);
            String mainPath = config.get("mainPath").getModelVal();
            mainPath = StringUtils.isBlank(mainPath) ? "io.renren" : mainPath;
            String className = GenUtils.tableToJava(tableEntity.getTableName(), config.get("tablePrefix").getModelVal());
            tableEntity.setClassName(className);
            tableEntity.setClassname(StringUtils.uncapitalize(className));
            //封装模板数据
            Map<String, Object> map = new HashMap<>();
            map.put("tableName", tableEntity.getTableName());
            map.put("comments", tableEntity.getTableComment());
            map.put("pk", tableEntity.getPk());
            map.put("className", tableEntity.getClassName());
            map.put("classname", tableEntity.getClassname());
            map.put("pathName", tableEntity.getClassname().toLowerCase());
            map.put("columns", tableEntity.getColumns());
            map.put("lists", lists);
            map.put("hasBigDecimal", true);
            map.put("mainPath", mainPath);
            map.put("package", config.get("package").getModelVal());
            map.put("moduleName", config.get("moduleName").getModelVal());
            map.put("author", config.get("author").getModelVal());
            map.put("email", config.get("email").getModelVal());
            map.put("datetime", DateUtils.format(new Date(), DateUtils.DATE_TIME_PATTERN));
            VelocityContext context = new VelocityContext(map);
            //获取模板列表
            //List<String> templates = getTemplates();
            //渲染模板
            for (GeneratorTemplateEntity template : templates) {
                StringWriter sw = new StringWriter();
                Template tpl = Velocity.getTemplate(GenUtils.TEMPLATE + "/" + template.getFileName(), "UTF-8");
                tpl.merge(context, sw);
                try {
                    //添加到zip
                    zip.putNextEntry(new ZipEntry(GenUtils.getFileName(tableEntity.getClassName(), config, template)));
                    IOUtils.write(sw.toString(), zip, "UTF-8");
                    IOUtils.closeQuietly(sw);
                    zip.closeEntry();
                } catch (IOException e) {
                    e.printStackTrace();
                    throw new RRException("渲染模板失败，表名：" + tableEntity.getTableName(), e);
                }
            }
        }
        IOUtils.closeQuietly(zip);
        //def
        return outputStream.toByteArray();
    }

    @Override
    public Map<String, GeneratorTableEntity> queryTableFilePreviewVO(Object o) {
        List<GeneratorTableEntity> list = baseMapper.queryTableFilePreviewVO(null);
        Map<String, GeneratorTableEntity> map = new HashMap<String, GeneratorTableEntity>();
        for (GeneratorTableEntity tab : list) {
            //搜索字段
            List<GeneratorTableFieldEntity> isSeekList = new ArrayList<>();
            //表格字段
            List<GeneratorTableFieldEntity> tableSetList = new ArrayList<>();
            //修改字段
            List<GeneratorTableFieldEntity> isSetList = new ArrayList<>();
            tab.setIsSeekList(isSeekList);
            tab.setIsSetList(isSetList);
            tab.setTableSetList(tableSetList);
            for (GeneratorTableFieldEntity field : tab.getColumns()) {

                String attrName = GenUtils.columnToJava(field.getFieldName());
                field.setFieldnames(field.getFieldName().replaceAll("_", ""));
                field.setFieldName(org.apache.commons.lang.StringUtils.uncapitalize(attrName));
                if (GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_TABLE_SET_0.equals(field.getTableSet())) {
                    tableSetList.add(CloneOper.deepCloneObject(field));
                }
                if (GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_IS_SET_0.equals(field.getIsSet())) {
                    isSetList.add(CloneOper.deepCloneObject(field));
                }
                if (GeneratorTableFieldConstant.GENTERATE_TABLE_FIELD_IS_SEEK_0.equals(field.getIsSeek())) {
                    isSeekList.add(CloneOper.deepCloneObject(field));
                }
            }

            map.put(tab.getTableName().replaceAll("_", ""), tab);
        }

        return map;
    }

    @Override
    @Transactional
    public void deleteTableBatchIds(List<Long> longs) {
        for (Long tableId : longs) {
            Map<String, Object> map = new HashMap<>();
            map.put("table_id", tableId);
            generatorTableFieldDao.deleteByMap(map);
            baseMapper.deleteById(tableId);
        }
    }
}
