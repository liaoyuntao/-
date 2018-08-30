package com.szt.modules.wjxcx.controller;

import java.util.Arrays;
import java.util.Map;
import java.util.List;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.wjadmin.entity.WjadminVendingMachineEntity;
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
//import com.szt.modules.wjxcx.entity.WjadminVendingMachineEntity;
import com.szt.modules.wjxcx.service.WjadminVendingMachineService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 售货机管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:58:55
 */
@Slf4j
@Api(value = "售货机管理接口", tags = "售货机管理接口")
@RestController
@RequestMapping("wjxcx/wjadminvendingmachine")
@Controller("wjxcxwjadminvendingmachine")
public class WjadminVendingMachineController {
    @Autowired
    private WjadminVendingMachineService wjadminVendingMachineService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("wjxcx:wjadminvendingmachine:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = wjadminVendingMachineService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("wjxcx:wjadminvendingmachine:info")
    public R info(@PathVariable("id") Long id) {
            WjadminVendingMachineEntity wjadminVendingMachine = wjadminVendingMachineService.selectById(id);

        return R.ok().put("data", wjadminVendingMachine);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("wjxcx:wjadminvendingmachine:save")
    public R save(@RequestBody WjadminVendingMachineEntity wjadminVendingMachine) {
            wjadminVendingMachineService.insertEntity(wjadminVendingMachine);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("wjxcx:wjadminvendingmachine:save")
    public R save(@RequestBody List<WjadminVendingMachineEntity> wjadminVendingMachine) {
            wjadminVendingMachineService.saveAll(wjadminVendingMachine);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("wjxcx:wjadminvendingmachine:update")
    public R update(@RequestBody WjadminVendingMachineEntity wjadminVendingMachine) {
            wjadminVendingMachine.update();
            //校验类型
             ValidatorUtils.validateEntity(wjadminVendingMachine);
            wjadminVendingMachineService.updateById(wjadminVendingMachine);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("wjxcx:wjadminvendingmachine:delete")
    public R delete(@RequestBody Long[]ids) {
            wjadminVendingMachineService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
