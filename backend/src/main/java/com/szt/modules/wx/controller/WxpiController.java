package com.szt.modules.wx.controller;

import com.alibaba.fastjson.JSON;
import com.szt.common.exception.RRException;
import com.szt.common.utils.EscapeUnescape;
import com.szt.common.utils.R;
import com.szt.config.RedisUtil;
import com.szt.modules.wx.entity.WxUserInfoEntity;
import com.szt.modules.wx.service.WxUserInfoService;
import com.szt.modules.wx.utils.CRequest;
import com.szt.modules.wx.utils.WechatUtils;
import com.szt.modules.xjdc.entity.XjdcUserEntity;
import com.szt.modules.xjdcapp.service.XjdcUserService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 定时任务管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 17:51:32
 */
@Slf4j
@Api(value = "定时任务管理接口", tags = "定时任务管理接口")
@RestController
@RequestMapping("api/wxapi")
@Controller("wxapi")
public class WxpiController {
    @Autowired
    private WxUserInfoService wxUserInfoService;
    @Autowired
    private XjdcUserService xjdcUserService;
    @Autowired
    private  RedisUtil redisUtil;
    /**
     * 微信网页授权地址
     * 授权参数http://localhost:8080/xjdc/api/wxapi/wxAuthor?appid=wx834703e9896eb0e6&url=http://shuly.s1.natapp.cc/xjdc/app/house.html
     * appid未需要授权的公众号
     * url=授权后跳转的地址
     */
    @RequestMapping("/wxAuthor")
    public void wxAuthor(HttpServletRequest request,HttpServletResponse response,String url,String appid,String state) {
        try {
            if(StringUtils.isBlank(appid)){
                throw new RRException("appid不能为空!");
            }
            if(StringUtils.isBlank(appid)){
                throw new RRException("url不能为空!");
            }
            String urls = wxUserInfoService.wxAuthor(url,appid,state);
            response.sendRedirect( urls);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 获取用户信息进行授权
     */
    @RequestMapping("/getUserInfo")
    public void getUserInfo(HttpServletRequest request,HttpServletResponse response) {
        String code =  request.getParameter("code");
        String state = request.getParameter("state");
        if(StringUtils.isBlank(code)){
            throw new RRException("微信没有返回code,请联系管理员!");
        }
        if(StringUtils.isBlank(state)){
            throw new RRException("您没有跳转路径");
        }
        Map<String,String> map = CRequest.URLRequest(state);
        WxMpUser wxuser = wxUserInfoService.getWxUser(code,map.get("appid"));
        XjdcUserEntity xjdcUserEntity = new XjdcUserEntity();
        xjdcUserEntity.setOpenid(wxuser.getOpenId());
        //如果用户信息不存在则保存用户信息
        if(xjdcUserService.selectXjdcUserByOpenid(wxuser.getOpenId())==0L){
            xjdcUserEntity = new XjdcUserEntity();
            xjdcUserEntity.insert();
            //微信赋值
            xjdcUserEntity.setWxuser(wxuser);
            xjdcUserService.insert(xjdcUserEntity);
        }
        redisUtil.set(code, JSON.toJSONString(wxuser),7200L);
        try {
            response.sendRedirect(state+"&openid="+wxuser.getOpenId());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 获取用户信息进行授权
     */
    @RequestMapping("/getWxJsdkInfo")
    public R getWxJsdkInfo(@RequestParam  Map<String,Object> map) throws IOException {
        String appid = (String) map.get("appid");
        String url = (String) map.get("url");
        url=url.replace("&amp;","&");
            if(StringUtils.isBlank(appid)){
                throw new RRException("appid不能为空!");
            }
            if(StringUtils.isBlank(url)){
                throw new RRException("url不能为空!");
            }
           WxUserInfoEntity user =  wxUserInfoService.getWxUserByAppId(appid);
       Map<String, Object> a=  WechatUtils.getSign(user.getAppid(),user.getAppSecret(),url);
        a.put("appId",appid);
//            String config = "wx.config({\n" +
//                    "        appId: "+user.getAppid()+",\n" +
//                    "        timestamp: "+a.get("timestamp")+",\n" +
//                    "        nonceStr: "+a.get("nonceStr")+",\n" +
//                    "        signature: "+a.get("signature")+",\n" +
//                    "        jsApiList: [\n" +
//                    "            'chooseImage',//拍照或从手机相册中选图接口\n" +
//                    "            'previewImage',//预览图片接口\n" +
//                    "            'uploadImage',//上传图片接口\n" +
//                    "            'downloadImage'//下载图片接口\n" +
//                    "        ]\n" +
//                    "    });";
//        String config = "" +
//                                "wx.config("+JSON.toJSONString(a)+");";
            return R.ok().put("data",a);
    }
}
