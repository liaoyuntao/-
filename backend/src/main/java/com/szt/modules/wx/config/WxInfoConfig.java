package com.szt.modules.wx.config;

import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.service.WxPayService;
import com.github.binarywang.wxpay.service.impl.WxPayServiceImpl;
import com.szt.modules.pay.wx.WxPayBean;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class WxInfoConfig {
    @Autowired
    WxPayBean wxPayBean;
    @Bean(name="wxPayConfig")
    public WxPayConfig payConfig() {
        WxPayConfig payConfig = new WxPayConfig();
        payConfig.setAppId(wxPayBean.getAppId());
        payConfig.setMchId(wxPayBean.getMchId());
        payConfig.setMchKey(wxPayBean.getPartnerKey());
        payConfig.setSubAppId("");
        payConfig.setSubMchId("");
        payConfig.setKeyPath("");

        return payConfig;
    }

    @Bean(name="wxPayService")
    public WxPayService payService() {
        WxPayService payService = new WxPayServiceImpl();
        payService.setConfig(payConfig());
        return payService;
    }
//    @Bean(name="wxMpConfigStorage")
//    public WxMpConfigStorage wxMpConfigStorage() {
//
//    }
//    @Bean(name="wxMpService")
//    public WxMpService wxMpService() {
//
//    }
}
