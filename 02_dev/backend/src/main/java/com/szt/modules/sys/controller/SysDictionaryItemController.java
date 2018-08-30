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
import com.szt.modules.sys.entity.SysDictionaryItemEntity;
import com.szt.modules.sys.service.SysDictionaryItemService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 字典
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-07-09 23:03:33
 */
@Slf4j
@Api(value = "字典接口", tags = "字典接口")
@RestController
@RequestMapping("sys/sysdictionaryitem")
@Controller("syssysdictionaryitem")
public class SysDictionaryItemController {
    @Autowired
    private SysDictionaryItemService sysDictionaryItemService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("sys:sysdictionaryitem:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = sysDictionaryItemService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("sys:sysdictionaryitem:info")
    public R info(@PathVariable("id") Long id) {
            SysDictionaryItemEntity sysDictionaryItem = sysDictionaryItemService.selectById(id);

        return R.ok().put("data", sysDictionaryItem);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("sys:sysdictionaryitem:save")
    public R save(@RequestBody SysDictionaryItemEntity sysDictionaryItem) {
             sysDictionaryItem.insert();
            //校验类型
            ValidatorUtils.validateEntity(sysDictionaryItem);
            sysDictionaryItemService.insert(sysDictionaryItem);

        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("sys:sysdictionaryitem:update")
    public R update(@RequestBody SysDictionaryItemEntity sysDictionaryItem) {
            sysDictionaryItem.update();
            //校验类型
             ValidatorUtils.validateEntity(sysDictionaryItem);
            sysDictionaryItemService.updateById(sysDictionaryItem);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("sys:sysdictionaryitem:delete")
    public R delete(@RequestBody Long[]ids) {
            sysDictionaryItemService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
