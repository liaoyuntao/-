package com.szt.common;

import com.baomidou.mybatisplus.service.IService;
import com.szt.common.utils.PageUtils;
import com.szt.modules.sys.entity.SysCommcomFieldEntity;

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
}
