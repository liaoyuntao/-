package com.szt;

import com.alipay.api.AlipayApiException;
import com.jpay.weixin.api.WxPayApi;
import com.szt.modules.pay.CallbackFunction;
import com.szt.modules.pay.wx.WxPayConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.util.HashMap;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class RedisTest {
    @Autowired
    private WxPayConfiguration WxPayConfiguration;

    @Test
    public void contextLoads() throws AlipayApiException, IOException, ClassNotFoundException {
        //业务参数
        HashMap<String, Object> map = new HashMap<String, Object>();
        WxPayConfiguration.wxPay(WxPayApi.TradeType.NATIVE, CallbackFunction.CallbackFunctionType.JSAPI, "扫码测试", map, "1", "998");
    }

}
