package com.szt.modules.sys.service.impl;

import com.szt.common.utils.Constant;
import com.szt.modules.sys.dao.SysMenuDao;
import com.szt.modules.sys.dao.SysUserDao;
import com.szt.modules.sys.dao.SysUserTokenDao;
import com.szt.modules.sys.entity.SysMenuEntity;
import com.szt.modules.sys.entity.SysUserEntity;
import com.szt.modules.sys.entity.SysUserTokenEntity;
import com.szt.modules.sys.service.ShiroService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ShiroServiceImpl implements ShiroService {
    @Autowired
    private SysMenuDao sysMenuDao;
    @Autowired
    private SysUserDao sysUserDao;
    @Autowired
    private SysUserTokenDao sysUserTokenDao;
    @Value("${spring.profiles.active}")
    private String active;
    @Override
    public Set<String> getUserPermissions(long userId) {
        List<String> permsList;

        //系统管理员，拥有最高权限
        if(userId == Constant.SUPER_ADMIN || active.equals("dev")){
            List<SysMenuEntity> menuList = sysMenuDao.selectList(null);
            permsList = new ArrayList<>(menuList.size());
            for(SysMenuEntity menu : menuList){
               permsList.add("null");
                permsList.add(menu.getPerms());
            }
        }else{
            permsList = sysUserDao.queryAllPerms(userId);
           permsList.add("null");
        }
        //用户权限列表
        Set<String> permsSet = new HashSet<>();
        for(String perms : permsList){
            if(StringUtils.isBlank(perms)){
                continue;
            }
            permsSet.addAll(Arrays.asList(perms.trim().split(",")));
        }
        return permsSet;
    }

    @Override
    public SysUserTokenEntity queryByToken(String token) {
        return sysUserTokenDao.queryByToken(token);
    }

    @Override
    public SysUserEntity queryUser(Long userId) {
        return sysUserDao.selectById(userId);
    }
}
