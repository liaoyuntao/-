package com.szt.modules.pay;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 回调函数
 */
public interface CallbackFunction extends Serializable {
    /**
     * 回调类型
     */
    enum CallbackFunctionType {
        JSAPI
    }

    /**
     * 回调结果集
     */
    class CallbackFunctionMap {
        public static final Map<CallbackFunctionType, CallbackFunction> map;

        static {
            //初始化
            map = new HashMap<CallbackFunctionType, CallbackFunction>();
            //JSAPI回调
            map.put(CallbackFunctionType.JSAPI, new CallbackFunction() {
                @Override
                public boolean run(Map<String, String> resultData, Map<String, Object> addData) {
                    System.out.println("进来了,返回true代表支付成功,返回false代表重复支付,可根据支付记录进行统一处理");
                    return false;
                }
            });
        }
    }


    /**
     * 执行方法
     *
     * @param resultData
     * @param addData
     * @return
     */
    boolean run(Map<String, String> resultData, Map<String, Object> addData);
}
