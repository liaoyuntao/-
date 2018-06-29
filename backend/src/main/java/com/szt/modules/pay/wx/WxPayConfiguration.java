package com.szt.modules.pay.wx;

import com.alibaba.fastjson.JSON;
import com.jpay.ext.kit.PaymentKit;
import com.jpay.weixin.api.WxPayApi;
import com.jpay.weixin.api.WxPayApiConfig;
import com.jpay.weixin.api.WxPayApiConfigKit;
import com.szt.common.exception.RRException;
import com.szt.modules.pay.CallbackFunction;
import com.szt.config.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * 微信支付相关配置
 * <p>
 * Created by bjliumingbo on 2017/5/12.
 */
@Slf4j
@Component
public class WxPayConfiguration{
	@Autowired
	WxPayBean wxPayBean;
	@Autowired
	private RedisUtil redisUtil;
	public  String wxPay(WxPayApi.TradeType payType, CallbackFunction.CallbackFunctionType callType, String title, HashMap<String, Object> attach, String money, String orderNo) {
		Map<String, String> params = WxPayApiConfigKit.getWxPayApiConfig()
				.setBody(title)
				.setSpbillCreateIp("127.0.0.1")
				.setTotalFee(money)
				.setTradeType(payType)
				.setAttach(JSON.toJSONString(attach))
				.setNotifyUrl(WxConstant.DOMAIN_NAME)
				.setOutTradeNo(orderNo)
		.build();
		String xmlResult = WxPayApi.pushOrder(false, params);
		Map<String, String> resultMap = PaymentKit.xmlToMap(xmlResult);
		String return_code = resultMap.get("return_code");
		String return_msg = resultMap.get("return_msg");
		if (!PaymentKit.codeIsOK(return_code)) {
			throw new RRException(return_msg);
		}
		String result_code = resultMap.get("result_code");
		String msg = resultMap.get("err_code_des");
		String errCode = resultMap.get("err_code");
		if (!PaymentKit.codeIsOK(result_code)) {
			if (errCode.equals(WxConstant.INVALID_REQUEST)) {
				throw new RRException("订单号重复！");
			} else if (errCode.equals(WxConstant.ORDERPAID)) {
				throw new RRException("订单已支付！");
			} else {
				throw new RRException("订单信息有误，请联系管理员！");
			}
		}
//		redisUtil.set(AppMyConstant.KEY_WEIXIN_PAY + shopSeller.getOrderNo(), shopSeller,86400L);
		/*request.getSession().setAttribute(Constant.KEY_WEIXIN_PAY + params.get("outTradeNo"), lyOrder);*/
		// 以下字段在return_code 和result_code都为SUCCESS的时候有返回
		String prepay_id = resultMap.get("prepay_id");
		//封装调起微信支付的参数 https://pay.weixin.qq.com/wiki/doc/api/app/app.php?chapter=9_12
		SortedMap<String, Object> packageParams = new TreeMap<String, Object>();
		packageParams.put("appid", WxPayApiConfigKit.getWxPayApiConfig().getAppId());
		packageParams.put("partnerid", WxPayApiConfigKit.getWxPayApiConfig().getMchId());
		packageParams.put("prepayid", prepay_id);
		packageParams.put("package", "Sign=WXPay");
		packageParams.put("noncestr", System.currentTimeMillis() + "2131");
		packageParams.put("timestamp", System.currentTimeMillis() / 1000 + "");
		String sign2 = PayCommonUtil.createSign("UTF-8", packageParams, WxPayApiConfigKit.getWxPayApiConfig().getPaternerKey());
		packageParams.put("sign", sign2);
		attach.put("callPay",callType);
		redisUtil.set(orderNo,JSON.toJSONString(attach));
		return JSON.toJSONString(packageParams);
	}





	/**
	 * 初始化数据
	 */
	@PostConstruct
	public void init(){
		WxPayApiConfigKit.setThreadLocalWxPayApiConfig(WxPayApiConfig.New()
				.setAppId(wxPayBean.getAppId())
				.setMchId(wxPayBean.getMchId())
				.setPaternerKey(wxPayBean.getPartnerKey())
				.setPayModel(WxPayApiConfig.PayModel.BUSINESSMODEL));
		if(wxPayBean.getDomain()== null || wxPayBean.getDomain().length()==0){
			log.error("回调路径不能为空");
			System.exit(0);
		}
		//初始化月底提现次数
	}
}