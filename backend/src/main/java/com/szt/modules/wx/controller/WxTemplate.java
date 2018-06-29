package com.szt.modules.wx.controller;

import com.szt.common.utils.DateUtils;
import com.szt.modules.generator.config.InitBusConfig;
import com.szt.modules.wx.entity.WxUserInfoEntity;
import com.szt.modules.wx.service.WxUserInfoService;
import com.szt.modules.wx.utils.Template;
import com.szt.modules.wx.utils.TemplateParam;
import com.szt.modules.wx.utils.WechatUtils;
import com.szt.modules.xjdc.entity.XjdcDemandEntity;
import com.szt.modules.xjdc.entity.XjdcHouseSourceEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class WxTemplate {
    @Autowired
    private WxUserInfoService wxUserInfoService;
    /**
     * 客户提交房源时发送模板
     * @param s
     * @param xjdcDemand
     * @param appid
     */
    public  void insertXjdcHouseSourceModel(XjdcHouseSourceEntity xjdcDemand, String appid) {
        Template tem = new Template();
        tem.setOpenid(xjdcDemand.getOpenid());
        WxUserInfoEntity appInfo = wxUserInfoService.getWxUserByAppId(appid);
        tem.setTemplateId("ETmrjwFB1qIPbqDN2Paw6tU_0yg6od7an-I8EHUQRpA");
        tem.setTopColor("#00DD00");
//        {{first.DATA}}
//        房源地址：{{keyword1.DATA}}
//        房源户型：{{keyword2.DATA}}
//        房源面积：{{keyword3.DATA}}
//        房源价格：{{keyword4.DATA}}
//        {{remark.DATA}}
//        西山前卫营马洒营南区
//        房源地址：西山前卫营马洒营南区
//        房源户型：2室1厅1卫
//        房源面积：55m
//        房源价格：43万
//        魏女士（1388888888）在赶集网发布了一条出售房源
//        xx先生/女士，审核过程中将有专人联系核实，请保持手机畅通，谢谢！~
        String aced = WechatUtils.getAccessTokenMsg(appid);
        //tem.setUrl(domainName + "/public/wxAuthor?pageUrl=html%2Forder.html%3fitemIndex%3D1");
        List<TemplateParam> paras = new ArrayList<TemplateParam>();
        paras.add(new TemplateParam("first","您好，感谢您对秒家服务的支持！您的房源 信息已经上传审核，具体信息如下：", "#FF3333"));
        paras.add(new TemplateParam("keyword1", xjdcDemand.getRegion(), "#FF3333"));
        paras.add(new TemplateParam("keyword2", InitBusConfig.buconfig.get("xjdchousesourcehousestyle").getMap().get(xjdcDemand.getHouseStyle()), "#0044BB"));
        paras.add(new TemplateParam("keyword3", xjdcDemand.getSquare()+"", "#0044BB"));
        paras.add(new TemplateParam("keyword4",  xjdcDemand.getPrice().toString()+"万", "#0044BB"));
        paras.add(new TemplateParam("remark", xjdcDemand.getName()+"，审核过程中将有专人联系核实，请保持手机畅通，谢谢！~", "#0044BB"));
        tem.setTemplateParamList(paras);
        WechatUtils.sendTemplateMsg(aced, tem);
    }

    /**
     * 求租信息推送
     * @param xjdcDemand
     * @param appid
     */
    public void insertXjdcDemandModel(XjdcDemandEntity xjdcDemand, String appid) {
        Template tem = new Template();
        tem.setOpenid(xjdcDemand.getOpenid());
        WxUserInfoEntity appInfo = wxUserInfoService.getWxUserByAppId(appid);
        tem.setTemplateId("7vnFzOzDRGhU4GD3-edDsT5FPY7N1ESB3OrGtR1Mtc0");
        tem.setTopColor("#00DD00");
//        {{first.DATA}}
//        处理状态：{{keyword1.DATA}}
//        处理时间：{{keyword2.DATA}}
//        {{remark.DATA}}
//        您好，感谢您对秒家服务的支持！您的需求信息已上传审核
//        处理状态：上传成功，正在审核
//        处理时间：{{keyword2.DATA}}
//        审核过程中将有专人联系您，请保持手机畅通
        String aced = WechatUtils.getAccessTokenMsg(appid);
        //tem.setUrl(domainName + "/public/wxAuthor?pageUrl=html%2Forder.html%3fitemIndex%3D1");
        List<TemplateParam> paras = new ArrayList<TemplateParam>();
        paras.add(new TemplateParam("first"," 您好，感谢你对秒家服务的支持！你的需求信息已上传成功，稍后会有专人联系您", "#FF3333"));
        paras.add(new TemplateParam("keyword1", "上传成功，正在处理", "#FF3333"));
        paras.add(new TemplateParam("keyword2", DateUtils.format(new Date(),"yyyy-MM-dd"), "#0044BB"));
        tem.setTemplateParamList(paras);
        WechatUtils.sendTemplateMsg(aced, tem);
    }
}
