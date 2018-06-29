package com.szt.modules.xjdcapp.service;

import com.szt.common.CommonService;
import com.szt.modules.xjdc.entity.XjdcUserEntity;

/**
 * 用户信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:35:05
 */
public interface XjdcUserService extends CommonService<XjdcUserEntity> {

    /**
     * 根据openid查询用户信息
     * @param openId
     * @return
     */
    Long selectXjdcUserByOpenid(String openId);
}