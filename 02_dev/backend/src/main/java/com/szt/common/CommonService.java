package com.szt.common;

import com.baomidou.mybatisplus.service.IService;
import com.szt.common.utils.PageUtils;
import com.szt.modules.sys.entity.SysCommcomFieldEntity;

import java.util.List;
import java.util.Map;

/**
 * 公共业务层
 */
public interface   CommonService<T> extends IService<T> {
     /**
      * 自动分页查询
      * @param params
      * @return
      */
     PageUtils queryPage(Map<String, Object> params);

     /**
      * 逻辑删除
      * @param ids
      * @param sysCommcomFieldEntity
      */
     void deleteFlagIds(Long[] ids,SysCommcomFieldEntity sysCommcomFieldEntity);

     /**
      * 新增
      */
     void insertEntity(T entity);
     /**
      * 批量新增
      * @param list
      */
     void saveAll(List<T> list);

     /**
      * 修改数据
      * @param entity
      */
     void updateEntity(T entity);

     /**
      * 删除用户信息
      * @param ids
      */
     void deleteList(List<Long> ids);
}
