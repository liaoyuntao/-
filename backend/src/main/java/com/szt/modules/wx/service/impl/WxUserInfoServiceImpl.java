package com.szt.modules.wx.service.impl;

import com.szt.common.exception.RRException;
import com.szt.common.utils.*;
import com.szt.modules.pay.wx.WxConstant;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.wx.dao.WxUserInfoDao;
import com.szt.modules.wx.entity.WxUserInfoEntity;
import com.szt.modules.wx.service.WxUserInfoService;

import java.util.List;

/**
 * 微信公众号管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-22 14:49:05
 */
@Service("wxwxUserInfoService")
public class WxUserInfoServiceImpl extends CommonServiceImpl<WxUserInfoDao, WxUserInfoEntity> implements WxUserInfoService {
    /**
     * 授权回调地址
     */
    @Value("${dommain}")
    public  String DOMAIN_NAME ;
    @Override
    public String wxAuthor(String url, String appid,String state) {
        return WxApiUtils.wxLogin(url,appid,state,"snsapi_userinfo",DOMAIN_NAME);
    }
    @Override
    public WxMpUser getWxUser(String code, String appid) {
        return WxApiUtils.getWxUser(appid,code);
    }

    @Override
    public WxUserInfoEntity getWxUserByAppId(String appid) {
        WxUserInfoEntity en = new WxUserInfoEntity();
        en.setAppid(appid);
        en=baseMapper.selectOne(en);
        if(en==null){
            throw new RRException("您当前的公众号不在管理中");
        }
        return en;
    }


}
