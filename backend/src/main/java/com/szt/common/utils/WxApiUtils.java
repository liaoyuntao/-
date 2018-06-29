package com.szt.common.utils;

import com.alibaba.fastjson.JSON;
import com.szt.common.exception.RRException;
import com.szt.config.RedisUtil;
import com.szt.modules.wx.entity.WxUserInfoEntity;
import com.szt.modules.wx.service.WxUserInfoService;
import com.szt.modules.wx.utils.Template;
import com.szt.modules.wx.utils.TemplateParam;
import com.szt.modules.wx.utils.WechatUtils;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * 微信api
 */
@Slf4j
public class WxApiUtils {
    private static RedisUtil redisUtil;

    private static WxUserInfoService wxwxUserInfoService;

    static {
        redisUtil = SpringContextUtils.getBean("redisUtil", RedisUtil.class);
        wxwxUserInfoService = SpringContextUtils.getBean("wxwxUserInfoService", WxUserInfoService.class);
    }

    /**
     * 生成微信appI
     *
     *
     * @param s
     * @param appId       appid
     * @param state       携带业务参数
     * @param scope       授权方式snsapi_userinfo
     * @return
     */
    public static String wxLogin( String url, String appId, String state, String scope,String DOMAIN_NAME) {
       // WxUserInfoEntity info = wxwxUserInfoService.getWxUserByAppId(appId);
        // 首先配置你的公众号信息
        WxMpInMemoryConfigStorage config = new WxMpInMemoryConfigStorage();
        config.setAppId(appId.trim());
        WxMpService wxMpService = new WxMpServiceImpl();
        wxMpService.setWxMpConfigStorage(config);
        String statea=EscapeUnescape.escape(url+"?"+"appid="+appId);
        if(state!=null){
            statea+= "&state"+state;
        }
        return wxMpService.oauth2buildAuthorizationUrl(DOMAIN_NAME+"/api/wxapi/getUserInfo", scope,statea);
    }


    /**
     * URL 转码
     *
     * @return String
     * @author lifq
     * @date 2015-3-17 下午04:10:28
     */
    public static String getURLEncoderString(String str) {
        String result = "";
        if (null == str) {
            return "";
        }
        try {
            result = java.net.URLEncoder.encode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }


    /**
     * 获得code来换取用户信息
     */
    public static WxMpUser getWxUser(String appId, String code) {
        WxUserInfoEntity info = wxwxUserInfoService.getWxUserByAppId(appId);
        WxMpOAuth2AccessToken config = null;
        WxMpUser user = null;
        WxMpInMemoryConfigStorage configStorage = new WxMpInMemoryConfigStorage();
        configStorage.setAppId(info.getAppid());
        configStorage.setSecret(info.getAppSecret());
        configStorage.setToken("");
        configStorage.setAesKey("");
        WxMpService wxMpService = new WxMpServiceImpl();
        wxMpService.setWxMpConfigStorage(configStorage);
        String jsonUser = (String) redisUtil.get(code);
        if (StringUtils.isBlank(jsonUser)) {
            try {
                config = wxMpService.oauth2getAccessToken(code);
                user = wxMpService.oauth2getUserInfo(config, "zh_CN");
                redisUtil.set(code, JSON.toJSONString(user));
            } catch (WxErrorException e) {
                throw new RRException("授权获取用户信息失败", e);
            }
        } else {
            user = JSON.parseObject((jsonUser), WxMpUser.class);
        }
        return user;
    }

//    /**
//     * 发送模板推送
//     */
//    public static void sendModel(String appid, String appsetate, String sendOpenid, String receivOpenid, String templateId, List<TemplateParam> paras) {
//
//    }


}
