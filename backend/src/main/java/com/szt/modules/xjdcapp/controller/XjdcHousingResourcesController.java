package com.szt.modules.xjdcapp.controller;

import com.szt.common.annotation.SysLog;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.xjdc.entity.XjdcHousingResourcesEntity;
import com.szt.modules.xjdcapp.service.XjdcHousingResourcesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
/**
 * 房源信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:35:05
 */
@Slf4j
@Api(value = "房源信息接口", tags = "房源信息接口")
@RestController
@RequestMapping("xjdcapp/xjdchousingresources")
@Controller("xjdcappxjdchousingresources")
public class XjdcHousingResourcesController {
    @Autowired
    private XjdcHousingResourcesService xjdcHousingResourcesService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("xjdcapp:xjdchousingresources:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = xjdcHousingResourcesService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("xjdcapp:xjdchousingresources:info")
    public R info(@PathVariable("id") Long id) {
            XjdcHousingResourcesEntity xjdcHousingResources = xjdcHousingResourcesService.selectById(id);

        return R.ok().put("data", xjdcHousingResources);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("xjdcapp:xjdchousingresources:save")
    public R save(@RequestBody XjdcHousingResourcesEntity xjdcHousingResources) {
             xjdcHousingResources.insert();
            //校验类型
            ValidatorUtils.validateEntity(xjdcHousingResources);
            xjdcHousingResourcesService.insert(xjdcHousingResources);

        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("xjdcapp:xjdchousingresources:update")
    public R update(@RequestBody XjdcHousingResourcesEntity xjdcHousingResources) {
            xjdcHousingResources.update();
            //校验类型
             ValidatorUtils.validateEntity(xjdcHousingResources);
            xjdcHousingResourcesService.updateById(xjdcHousingResources);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("xjdcapp:xjdchousingresources:delete")
    public R delete(@RequestBody Long[]ids) {
            xjdcHousingResourcesService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
