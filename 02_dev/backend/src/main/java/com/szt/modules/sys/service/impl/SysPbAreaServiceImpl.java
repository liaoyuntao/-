package com.szt.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.sys.dao.SysPbAreaDao;
import com.szt.modules.sys.entity.SysPbAreaEntity;
import com.szt.modules.sys.service.SysPbAreaService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 地址管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-20 00:11:07
 */
@Service("syssysPbAreaService")
public class SysPbAreaServiceImpl extends CommonServiceImpl<SysPbAreaDao, SysPbAreaEntity> implements SysPbAreaService {


    @Override
    @Transactional
    public void addressReload() {
       List<SysPbAreaEntity> list =  baseMapper.selectList(null);
       for(SysPbAreaEntity item : list){
           item.insert();
           baseMapper.updateById(item);
       }
    }

    @Override
    public List<SysPbAreaEntity> addressRedisReload() {
        return selectList(null);
    }
}
