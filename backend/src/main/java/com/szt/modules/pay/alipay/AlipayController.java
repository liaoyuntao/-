package com.szt.modules.pay.alipay;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.szt.config.RedisUtil;
import com.szt.modules.pay.CallbackFunction;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("api")
public class AlipayController {


    @Autowired
    private AliPayBean aliPayBean;
    @Autowired
    private RedisUtil redisUtil;
    @RequestMapping(value = "/alipayNotifyUrl")
    @ResponseBody
    public String alipayNotifyUrl(HttpServletRequest request, @RequestParam Map<String, String> resultData) throws AlipayApiException {
        String result = "failure";
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
        //通过订单号从redis中获得业务参数
        Map<String, Object> addData = (Map<String, Object>) JSON.parse((String) redisUtil.get(resultData.get("out_trade_no")));
        log.info("支付宝支付回调结束");
        log.info("支付通知=" + resultData);

        //切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        boolean verify_result = AlipaySignature.rsaCheckV1(resultData, aliPayBean.getAlipayPublicKey(), "utf-8", resultData.get("sign_type"));
        // 验证成功
        if (verify_result) {
            CallbackFunction call = CallbackFunction.CallbackFunctionMap.map.get(addData.get("callType"));
            if (call != null && call.run(resultData, addData)) {
                result = "success";
            } else {
                log.info("签名错误");
            }
            log.info("支付宝支付回调结束");
        }
        return result;
    }
}
