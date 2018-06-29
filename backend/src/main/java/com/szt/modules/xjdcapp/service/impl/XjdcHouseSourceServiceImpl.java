package com.szt.modules.xjdcapp.service.impl;

import com.szt.common.CommonServiceImpl;
import com.szt.modules.wx.controller.WxTemplate;
import com.szt.modules.xjdc.dao.XjdcHouseSourceDao;
import com.szt.modules.xjdc.entity.XjdcHouseSourceEntity;
import com.szt.modules.xjdcapp.service.XjdcHouseSourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 佣金方式
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:35:05
 */
@Service("xjdcappxjdcHouseSourceService")
public class XjdcHouseSourceServiceImpl extends CommonServiceImpl<XjdcHouseSourceDao, XjdcHouseSourceEntity> implements XjdcHouseSourceService {
    @Autowired
    private WxTemplate wxTemplate;

    @Override
    public void insertXjdcHouseSourceEntity(XjdcHouseSourceEntity xjdcHouseSource,String appid) {
        baseMapper.insert(xjdcHouseSource);
        wxTemplate.insertXjdcHouseSourceModel(xjdcHouseSource,appid);
    }
}
