package com.szt.modules.sys.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.szt.common.exception.RRException;
import com.szt.common.utils.AdminUserUtils;
import com.szt.common.utils.Constant;
import com.szt.modules.sys.service.SysRoleService;
import com.szt.modules.sys.service.SysUserRoleService;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.sys.dao.SysUserDao;
import com.szt.modules.sys.entity.SysUserEntity;
import com.szt.modules.sys.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.szt.common.utils.ShiroUtils.getUserId;

/**
 * 后端用户管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 11:19:28
 */
@Slf4j
@Service("sysUserService")
public class SysUserServiceImpl extends CommonServiceImpl<SysUserDao, SysUserEntity> implements SysUserService {
    @Autowired
    private SysUserRoleService sysUserRoleService;
    @Autowired
    private SysRoleService sysRoleService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String username = (String)params.get("username");
        Long createUserId = (Long)params.get("createBy");
       Wrapper<SysUserEntity> a =  new EntityWrapper<SysUserEntity>();
//                .like(StringUtils.isNotBlank(username),"username", username)
//                .eq(createUserId != null,"create_by", createUserId);
       // a.notIn("id",getUserId());
        a.eq("create_by",getUserId());
       if(!getUserId().equals( Constant.SUPER_ADMIN)){
            a.notIn("username","admin");
        }
        Page<SysUserEntity> page = this.selectPage(
                new Query<SysUserEntity>(params).getPage(),a

        );

        return new PageUtils(page);
    }

    @Override
    public List<String> queryAllPerms(Long userId) {
        return baseMapper.queryAllPerms(userId);
    }

    @Override
    public List<Long> queryAllMenuId(Long userId) {
        return baseMapper.queryAllMenuId(userId);
    }

    @Override
    public SysUserEntity queryByUserName(String username) {
        return baseMapper.queryByUserName(username);
    }

    @Override
    @Transactional
    public void save(SysUserEntity user) {
        user.setCreateTime(new Date());
        //sha256加密
        String salt = RandomStringUtils.randomAlphanumeric(20);
        user.setPassword(new Sha256Hash(user.getPassword(), salt).toHex());
        user.setSalt(salt);
        this.insert(user);

        //检查角色是否越权
        checkRole(user);

        //保存用户与角色关系
        sysUserRoleService.saveOrUpdate(user.getId(), user.getRoleIdList());
    }

    @Override
    @Transactional
    public void update(SysUserEntity user) {
        if(StringUtils.isBlank(user.getPassword())){
            user.setPassword(null);
        }else{
            user.setPassword(new Sha256Hash(user.getPassword(), user.getSalt()).toHex());
        }
        this.updateById(user);
        //检查角色是否越权
        checkRole(user);

        //保存用户与角色关系
        sysUserRoleService.saveOrUpdate(user.getId(), user.getRoleIdList());
    }

    @Override
    public void deleteBatch(Long[] userId) {
        this.deleteBatchIds(Arrays.asList(userId));
    }

    @Override
    public boolean updatePassword(Long userId, String password, String newPassword) {
        SysUserEntity userEntity = new SysUserEntity();
        userEntity.setPassword(newPassword);
        return this.update(userEntity,
                new EntityWrapper<SysUserEntity>().eq("id", userId).eq("password", password));
    }

    /**
     * 检查角色是否越权
     */
    private void checkRole(SysUserEntity user){
        if(user.getRoleIdList() == null || user.getRoleIdList().size() == 0){
            return;
        }
        //如果不是超级管理员，则需要判断用户的角色是否自己创建
        if(getUserId() == Constant.SUPER_ADMIN){
            return ;
        }

        //查询用户创建的角色列表
        List<Long> roleIdList = sysRoleService.queryRoleIdList(getUserId());

        //判断是否越权
        if(!roleIdList.containsAll(user.getRoleIdList())){
            throw new RRException("新增用户所选角色，不是本人创建");
        }
    }


}
