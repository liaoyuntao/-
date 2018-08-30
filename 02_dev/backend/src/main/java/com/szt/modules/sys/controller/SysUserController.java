
package com.szt.modules.sys.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.szt.common.utils.AdminUserUtils;
import com.szt.common.utils.Constant;
import com.szt.common.validator.Assert;
import com.szt.common.validator.ValidatorUtils;
import com.szt.common.validator.group.AddGroup;
import com.szt.common.validator.group.UpdateGroup;
import com.szt.modules.sys.form.PasswordForm;
import com.szt.modules.sys.service.SysUserRoleService;
import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.szt.modules.sys.entity.SysUserEntity;
import com.szt.modules.sys.service.SysUserService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;

import static com.szt.common.utils.ShiroUtils.getUserId;

/**
 * 后端用户管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-13 11:19:28
 */
@Slf4j
@Api(value = "后端用户管理接口", tags = "后端用户管理接口")
@RestController
@RequestMapping("sys/user")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysUserRoleService sysUserRoleService;


    /**
     * 所有用户列表
     */
    @GetMapping("/list")
    @RequiresPermissions("sys:user:list")
    public R list(@RequestParam Map<String, Object> params){
        //只有超级管理员，才能查看所有管理员列表

        PageUtils page = sysUserService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 获取登录的用户信息
     */
    @GetMapping("/info")
    public R info(){
        return R.ok().put("user", AdminUserUtils.getUser());
    }

    /**
     * 修改登录用户密码
     */
    @SysLog("修改密码")
    @PostMapping("/password")
    public R password(@RequestBody PasswordForm form){
        Assert.isBlank(form.getNewPassword(), "新密码不为能空");

        //sha256加密
        String password = new Sha256Hash(form.getPassword(), AdminUserUtils.getUser().getSalt()).toHex();
        //sha256加密
        String newPassword = new Sha256Hash(form.getNewPassword(), AdminUserUtils.getUser().getSalt()).toHex();

        //更新密码
        boolean flag = sysUserService.updatePassword(AdminUserUtils.getUserId(), password, newPassword);
        if(!flag){
            return R.error("原密码不正确");
        }

        return R.ok();
    }

    /**
     * 用户信息
     */
    @GetMapping("/info/{userId}")
    @RequiresPermissions("sys:user:info")
    public R info(@PathVariable("userId") Long userId){
        SysUserEntity user = sysUserService.selectById(userId);

        //获取用户所属的角色列表
        List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userId);
        user.setRoleIdList(roleIdList);

        return R.ok().put("user", user);
    }

    /**
     * 保存用户
     */
    @SysLog("保存用户")
    @PostMapping("/save")
    @RequiresPermissions("sys:user:save")
    public R save(@RequestBody SysUserEntity user){
        ValidatorUtils.validateEntity(user, AddGroup.class);
        long id = ((SysUserEntity) SecurityUtils.getSubject().getPrincipal()).getId();
        user.setCreateBy(id);
        user.setUpdateBy(id);
        user.insert();
        sysUserService.save(user);

        return R.ok();
    }

    /**
     * 修改用户
     */
    @SysLog("修改用户")
    @PostMapping("/update")
    @RequiresPermissions("sys:user:update")
    public R update(@RequestBody SysUserEntity user){
        ValidatorUtils.validateEntity(user, UpdateGroup.class);
        long id = ((SysUserEntity) SecurityUtils.getSubject().getPrincipal()).getId();
        user.setUpdateBy(id);
        user.update();
        sysUserService.update(user);

        return R.ok();
    }

    /**
     * 删除用户
     */
    @SysLog("删除用户")
    @PostMapping("/delete")
    @RequiresPermissions("sys:user:delete")
    public R delete(@RequestBody Long[] userIds){
        if(ArrayUtils.contains(userIds, 1L)){
            return R.error("系统管理员不能删除");
        }

        if(ArrayUtils.contains(userIds, AdminUserUtils.getUserId())){
            return R.error("当前用户不能删除");
        }

        sysUserService.deleteBatch(userIds);

        return R.ok();
    }
}
