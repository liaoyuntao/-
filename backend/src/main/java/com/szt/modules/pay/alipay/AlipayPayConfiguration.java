package com.szt.modules.pay.alipay;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.domain.AlipayTradePrecreateModel;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.jpay.alipay.AliPayApi;
import com.jpay.alipay.AliPayApiConfig;
import com.jpay.alipay.AliPayApiConfigKit;
import com.szt.config.RedisUtil;
import com.szt.modules.pay.CallbackFunction;
import com.szt.modules.pay.SerializeUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 微信支付相关配置
 * <p>
 * Created by bjliumingbo on 2017/5/12.
 */
@Slf4j
@Component
public class AlipayPayConfiguration implements Serializable {
    @Autowired
    private AliPayBean aliPayBean;
    @Autowired
    private RedisUtil redisUtil;

    /**
     * 支付宝app通用支付
     *
     * @param title   支付标题
     * @param body    内容
     * @param type    支付类型,需要定义常量回调时通过type类型运行指定的回调
     * @param attach  携带回调参数
     * @param money   支付金额
     * @param orderNo 订单号
     * @param fun     回调函数
     * @return
     * @throws AlipayApiException
     */
    public String alipayAppPay(String title, String body, CallbackFunction.CallbackFunctionType callType, Map<String, Object> attach, String money, String orderNo, CallbackFunction fun) throws AlipayApiException {
        AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
        model.setBody(body);
        model.setSubject(title);
        model.setOutTradeNo(orderNo);
        model.setTotalAmount(money);
        model.setTimeoutExpress("30m");
        attach.put("callPay", callType);
        model.setPassbackParams(JSON.toJSONString(attach));
        model.setProductCode("QUICK_MSECURITY_PAY");
        return AliPayApi.startAppPay(model, AlipayConstant.DOMAIN_NAME);
    }

    /**
     * 支付宝扫码通用支付
     *
     * @param title   支付标题
     * @param body    内容
     * @param type    支付类型,需要定义常量回调时通过type类型运行指定的回调
     * @param attach  携带回调参数
     * @param money   支付金额
     * @param orderNo 订单号
     * @param fun     回调函数
     * @return
     * @throws AlipayApiException
     */
    public String alipaSmPay(String title, String body, String type, HashMap<String, Object> attach, String money, String orderNo, CallbackFunction fun) throws AlipayApiException, IOException, ClassNotFoundException {
        AlipayTradePrecreateModel model1 = new AlipayTradePrecreateModel();
        model1.setTotalAmount(money);
        model1.setSubject(title);
        model1.setBody(body);
        model1.setOutTradeNo(orderNo);
        if (redisUtil.get(type) == null) {
            redisUtil.set(type, SerializeUtils.objectSerialiable(fun));
        }
        AlipayTradePrecreateResponse s = AliPayApi.tradePrecreatePayToResponse(model1, "http://shuly.s1.natapp.cc/renren-fast/api/alipayNotifyUrl");
        //  log.info(s.getQrCode());
        return s.getQrCode();
    }

    //    #支付宝配置
//    alipay:
//    appId: 2018030602323975
//    privateKey: MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCXKPmONbuqhfOhxLHTLClprFdTNjQ/3TnrsPe3729kTlkhQS+zZOVOvFDeOiNa9SKWlwMJqgi67qJKfLdKnzVLpL/uiA0Y2NZc6oETuKctmp6ZvJmJWTeolkTeyv5jpl7gNmDsFvHsd9b1XJq8p+itP9kEdDb56AGVW1Tuv0uksncPVE5qIzzPQ61hiv5XIrJAQjmODtaY8DwUsbfwVsB3QNjwUrb6SVBQ7WBYPs4vU5xkZl9zJ3IyVjfm+NZI4dmFiUb+6PRPth45aGyv1VvhLeJtvTtjihqf3yE0visalbh/UiBRyWBb6GYBPZxgUj4FMYcGIcymRI4/AKoIcA6ZAgMBAAECggEBAIQiRUOSpOGDBl06W1eFGw5MoGkU0Mei0qa8o04d9vlvo2n2WYQvhmM1KluX5p/z+LA6gWVJRShiwWrrai3IzgW5li0ksI4vvfKq6voaR8kNh+ZLfssZOhYchUdbmtPw8q572m2GASP7/eOtd3XCMRqA3WuPSx9ZN0kf9TZd8fmcz5pBmAVO5hlS/CiqI4zNDTC+53aXnYvqq+7t+qa9KVwAut4i0+UUet5RPm+fwVxmxlpBGWB0B8EbLEc3hB80eBnjXAazyEz0XGnKqoPqXTNAs8zB/pILJhDfuRARqWQCpNuldM48tqTulUcUBt3mABQBf4VTHpYUv7YOD7h8miECgYEAxf1mKSIAmrmNIcMRD7f6/ipSbcbiOhdJDGeuZ8Mb8/7Jv13DhixYUphtGchSoyD7ZXC3Q+k9EC9bPtYygHW0THSqnIduJnuK2QTOaRlYZ6A4VuH6t/uiNsSXY0D971T6gBakMXnaU+2OQQhUbsMkf5CBSm7V4ASMN1tQgx/BlVMCgYEAw3MFDPorzjLFttv490caJUcJrXAqMpn/TwVODsUzSns1Zd3JM9fzEJVy0Ay7JtGtdtTDbsGEY7Rj+uDISVqqLQPgmwyynOur0X5bOBwYx6Y++mphQrewuoM0QAI3l/GYdro2h1VDgIl/hzi3o5Pl3IMNdG+/BO+RIeWFcQ8qAuMCgYEApdS0eMdOEkpP93NXGv9Sbwgrul7WpSlTudwtrCMzio5hlLOITR1fbO7Wkr3C2XeKmVBrb6ovxxqjJmJqMkZkGZWuQST+EaVwio0IBeeAsGr2RW9JfEh7ebv3wN5y0r8ugZJ1PCt/vsQ+XiIH9i3kqCP05s8mvFeSydrl+K3kipkCgYB3j/YoASYpBqAyg5Bi3Kke4r0Fz1bRC6nGEk209WeyCXsZ7Ln3sAQuQe4xXYhjb+M4jWFccJ9nSuPahgWf8gmmbffJgdQF8Jl0F2MACRgTkhx2nfsPkEVZY4fkHDccCRwmjTVsRnl7uSE9fDHCrGfyJG1nrDBjeZYD8V9XUVp21wKBgFhBeLaEahgBSCkEBe1sTi1Hi7GYaqUKK9PvrzFA4SxiWMhJuGEM4Eq3y3HsEmDcBlEQMfY6DqpBx3CHlTx2l3t0Ivr7Qb/N7Ay3kML7yDBOEwVQW3uJOR+/PCeDb/k+MUNKf1ePMVcEqWWAFvUpmdPrB3/DpcjfnBdeG1NHDScZ
//    publicKey: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsYqYszHEenGPDAv7D73t71NBOrxyIcKml/LwOdPPK9AlF5zglsam2fhjP0UbVGNUX3dZWXzzJzhp8Py37b83LcB2nkN80wi5Ry6lv/M2hMXuwJoas+SKyBW4oxqO/L6GCJeCXf6rlxfTPejbVva3EH0jnOGzN+hRGn+Yq0z3aFe+Woo4RBYC4PjnI0JisVVQWy9OGBxo6zUzt0JlkJJSS4VvhHdZU+/QIcke1izTV+NJZ/297RWqymreCWpjF14RuwYsVG5OSmiFfT+JTg4xVT+avX1l7c+7zdRmLNit/x/NYEFfEGO/Ul7jG89Q6t4fAUSdKA17ozhrKebMqGKJJwIDAQAB
//    alipayPublicKey: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsYqYszHEenGPDAv7D73t71NBOrxyIcKml/LwOdPPK9AlF5zglsam2fhjP0UbVGNUX3dZWXzzJzhp8Py37b83LcB2nkN80wi5Ry6lv/M2hMXuwJoas+SKyBW4oxqO/L6GCJeCXf6rlxfTPejbVva3EH0jnOGzN+hRGn+Yq0z3aFe+Woo4RBYC4PjnI0JisVVQWy9OGBxo6zUzt0JlkJJSS4VvhHdZU+/QIcke1izTV+NJZ/297RWqymreCWpjF14RuwYsVG5OSmiFfT+JTg4xVT+avX1l7c+7zdRmLNit/x/NYEFfEGO/Ul7jG89Q6t4fAUSdKA17ozhrKebMqGKJJwIDAQAB
//    serverUrl: https://openapi.alipay.com/gateway.do
//    domain: https://shop.3zhit.com
    public static void main(String[] args) throws AlipayApiException, IOException, ClassNotFoundException {

//       AliPayApiConfigKit.setThreadLocalAliPayApiConfig(AliPayApiConfig.New()
//                .setAppId("2018011601911087")
//                .setAlipayPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgYZ0gAzX2aL4QZ3SLTCsuhzSywj4T6s/wVz4ZdAi5Q+QyFctzOXQo6uegjlbkmWJ4x5S8Fhu0z+dOxkLVsYs/768IeBT+jEogSPfV31+V/A0GnoZteY63f2TibK4kEdkU3lwoKimrzgsX2lp4Gj2dM+/TggjNSSGoHYW50tZr68xCGLjLg2c7/5wC3Llrb8n44eSukylvrUf7MhgheDaro9AYtsSf8W2wgjwaNkjxEdlbVP+eLXWpVl2c1nd0xtf0lFm8j+erJd2jtpVPhVrL4F/ABF0uVIRcFR5RQcDtkdRtQOtMu6kO9Ub43gARQDMw7t5ldI3sSHT7fL8+ZRU1QIDAQAB")
//                .setCharset("UTF-8")
//                .setPrivateKey("MIIEugIBADANBgkqhkiG9w0BAQEFAASCBKQwggSgAgEAAoIBAQCBhnSADNfZovhBndItMKy6HNLLCPhPqz/BXPhl0CLlD5DIVy3M5dCjq56COVuSZYnjHlLwWG7TP507GQtWxiz/vrwh4FP6MSiBI99XfX5X8DQaehm15jrd/ZOJsriQR2RTeXCgqKavOCxfaWngaPZ0z79OCCM1JIagdhbnS1mvrzEIYuMuDZzv/nALcuWtvyfjh5K6TKW+tR/syGCF4Nquj0Bi2xJ/xbbCCPBo2SPER2VtU/54tdalWXZzWd3TG1/SUWbyP56sl3aO2lU+FWsvgX8AEXS5UhFwVHlFBwO2R1G1A60y7qQ71RvjeABFAMzDu3mV0jexIdPt8vz5lFTVAgMBAAECggEATKXCPxxah0G3Yyz/eRp6vE/eNaQDPTH7snNP0wAOBjrl1IgyZDQC+TfPvwQuOj24ERyau/u46W2Vn6k8Woc/jb/TGMDlMQLyEymlOuLaZzOPwbNLj6bEYyVxr2SBb2+v4O3WRlxG9x1otLVuoAu8/HcLoCOUohgRStdWylx+oEVWVI8Lf1VeMyDYgnqwKWxV2q9JgXxqwEtciLycy5m005FlDSg7a4xr7LFKPmYMi13ytXAbrM7cu7F0ph+4Ao4APK/gCdBNB1ZJP3onZgIzjYNCrFOm74Ony/+W0VaV5vg9jwru3xC04EfCOYGD/4/mqb5sHhJ/1E04k2GNetus6QKBgQC5Sp3lZy+NgxanIyJgra1pZd1yzYuevY93EjwaEQXlyHYqrd7tNSMuyqewUXYhxwIzbM24/LzacfbsYgxPCn+Rcnj0dhuSQwxBuHPE9w0WecheFf2Mfr1xsbqrWUuefgP1n2YxEKX9audCEHaUyKzm2TGwH0yOOl4iq9Gd9rHugwKBgQCy8/Ri2U4OUCvDqFRo7pzso2osRtuxn1iPn8B6oR5ItbzTOzOC1ERMeIOLAGZvHvVjg3ui72hH8zwyzh2UruC6g5iEsUoyW3LU5m6Lhg/A2W3gPZCoYFI49L8Ktb1hdcv1Eu6SeMJ65lar4tmDdBBeTrv3+8rQkB5YQnkG2HjPxwKBgBZzkSBL2Xo3KRaFblPyl3GO8z9G4qUQaQLPhdLOvz0xhgfz23A4oRO5YIo/xKWhHIYop+DDVwrNBlNsKful1QFFspxEd2DImQKZnAWAveg8R2gHGBre/It7MpgykLQaptYrQ1Gsp8BGJNFfd07d5f1u0dN6Z2dQcTmYQiT20GaLAoGAO2PHOX8Q7qMgwyB8Uw7NuaNKO0OQ6dQOWiwUfx41pL/b2OaO4956hD6CuYD6fepyWgJq59o4a5iH4/yPyKZ5Iq1F0tPb4faDl7CaA2gMll4SnxcPiTHeV9SyCmXiYhPsCnur/aRiNtN29DinI39DZ2kN7PD9kFYkG/qDnAf/oEUCf1r/RxEkYbw//g+Tu1oumRqq5YLAIFPIMXLle84/BhvK4U/WFc8YcWZ4vpHC8Ldx1ORzHR4vwWW4tIKBK5l+YtH71YZrkDhgT/RwpFdxdxfktGUaP/+VAUaLNoAHMAVlHNcsjCIhptvVnlUhFk921G8n3OMTpCEdEVDSEVXky68=")
//                .setServiceUrl("https://openapi.alipay.com/gateway.do")
//                .setSignType("RSA2")
//                .build());
        AliPayApiConfigKit.setThreadLocalAliPayApiConfig(AliPayApiConfig.New()
                .setAppId("2018030602323975")
                .setAlipayPublicKey("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsYqYszHEenGPDAv7D73t71NBOrxyIcKml/LwOdPPK9AlF5zglsam2fhjP0UbVGNUX3dZWXzzJzhp8Py37b83LcB2nkN80wi5Ry6lv/M2hMXuwJoas+SKyBW4oxqO/L6GCJeCXf6rlxfTPejbVva3EH0jnOGzN+hRGn+Yq0z3aFe+Woo4RBYC4PjnI0JisVVQWy9OGBxo6zUzt0JlkJJSS4VvhHdZU+/QIcke1izTV+NJZ/297RWqymreCWpjF14RuwYsVG5OSmiFfT+JTg4xVT+avX1l7c+7zdRmLNit/x/NYEFfEGO/Ul7jG89Q6t4fAUSdKA17ozhrKebMqGKJJwIDAQAB")
                .setCharset("UTF-8")
                .setPrivateKey("MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCXKPmONbuqhfOhxLHTLClprFdTNjQ/3TnrsPe3729kTlkhQS+zZOVOvFDeOiNa9SKWlwMJqgi67qJKfLdKnzVLpL/uiA0Y2NZc6oETuKctmp6ZvJmJWTeolkTeyv5jpl7gNmDsFvHsd9b1XJq8p+itP9kEdDb56AGVW1Tuv0uksncPVE5qIzzPQ61hiv5XIrJAQjmODtaY8DwUsbfwVsB3QNjwUrb6SVBQ7WBYPs4vU5xkZl9zJ3IyVjfm+NZI4dmFiUb+6PRPth45aGyv1VvhLeJtvTtjihqf3yE0visalbh/UiBRyWBb6GYBPZxgUj4FMYcGIcymRI4/AKoIcA6ZAgMBAAECggEBAIQiRUOSpOGDBl06W1eFGw5MoGkU0Mei0qa8o04d9vlvo2n2WYQvhmM1KluX5p/z+LA6gWVJRShiwWrrai3IzgW5li0ksI4vvfKq6voaR8kNh+ZLfssZOhYchUdbmtPw8q572m2GASP7/eOtd3XCMRqA3WuPSx9ZN0kf9TZd8fmcz5pBmAVO5hlS/CiqI4zNDTC+53aXnYvqq+7t+qa9KVwAut4i0+UUet5RPm+fwVxmxlpBGWB0B8EbLEc3hB80eBnjXAazyEz0XGnKqoPqXTNAs8zB/pILJhDfuRARqWQCpNuldM48tqTulUcUBt3mABQBf4VTHpYUv7YOD7h8miECgYEAxf1mKSIAmrmNIcMRD7f6/ipSbcbiOhdJDGeuZ8Mb8/7Jv13DhixYUphtGchSoyD7ZXC3Q+k9EC9bPtYygHW0THSqnIduJnuK2QTOaRlYZ6A4VuH6t/uiNsSXY0D971T6gBakMXnaU+2OQQhUbsMkf5CBSm7V4ASMN1tQgx/BlVMCgYEAw3MFDPorzjLFttv490caJUcJrXAqMpn/TwVODsUzSns1Zd3JM9fzEJVy0Ay7JtGtdtTDbsGEY7Rj+uDISVqqLQPgmwyynOur0X5bOBwYx6Y++mphQrewuoM0QAI3l/GYdro2h1VDgIl/hzi3o5Pl3IMNdG+/BO+RIeWFcQ8qAuMCgYEApdS0eMdOEkpP93NXGv9Sbwgrul7WpSlTudwtrCMzio5hlLOITR1fbO7Wkr3C2XeKmVBrb6ovxxqjJmJqMkZkGZWuQST+EaVwio0IBeeAsGr2RW9JfEh7ebv3wN5y0r8ugZJ1PCt/vsQ+XiIH9i3kqCP05s8mvFeSydrl+K3kipkCgYB3j/YoASYpBqAyg5Bi3Kke4r0Fz1bRC6nGEk209WeyCXsZ7Ln3sAQuQe4xXYhjb+M4jWFccJ9nSuPahgWf8gmmbffJgdQF8Jl0F2MACRgTkhx2nfsPkEVZY4fkHDccCRwmjTVsRnl7uSE9fDHCrGfyJG1nrDBjeZYD8V9XUVp21wKBgFhBeLaEahgBSCkEBe1sTi1Hi7GYaqUKK9PvrzFA4SxiWMhJuGEM4Eq3y3HsEmDcBlEQMfY6DqpBx3CHlTx2l3t0Ivr7Qb/N7Ay3kML7yDBOEwVQW3uJOR+/PCeDb/k+MUNKf1ePMVcEqWWAFvUpmdPrB3/DpcjfnBdeG1NHDScZ")
                .setServiceUrl("https://openapi.alipay.com/gateway.do")
                .setSignType("RSA2")
                .build());
        AlipayConstant.DOMAIN_NAME = "http://shuly.s1.natapp.cc/renren-fast/api/alipayNotifyUrl";
//       String orderInfo= AlipayPayConfiguration.alipayAppPay("测试", "内容", "test", new HashMap<>(), "0.01", "001", new CallbackFunction() {
//            @Override
//            public boolean run(Map<String, String> resultData, Map<String, Object> addData) {
//                return false;
//            }
//        });
        AlipayPayConfiguration ali = new AlipayPayConfiguration();
        String a = ali.alipaSmPay("通用扫码支付", "内容", "test", new HashMap<String, Object>(), "0.01", UUID.randomUUID().toString(), new CallbackFunction() {
            @Override
            public boolean run(Map<String, String> resultData, Map<String, Object> addData) {
                log.info("进来了");
                return true;
            }
        });
        log.info(a);

        //log.info(orderInfo);
        // String orderInfo = AliPayApi.startAppPay(model, "http://shuly.s1.natapp.cc/renren-fast/api/alipayNotifyUrl");

    }


    /**
     * 初始化数据
     */
    @PostConstruct
    public void init() {
        //初始化微信和支付宝配置
        AliPayApiConfig aliPayApiConfig = AliPayApiConfigKit.setThreadLocalAliPayApiConfig(AliPayApiConfig.New()
                .setAppId(aliPayBean.getAppId())
                .setAlipayPublicKey(aliPayBean.getPublicKey())
                .setCharset("UTF-8")
                .setPrivateKey(aliPayBean.getPrivateKey())
                .setServiceUrl(aliPayBean.getServerUrl())
                .setSignType("RSA2")
                .build());

        if (aliPayBean.getDomain() == null || aliPayBean.getDomain().length() == 0) {
            log.error("回调路径不能为空");
            System.exit(0);
        }
        //初始化月底提现次数

    }

}