package com.szt.modules.sys.controller;

import java.util.Arrays;
import java.util.Map;
import java.util.List;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.generator.config.InitBusConfig;
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
import com.szt.modules.sys.entity.SysPbAreaEntity;
import com.szt.modules.sys.service.SysPbAreaService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 地址管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-20 00:11:07
 */
@Slf4j
@Api(value = "地址管理接口", tags = "地址管理接口")
@RestController
@RequestMapping("sys/syspbarea")
@Controller("syssyspbarea")
public class SysPbAreaController {
    @Autowired
    private SysPbAreaService sysPbAreaService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("sys:syspbarea:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = sysPbAreaService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("sys:syspbarea:info")
    public R info(@PathVariable("id") Long id) {
            SysPbAreaEntity sysPbArea = sysPbAreaService.selectById(id);

        return R.ok().put("data", sysPbArea);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("sys:syspbarea:save")
    public R save(@RequestBody SysPbAreaEntity sysPbArea) {
            sysPbAreaService.insertEntity(sysPbArea);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("sys:syspbarea:save")
    public R save(@RequestBody List<SysPbAreaEntity> sysPbArea) {
            sysPbAreaService.saveAll(sysPbArea);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("sys:syspbarea:update")
    public R update(@RequestBody SysPbAreaEntity sysPbArea) {
            sysPbArea.update();
            //校验类型
             ValidatorUtils.validateEntity(sysPbArea);
            sysPbAreaService.updateById(sysPbArea);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("sys:syspbarea:delete")
    public R delete(@RequestBody Long[]ids) {
            sysPbAreaService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/getAddressConfig")
    public R getAddressConfig() {
        return R.ok().put("data",InitBusConfig.getAddressConfig());
    }
}
