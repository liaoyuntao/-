package com.szt.modules.generator.service.impl;

import com.szt.modules.generator.constant.GeneratorTableFieldConstant;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.generator.dao.GeneratorTableFieldDao;
import com.szt.modules.generator.entity.GeneratorTableFieldEntity;
import com.szt.modules.generator.service.GeneratorTableFieldService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
/**
 * 字段管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 12:52:07
 */
@Slf4j
@Service("generatorTableFieldService")
public class GeneratorTableFieldServiceImpl extends CommonServiceImpl<GeneratorTableFieldDao, GeneratorTableFieldEntity> implements GeneratorTableFieldService {


    @Override
    @Transactional
    public void hideTableField(List<Long> longs) {
        for(Long id : longs){
            GeneratorTableFieldEntity entity = new GeneratorTableFieldEntity();
            entity.setId(id);
            entity.setTableSet(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_TABLE_SET_1);
            baseMapper.updateById(entity);
        }
    }

    @Override
    @Transactional
    public void hideSetField(List<Long> longs) {
        for(Long id : longs){
            GeneratorTableFieldEntity entity = new GeneratorTableFieldEntity();
            entity.setId(id);
            entity.setIsSet(GeneratorTableFieldConstant.GENERATOR_TABLE_FIELD_IS_SET_1);
            baseMapper.updateById(entity);
        }
    }

    @Override
    @Transactional
    public void showExportField(List<Long> longs) {
        for(Long id : longs){
            GeneratorTableFieldEntity entity = new GeneratorTableFieldEntity();
            entity.setId(id);
            entity.setIsExport(GeneratorTableFieldConstant.GENTERATE_TABLE_FIELD_IS_EXPORT_0);
            baseMapper.updateById(entity);
        }
    }

    @Override
    @Transactional
    public void showSeekField(List<Long> longs) {
        for(Long id : longs){
            GeneratorTableFieldEntity entity = new GeneratorTableFieldEntity();
            entity.setId(id);
            entity.setIsSeek(GeneratorTableFieldConstant.GENTERATE_TABLE_FIELD_IS_SEEK_0);
            baseMapper.updateById(entity);
        }
    }
}
