package com.szt.modules.sys.controller;

import java.util.Arrays;
import java.util.Map;
import com.szt.common.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
import com.szt.modules.sys.entity.SysConfigEntity;
import com.szt.modules.sys.service.SysConfigService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 系统字典管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 20:36:35
 */
@Slf4j
@Api(value = "系统字典管理接口", tags = "系统字典管理接口")
@RestController
@RequestMapping("sys/sysconfig")
@Controller("syssysconfig")
public class SysConfigController {
    @Autowired
    private SysConfigService sysConfigService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("sys:sysconfig:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = sysConfigService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("sys:sysconfig:info")
    public R info(@PathVariable("id") Long id) {
            SysConfigEntity sysConfig = sysConfigService.selectById(id);

        return R.ok().put("data", sysConfig);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("sys:sysconfig:save")
    public R save(@RequestBody SysConfigEntity sysConfig) {
             sysConfig.insert();
            //校验类型
            ValidatorUtils.validateEntity(sysConfig);
            sysConfigService.save(sysConfig);

        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("sys:sysconfig:update")
    public R update(@RequestBody SysConfigEntity sysConfig) {
            sysConfig.update();
            //校验类型
             ValidatorUtils.validateEntity(sysConfig);
            sysConfigService.update(sysConfig);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("sys:sysconfig:delete")
    public R delete(@RequestBody Long[]ids) {
            sysConfigService.deleteBatch(ids);
        return R.ok();
    }

}
