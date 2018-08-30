package com.szt.modules.sys.constant;

/**
 * 后端用户管理常量
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 11:19:28
 */
public interface  SysUserConstant{
    /**
     * 用户状态 - sys_user_state
     */
    //禁用
    String SYS_USER_STATE_0 = "0";
    //正常
    String SYS_USER_STATE_1 = "1";
    /**
     * 逻辑删除 - delete_flag
     */
    //存在
    String DELETE_FLAG_0 = "0";
    //隐藏
    String DELETE_FLAG_1 = "1";
    //删除
    String DELETE_FLAG_2 = "2";
    //停用
    String DELETE_FLAG_3 = "3";
}
