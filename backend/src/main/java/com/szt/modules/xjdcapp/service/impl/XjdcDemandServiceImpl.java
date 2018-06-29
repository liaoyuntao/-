package com.szt.modules.xjdcapp.service.impl;

import com.szt.common.CommonServiceImpl;
import com.szt.modules.wx.controller.WxTemplate;
import com.szt.modules.xjdc.dao.XjdcDemandDao;
import com.szt.modules.xjdc.entity.XjdcDemandEntity;
import com.szt.modules.xjdcapp.service.XjdcDemandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 需求信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:35:05
 */
@Service("xjdcappxjdcDemandService")
public class XjdcDemandServiceImpl extends CommonServiceImpl<XjdcDemandDao, XjdcDemandEntity> implements XjdcDemandService {

    @Autowired
    private WxTemplate wxTemplate;
    @Override
    @Transactional
    public void insertXjdcDemandEntity(XjdcDemandEntity xjdcDemand,  String appid) {
        baseMapper.insert(xjdcDemand);
        wxTemplate.insertXjdcDemandModel(xjdcDemand,appid);
    }
}
