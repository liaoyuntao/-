package com.szt.modules.pay.wx;

/***
 * 微信小程序
 */
public class WxMini {
    private static final  String url = "https://api.weixin.qq.com/sns/jscode2session";
    public static String getWxMiniOpenid(String appId, String secret, String code){
       String url = WxMini.url;
        url+="?appid="+appId;
        url+="&secret="+secret;
        url+="&js_code="+code+"&grant_type=authorization_code";
        System.out.println(url);
        return PayCommonUtil.httpsRequest(url,"GET","");
    }


    public static void main(String[] args) {
        System.out.println();
    }
}
