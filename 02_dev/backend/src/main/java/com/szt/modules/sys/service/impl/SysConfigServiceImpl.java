package com.szt.modules.sys.service.impl;

import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.gson.Gson;
import com.szt.common.exception.RRException;
import com.szt.modules.generator.entity.GeneratorTemplateEntity;
import com.szt.modules.sys.redis.SysConfigRedis;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.sys.dao.SysConfigDao;
import com.szt.modules.sys.entity.SysConfigEntity;
import com.szt.modules.sys.service.SysConfigService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Map;
/**
 * 系统字典管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 20:36:35
 */
@Service("syssysConfigService")
public class SysConfigServiceImpl extends CommonServiceImpl<SysConfigDao, SysConfigEntity> implements SysConfigService {

    @Autowired
    private SysConfigRedis sysConfigRedis;

    @Override
    /**
     * 自动分页查询
     * @param params
     * @return
     */
    public PageUtils queryPage(Map<String, Object> params){
        Wrapper wrapper = Condition.create();
        wrapper.notIn("data_key",new Object[]{
                "CLOUD_STORAGE_CONFIG_KEY"
        });
        Page<GeneratorTemplateEntity> page = null;
        try{
            page = this.selectPage(new Query<SysConfigEntity>(params,wrapper).getPage(),wrapper);
        }catch (Exception e){
            e.printStackTrace();
        }
        return new PageUtils(page);
    }

    @Override
    public void save(SysConfigEntity config) {
        this.insert(config);
        sysConfigRedis.saveOrUpdate(config);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(SysConfigEntity config) {
        this.updateById(config);
        sysConfigRedis.saveOrUpdate(config);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateValueByKey(String key, String value) {
        baseMapper.updateValueByKey(key, value);
        sysConfigRedis.delete(key);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteBatch(Long[] ids) {
        for(Long id : ids){
            SysConfigEntity config = this.selectById(id);
            sysConfigRedis.delete(config.getDataKey());
        }

        this.deleteBatchIds(Arrays.asList(ids));
    }

    @Override
    public String getValue(String key) {
        SysConfigEntity config = sysConfigRedis.get(key);
        if(config == null){
            config = baseMapper.queryByKey(key);
            sysConfigRedis.saveOrUpdate(config);
        }

        return config == null ? null : config.getValue();
    }

    @Override
    public <T> T getConfigObject(String key, Class<T> clazz) {
        String value = getValue(key);
        if(StringUtils.isNotBlank(value)){
            return new Gson().fromJson(value, clazz);
        }

        try {
            return clazz.newInstance();
        } catch (Exception e) {
            throw new RRException("获取参数失败");
        }
    }

}
