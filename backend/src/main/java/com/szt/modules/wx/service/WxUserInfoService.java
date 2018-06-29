package com.szt.modules.wx.service;

import com.szt.common.CommonService;
import com.szt.modules.wx.entity.WxUserInfoEntity;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

/**
 * 微信公众号管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-22 14:49:05
 */
public interface WxUserInfoService extends CommonService<WxUserInfoEntity> {

    /**
     * 微信授权
     *
     * @param s
     * @param url
     * @param token
     * @return
     */
    String wxAuthor( String url, String appid,String state);
    /**
     * 获取微信用户信息
     *
     * @param s
     * @param url
     * @param token
     * @return
     */
    WxMpUser getWxUser(String code, String appid);
    /**
     * 根据appid获取公众号信息
     *
     * */
    WxUserInfoEntity getWxUserByAppId(String appid);


}