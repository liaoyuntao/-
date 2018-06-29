package com.szt.common;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import com.szt.modules.generator.constant.GeneratorTemplateConstant;
import com.szt.modules.sys.entity.SysCommcomFieldEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * 公抽象共业务层
 */
public abstract class CommonServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl<M, T> {
    /**
     * 自动分页
     *
     * @param params
     * @return
     */
    public PageUtils queryPage(Map<String, Object> params)  {
        Wrapper wrapper = Condition.create();
        Page<T>  page = null;
        try{
              page = this.selectPage(new Query<T>(params,wrapper).getPage(),wrapper);
        }catch (Exception e){
            e.printStackTrace();
        }

        return new PageUtils(page);
    }
    /**
     * 自动分页查询
     * @param params
     * @return
     */
    public Page<T> queryPage(Map<String, Object> params,T entity)  {
        try {
            BeanUtils.copyProperties(entity, entity.getClass());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        Page<T> page = new Page<T>(Integer.parseInt((String)params.get("limit")), Integer.parseInt((String)params.get("page")));
        EntityWrapper<T> eWrapper = new EntityWrapper<T>(entity);
        eWrapper.in("delete_flag",new Object[]{GeneratorTemplateConstant.DELETE_FLAG_0,GeneratorTemplateConstant.DELETE_FLAG_1});
        Page<T> roleDOList = selectPage(page, eWrapper);

        return roleDOList;
    }
    /**
     * 逻辑删除
     *
     * @param ids
     * @param sysCommcomFieldEntity
     */
    public void deleteFlagIds(Long[] ids, SysCommcomFieldEntity sysCommcomFieldEntity) {
        for (Long id : ids) {
            sysCommcomFieldEntity.setId(id);
            sysCommcomFieldEntity.setDeleteFlag(CommonConstant.DELETE_FLAG_1);
            baseMapper.updateById((T) sysCommcomFieldEntity);
        }
    }

}
