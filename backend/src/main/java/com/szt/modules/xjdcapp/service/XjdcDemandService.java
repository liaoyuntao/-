package com.szt.modules.xjdcapp.service;

import com.szt.common.CommonService;
import com.szt.modules.xjdc.entity.XjdcDemandEntity;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

/**
 * 需求信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:35:05
 */
public interface XjdcDemandService extends CommonService<XjdcDemandEntity> {

    /**
     * 保存提交需求信息
     * @param xjdcDemand
     * @param appid
     */
    void insertXjdcDemandEntity(XjdcDemandEntity xjdcDemand,String appid);
}