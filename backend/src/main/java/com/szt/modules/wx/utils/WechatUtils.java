package com.szt.modules.wx.utils;

import com.szt.common.utils.SpringContextUtils;
import com.szt.config.RedisUtil;
import com.szt.modules.wx.entity.WxUserInfoEntity;
import com.szt.modules.wx.service.WxUserInfoService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.net.URLCodec;
import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.util.Map;

@Slf4j
public class WechatUtils {
	
//	/** APPID */
//	public static  String APPID = "wx8cedadee1a84a376";
//	/** 秘钥 */
//	public static  String SECRET = "61aaa23a92af79bb0d8b5d94f4907e3b";
//	/** 商户ID *//*
//	public static final String MCHID = "1395029702";
//	*//** 商户秘钥 *//*
//	public static final String MCHKEY = "3dcc36f214f147cbbda08a2f92952186";*/
//	/** 全局 access_Token*/
//	private static String accessToken;
//	/** 有效时间 */
	private static Long expiresIn=7200L;
	/**
	 * 使用redis缓存实现保存
	 */
    private static RedisUtil redisUtil;
	private static String APP_ID_KEY ="APP_ID_KEY";

	private static WxUserInfoService wxwxUserInfoService;

	static {
		redisUtil = SpringContextUtils.getBean("redisUtil", RedisUtil.class);
		wxwxUserInfoService = SpringContextUtils.getBean("wxwxUserInfoService", WxUserInfoService.class);
	}
	/**  */
	/** JS-SDK签名验证时所需的ticket */
	private static final  String TICKET_KEY="TICKET_KEY";
	/** accessToken定时管理器 */
//	private static Timer accessTokenTimer;
	/** jsApiTicketTimer定时管理器 */
//	private static Timer jsApiTicketTimer;

	/**
	 * 获取ACCESS_TOKEN，并定时重新获取ACCESS_TOKEN
	 * @author xiongjisheng
	 * @date 201年5月1日 下午2:44:43 
	 * @version 1.0
	 * @return
	 */
	public static synchronized String getAccessToken(String appid){
		String accessToken = (String) redisUtil.get(APP_ID_KEY+appid);
      // if(accessToken==null){

    	   accessToken = getAccessTokenMsg(appid);
    	   //保存到redis中

   //    }
       return accessToken;
    }

	/**
	 * 重置ACCESS_TOKEN
	 * @author xiongjisheng
	 * @date 2016年5月1日 下午2:54:43
	 * @version 1.0
	 */
	public static void restAccessToken(String appid){
		//保存到redis中
		redisUtil.remove(APP_ID_KEY+appid);
	}
	
	/**
	 * 根据appid和secret获取ACCESS_TOKEN
	 * @author xiongjisheng
	 * @date 201年5月1日 下午2:44:43 
	 * @version 1.0
	 * @return
	 * 返回案例{"access_token":"11_Rqos41oTry7SIKC_CIkts0sVJW4_e5yeBVyXwzxZqXy0-ao6piM-9RivmyHWrO6gL7JVMrPgyMzVlJgRROQimXVJIU-kQiZ_1BBAUaYiP63P42sB209OM_ISYe8TQOfAHAYVT","expires_in":7200}
	 */
	public static String getAccessTokenMsg(String appid){
		WxUserInfoEntity wxinfo = wxwxUserInfoService.getWxUserByAppId(appid);
		String 	accessToken= (String) redisUtil.get(APP_ID_KEY+appid);
		if(StringUtils.isNotBlank(accessToken)){
			return accessToken;
		}
		StringBuffer action =new StringBuffer();
        action.append("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential")
        .append("&appid="+appid)
        .append("&secret="+wxinfo.getAppSecret());
        String resp =NetworkUtils.httpUrl(action.toString(),null,NetworkUtils.EXE_TYPE_GET);
        try {
			JSONObject jsonObj = new JSONObject(resp);
			Object object =jsonObj.get("access_token");
			if(!jsonObj.isNull("expires_in")){
				redisUtil.set(APP_ID_KEY+appid,String.valueOf(object),jsonObj.getLong("expires_in"));
			}else if(expiresIn==null){
				redisUtil.set(APP_ID_KEY+appid,String.valueOf(object),7200L);
			}
	        	return String.valueOf(object);
		} catch (JSONException e) {
			e.printStackTrace();
		}
        return resp;
	}
	
	public static JSONArray getOpenids(String next_openid,String appid){
		String path ="https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID";
		path = path.replace("ACCESS_TOKEN", getAccessToken(appid));
		path = path.replace("NEXT_OPENID",next_openid!=null?next_openid:"");
		String result = NetworkUtils.httpClient(path, new String(), NetworkUtils.EXE_TYPE_GET);
		JSONObject jsonObj;
		JSONArray jsonArr =null;
		try {
			jsonObj = new JSONObject(result);
			if(redisUtil.get(APP_ID_KEY+appid)!=null){
				return getOpenids(next_openid,appid);
			}
			jsonArr = jsonObj.getJSONObject("data").getJSONArray("openid");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonArr;
	}
	
	public static JSONObject sendModelMsg(String appid,Object object, JSONObject jsonData) throws Exception{
		String path ="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
		path = path.replace("ACCESS_TOKEN", WechatUtils.getAccessToken(appid));
		Class<?> classes = object.getClass();
		Field[] fields = classes.getFields();
		JSONObject jsonRoot = new JSONObject();
		for(Field field:fields){
			jsonRoot.put(field.getName(), field.get(object));
		}
		jsonRoot.put("data", jsonData);
		String result = NetworkUtils.httpUrl(path, jsonRoot.toString(), NetworkUtils.EXE_TYPE_POST);
		JSONObject jsonObj = new JSONObject(result);
		if(redisUtil.get(APP_ID_KEY+appid)!=null){
			return sendModelMsg( appid,object, jsonData);
		}
		return jsonObj;
	}
	
	public static JSONObject sendMb(String token, JSONObject jsonRoot) throws JSONException {
		String path ="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+token;
		String result = NetworkUtils.httpUrl(path, jsonRoot.toString(), NetworkUtils.EXE_TYPE_POST);
		System.out.println(result);
		return new JSONObject(result);
	}

	
	/**
	 * 通过openid群发消息
	 * @return
	 * @throws JSONException
	 */
	public static JSONObject sendMassByOpenId(String appid,JSONObject jsonData) throws JSONException {
		String path="https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=ACCESS_TOKEN";
		path = path.replace("ACCESS_TOKEN", WechatUtils.getAccessToken(appid));
		String result = NetworkUtils.httpUrl(path, jsonData.toString(), NetworkUtils.EXE_TYPE_POST);
		JSONObject jsonObj = new JSONObject(result);
		if(redisUtil.get(APP_ID_KEY+appid)!=null){
			return sendMassByOpenId(appid,jsonData);
		}
		return jsonObj;
	}
	
	public static JSONObject sendServiceMsg(String appid,String appseate,Object object, JSONObject jsonData) throws Exception{
		String path ="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";
		path = path.replace("ACCESS_TOKEN", WechatUtils.getAccessToken(appid));
		Class<?> classes = object.getClass();
		Field[] fields = classes.getFields();
		JSONObject jsonRoot = new JSONObject();
		for(Field field:fields){
			jsonRoot.put(field.getName(), field.get(object));
		}
		jsonRoot.put("news", jsonData);
		String result = NetworkUtils.httpClient(path, jsonRoot, NetworkUtils.EXE_TYPE_POST);
		JSONObject jsonObj = new JSONObject(result);
		if(redisUtil.get(APP_ID_KEY+appid)!=null){
			return sendServiceMsg(appid,appseate,object,jsonData);
		}
		return jsonObj;
	}
	
	public static JSONObject createQrcode(String appid,JSONObject jsonData) throws Exception{
		String path ="https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
		path = path.replace("ACCESS_TOKEN", getAccessToken(appid));
		
		String result = NetworkUtils.httpClient(path, jsonData, NetworkUtils.EXE_TYPE_POST);
		JSONObject jsonObj = new JSONObject(result);
		if(redisUtil.get(APP_ID_KEY+appid)!=null){
			return createQrcode(appid,jsonData);
		}
		return jsonObj;
	}
	
	public static JSONObject sendService(String appid,JSONObject jsonData) throws JSONException {
		String path ="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";
		path = path.replace("ACCESS_TOKEN", WechatUtils.getAccessToken(appid));
		
		String result = NetworkUtils.httpClient(path, jsonData, NetworkUtils.EXE_TYPE_POST);
		JSONObject jsonObj = new JSONObject(result);
		if(redisUtil.get(APP_ID_KEY+appid)!=null){
			return sendService(appid,jsonData);
		}
		return jsonObj;
	}
	
	public static String sendServiceByText(String appid,String openId,String content) throws JSONException {
		JSONObject json = new JSONObject();
		JSONObject text = new JSONObject();
		text.put("content", content);
		json = new JSONObject();
		json.put("touser", openId);
		json.put("msgtype", "text");
		json.put("text", text);
		return sendService(appid,json).toString();
	}
	public static String sendServiceByMedia(String appid,String openId,String mediaId) throws JSONException {
		JSONObject json = new JSONObject();
		JSONObject image = new JSONObject();
		image.put("media_id", mediaId);
		json.put("touser", openId);
		json.put("msgtype", "image");
		json.put("image", image);
		
		return sendService(appid,json).toString();
	}
	
//	/**
//	 * AccessTokenTimer定时管理器执行的任务
//	 * @author xiongjisheng
//	 * @date 2016年5月11日 下午3:03:06
//	 * @version 1.0
//	 */
//	public static class AccessTokenTask extends TimerTask{
//		@Override
//		public void run() {
//			accessToken = getAccessTokenMsg();
//			/*ErrorLogsFile.writeError(WechatUtils.class,"AccessTokenTask:"+accessToken+";Count="+getATCount,200);*/
//		}
//	}
	
	/**
	 * jsApiTicketTimer定时管理器执行的任务
	 * @author xiongjisheng
	 * @date 2017年5月14日 下午3:02:16 
	 * @version 1.0
	 */
//	public static class JsApiTicketTask extends TimerTask{
//		@Override
//		public void run() {
//			ticket = getJsApiTicketMsg();
//			System.out.println("刷新AccessToken："+DateUtils.getNow());
//		}
//	}

//	/**
//	 * 判断AccessToken是否失效
//	 * @author xiognjisheng
//	 * @date 2016年5月1日 下午3:00:26
//	 * @version 1.0
//	 * @param jsonObj
//	 * @return
//	 * @throws JSONException
//	 */
//	public static boolean isAccessTokenValid(String appid,String appseate,JSONObject jsonObj) throws JSONException{
//		if(jsonObj!=null){
//			if(!jsonObj.isNull("errcode")&&!jsonObj.isNull("errmsg")){
//				Integer errcode = jsonObj.getInt("errcode");
//				String errmsg = jsonObj.getString("errmsg");
//				errmsg = errmsg.replaceAll("\\s*", "");
//				if(errcode==40001&&errmsg.contains("access_tokenisinvalidornotlatest")){
//					restAccessToken(appid);
//					return false;
//				}
//			}
//		}
//		return true;
//	}
	/**
	 * 先获取access_token后再获取ticket
	 * @author Administrator
	 * @date 2017年5月14日 下午3:01:17 
	 * @version 1.0
	 * @return
	 */
	private static String getJsApiTicketMsg(String appid,String appseate){
		String url ="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
		url = url.replace("ACCESS_TOKEN", getAccessTokenMsg(appid));
		String result = NetworkUtils.httpUrl(url, null, NetworkUtils.EXE_TYPE_GET);

		try {
			JSONObject jsonObj = new JSONObject(result);
			return jsonObj.isNull("ticket")?null:jsonObj.getString("ticket");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 判断AccessToken是否失效
	 * @author xiognjisheng
	 * @date 2016年5月1日 下午3:00:26 
	 * @version 1.0
	 * @param jsonObj
	 * @return
	 * @throws JSONException
	 */
//	public static boolean isAccessTokenValid(String appid,JSONObject jsonObj) throws JSONException {
//		if(jsonObj!=null){
//			if(!jsonObj.isNull("errcode")&&!jsonObj.isNull("errmsg")){
//				Integer errcode = jsonObj.getInt("errcode");
//				String errmsg = jsonObj.getString("errmsg");
//				errmsg = errmsg.replaceAll("\\s*", "");
//				if(errcode==40001&&errmsg.contains("access_tokenisinvalidornotlatest")){
//					restAccessToken(appid);
//					return false;
//				}
//			}
//		}
//		return true;
//	}
	
	/**
	 * 获取JS-SDK签名所需的ticket
	 * @author xiongjisheng
	 * @date 2016年5月1日 下午2:41:45 
	 * @version 1.0
	 * @return
	 */
	private synchronized static String getJsApiTicket(String appid,String appstaet){
		String ticket= (String) redisUtil.get(TICKET_KEY+appid);
		if(ticket==null){
			ticket = getJsApiTicketMsg(appid,appstaet);
			if(ticket!=null){
				redisUtil.set(TICKET_KEY+appid,ticket,7200L);
			}
		}
		return ticket;
	}
	
	/**
	 * 获取JS-SDK接入的签名信息
	 * @author Administrator
	 * @date 2016年5月1日 下午2:41:23 
	 * @version 1.0
	 * @param url
	 * @return
	 */
	public static Map<String,Object> getSign(String appid,String appseate,String url){
		return SignUtils.sign(getJsApiTicket(appid,appseate), url);
	}
	
	public static String uploadImage(String appid,String imgUrl) throws JSONException {
		String url = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token="+getAccessToken(appid)+"&type=image";
		String result = NetworkUtils.uploadImage(url, imgUrl);
		if(redisUtil.get(APP_ID_KEY+appid)!=null){
			return uploadImage(appid,imgUrl);
		}
		return result;
	}
	
	public static String wechatUrl(String appid,String appSecret,String url){
		URLCodec codec = new URLCodec();
		try {
			url = codec.encode(url);
		} catch (EncoderException e) {
			e.printStackTrace();
		}
		String path="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri="+url+"&response_type=code&scope=snsapi_base&state="+GlobalConstant.CURRENT_REQUEST_WECHAT_STATE_VAL+"&connect_redirect=1#wechat_redirect";
		return path;
		
	}
	/**
	 * 通过Openid获取 微信用户信息
	 * @param openId
	 * @return
	 * @throws JSONException
	 */
	public static JSONObject getUserInfoByOpenId(String appid,String openId) throws JSONException {
		String url="https://api.weixin.qq.com/cgi-bin/user/info?access_token="+getAccessToken(appid)+"&openid="+openId+"&lang=zh_CN";
		String result = NetworkUtils.httpUrl(url, null, NetworkUtils.EXE_TYPE_GET);
		JSONObject json = null;
		if(result!=null){
			json = new JSONObject(result);
			if(redisUtil.get(APP_ID_KEY+appid)!=null){
				return getUserInfoByOpenId(appid,openId);
			}
		}
		return json;
		
	}
	
	public static byte[] getMedia(String appid,String mediaId){
		String url = "https://api.weixin.qq.com/cgi-bin/media/get?access_token="+getAccessToken(appid)+"&media_id="+mediaId;
		return NetworkUtils.downMedia(url);
	}
	
	/**
	 * openId是否关注
	 * @param openId
	 * @return
	 * @throws JSONException
	 */
	public static boolean getIsSubscribe(String appid,String openId) throws JSONException {
		String url="https://api.weixin.qq.com/cgi-bin/user/info?access_token="+getAccessToken(appid)+"&openid="+openId;
		String result = NetworkUtils.httpUrl(url, null, NetworkUtils.EXE_TYPE_GET);
		JSONObject json = null;
		if(result!=null){
			json = new JSONObject(result);
			//失效重新获取
			if(redisUtil.get(APP_ID_KEY+appid)!=null){
				return getIsSubscribe(appid,openId);
			}
			if(!json.isNull("subscribe")){
				return json.getInt("subscribe")==1;
			}
		}
		return false; 
	}
	
	
	public static boolean sendTemplateMsg(String token,Template template){  
        
        boolean flag=false;  
          
        String requestUrl="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";  
        requestUrl=requestUrl.replace("ACCESS_TOKEN", token);  
        net.sf.json.JSONObject jsonResult=WxCommUTil.httpsRequest(requestUrl, "POST", template.toJSON());
        if(jsonResult!=null){
            int errorCode=jsonResult.getInt("errcode");  
            String errorMessage=jsonResult.getString("errmsg");  
            if(errorCode==0){  
                flag=true;  
            }else{  
               log.error("模板消息发送失败:"+errorCode+","+errorMessage);
                flag=false;  
            }  
        }
        return flag;
          
          
          
}  
	

	//oP6oyw9WcQwu6uqAES1PiqOZy5TY   oP6oyw20ZGb-A2HTGLWwHCSC_h4M  
	public static void main(String[] args) throws Exception {
		String token = getAccessTokenMsg("");
		String opedId="oP6oyw20ZGb-A2HTGLWwHCSC_h4M";
//		boolean b =getIsSubscribe("appid","appsecret",opedId);
//		System.out.println(b);
	}

}
