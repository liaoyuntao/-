package com.szt.modules.xjdcapp.service;

import com.szt.common.CommonService;
import com.szt.modules.xjdc.entity.XjdcHouseSourceEntity;

/**
 * 佣金方式
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:35:05
 */
public interface XjdcHouseSourceService extends CommonService<XjdcHouseSourceEntity> {

    /**
     * 出售房屋
     * @param xjdcHouseSource
     * @param appid
     */
    void insertXjdcHouseSourceEntity(XjdcHouseSourceEntity xjdcHouseSource, String appid);
}