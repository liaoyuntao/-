package com.szt.modules.wx.utils;

public class GlobalConstant {

	/**重复提交表示**/
	public static String CURRENT_SESSION_FORMTOKEN = "ZZGTOKENSUMBITVALUDATESESSIONKEY";
	
	/** 当前已登录的会员SESSION标识 */
	public static String CURRENT_SESSION_MEMBER = "CURRENT_SESSION_MEMBER";
	/** 当前已登录后台管理SESSION标识 */
	public static String CURRENT_SESSION_USER = "CURRENT_SESSION_USER";
	
	public static String CURRENT_SESSION_MEMBERCERT = "CURRENT_SESSION_MEMBERCERT";
	/** 当前已登录的会员cookie key */
	public static String CURRENT_COOKIE_MEMBER = "wxinquiry";
	public static String CURRENT_COOKIE_AREACODE = "member-areaEncode";
	public static String CURRENT_COOKIE_AREA = "member-area";
	public static String CURRENT_COOKIE_LOGINNAME = "loginName";
	public static String CURRENT_COOKIE_DEFAULT_AREA="default_Area";
	public static String CURRENT_COOKIE_DEFAULT_AREAENCODE="default_Area_Encode";
	public static String CURRENT_SESSION_WECHAT_CODE="wechat-code";
	public static String CURRENT_REQUEST_WECHAT_STATE_VAL="STATE";
	public static String CURRENT_SESSION_OPENID="session_openid";
	public static String COOKIE_LINK_AREA="link_Area";
	public static String COOKIE_LINK_AREAENCODE="link_Area_Encode";
	
	/*当前登录会员店信息*/
	public static String CURRENT_SESSION_SHOP="CURRENT_SESSION_SHOP";
	/*浏览中员店信息*/
	public static String BROWSE_SESSION_SHOP="BROWSE_SESSION_SHOP";
	
	/*浏览中员店信息*/
	public static String BROWSE_SESSION_LIST="BROWSE_SESSION_LIST";
	
}