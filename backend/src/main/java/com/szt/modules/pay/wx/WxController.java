package com.szt.modules.pay.wx;

import com.alibaba.fastjson.JSON;
import com.jpay.ext.kit.HttpKit;
import com.jpay.ext.kit.PaymentKit;
import com.jpay.weixin.api.WxPayApiConfigKit;
import com.szt.config.RedisUtil;
import com.szt.modules.pay.CallbackFunction;
import com.szt.modules.pay.SerializeUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("api")
public class WxController {
    @Autowired
    private RedisUtil redisUtil;
    @RequestMapping(value = "/wxNotifyUrl", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String wxNotifyUrl(HttpServletRequest request) throws ParseException {
        Map<String, String> xml = new HashMap<String, String>();
//        xml.put("return_code", "FAIL");
//        xml.put("return_msg", "result_code is FAIL");
        // 支付结果通用通知文档: https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_7
        log.info("微信支付回调开始");
        String xmlMsg = HttpKit.readData(request);
        log.info("微信支付通知=" + xmlMsg);
        Map<String, String> resultData = PaymentKit.xmlToMap(xmlMsg);
        //根据订单号从redlis中查询信息
        Map<String, Object> addData = (Map<String, Object>) JSON.parse((String) redisUtil.get(resultData.get("out_trade_no")));
        String result_code = resultData.get("result_code");
        // 注意重复通知的情况，同一订单号可能收到多次通知，请注意一定先判断订单状态
        // 避免已经成功、关闭、退款的订单被再次更新
        if (PaymentKit.verifyNotify(resultData, WxPayApiConfigKit.getWxPayApiConfig().getPaternerKey())) {
            if ("SUCCESS".equals(result_code)) {
                CallbackFunction call = CallbackFunction.CallbackFunctionMap.map.get(addData.get("callType"));
                if (call!=null && call.run(resultData, addData)) {
                    xml.put("return_code", "SUCCESS");
                    xml.put("return_msg", "OK");
                } else {
                    xml.put("return_code", "FAIL");
                    xml.put("return_msg", "result_code is FAIL");
                }
            } else {
                log.info("支付失败");
            }
        }
        log.info("微信支付回调结束");
        return PaymentKit.toXml(xml);
    }
}
