package com.szt.modules.wx.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class SignUtils {
	
	/**
	 * 根据jsapi_ticket和url获取JS-SDK签名信息
	 * @author xiongjisheng
	 * @date 2016年5月1日 下午3:05:07 
	 * @version 1.0
	 * @param jsapi_ticket
	 * @param url
	 * @return
	 */
	public static Map<String, Object> sign(String jsapi_ticket, String url) {
        Map<String, Object> ret = new HashMap<String, Object>();
        String nonce_str = create_nonce_str();
        Long timestamp = create_timestamp();
        String string1;
        String signature = "";

        //注意这里参数名必须全部小写，且必须有序
        string1 = "jsapi_ticket=" + jsapi_ticket +
                  "&noncestr=" + nonce_str +
                  "&timestamp=" + timestamp +
                  "&url=" + url;
        System.out.println(string1);

        try
        {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(string1.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }

    //    ret.put("url", url);
    //    ret.put("jsapi_ticket", jsapi_ticket);
        ret.put("nonceStr", nonce_str);
        ret.put("timestamp", timestamp);
        ret.put("signature", signature);

        return ret;
    }

	/**
	 * 二进制抓十六进制
	 * @author xiongjisheng
	 * @date 2016年5月1日 下午3:06:46 
	 * @version 1.0
	 * @param hash
	 * @return
	 */
    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash)
        {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }

    /**
     * 获取随机字符串
     * @author xiongjisheng
     * @date 2016年5月1日 下午3:05:54 
     * @version 1.0
     * @return
     */
    private static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }

    /**
     * 获取当前时间毫秒数
     * @author xiongjisheng
     * @date 2016年5月1日 下午3:06:14 
     * @version 1.0
     * @return
     */
    private static Long create_timestamp() {
        return System.currentTimeMillis() / 1000;
    }
}
