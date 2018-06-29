package com.szt.modules.xjdcapp.service.impl;

import com.szt.common.CommonServiceImpl;
import com.szt.modules.xjdc.dao.XjdcUserDao;
import com.szt.modules.xjdc.entity.XjdcUserEntity;
import com.szt.modules.xjdcapp.service.XjdcUserService;
import org.springframework.stereotype.Service;

/**
 * 用户信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:35:05
 */
@Service("xjdcappxjdcUserService")
public class XjdcUserServiceImpl extends CommonServiceImpl<XjdcUserDao, XjdcUserEntity> implements XjdcUserService {


    @Override
    public Long selectXjdcUserByOpenid(String openId) {
        return baseMapper.selectXjdcUserByOpenid(openId);
    }
}
