package com.szt.modules.sys.dao;

import com.szt.modules.sys.entity.SysUserEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 后端用户管理
 * 
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 11:19:28
 */
@Mapper
public interface SysUserDao extends BaseMapper<SysUserEntity> {
    /**
     * 查询用户的所有权限
     * @param userId  用户ID
     */
    List<String> queryAllPerms(Long userId);

    /**
     * 查询用户的所有菜单ID
     */
    List<Long> queryAllMenuId(Long userId);

    /**
     * 根据用户名，查询系统用户
     */
    SysUserEntity queryByUserName(String username);

}
