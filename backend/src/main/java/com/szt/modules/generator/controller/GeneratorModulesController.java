
package com.szt.modules.generator.controller;

import com.szt.common.annotation.SysLog;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.generator.entity.GeneratorModulesEntity;
import com.szt.modules.generator.service.GeneratorModulesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

/**
 * 模块管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-05-27 19:01:10
 */
@Slf4j
@Api(value = "模块管理接口", tags = "模块管理接口")
@RestController
@RequestMapping("generator/generatormodules")
public class GeneratorModulesController {
    @Autowired
    private GeneratorModulesService generatorModulesService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("generator:generatormodules:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = generatorModulesService.queryPage(params);
        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("generator:generatormodules:info")
    public R info(@PathVariable("id") Long id) {
            GeneratorModulesEntity generatorModules = generatorModulesService.selectById(id);

        return R.ok().put("data", generatorModules);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("generator:generatormodules:save")
    public R save(@RequestBody GeneratorModulesEntity generatorModules) {
             generatorModules.insert();
            //校验类型
            ValidatorUtils.validateEntity(generatorModules);
            generatorModulesService.insert(generatorModules);
        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("generator:generatormodules:update")
    public R update(@RequestBody GeneratorModulesEntity generatorModules) {
            generatorModules.update();
            //校验类型
             ValidatorUtils.validateEntity(generatorModules);
            generatorModulesService.updateById(generatorModules);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("generator:generatormodules:delete")
    public R delete(@RequestBody Long[]ids) {
            generatorModulesService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    /**
     * 查询所有显示的模块
     */
    @ApiOperation("查询所有显示的模块")
    @PostMapping("/queryGeneratorModulesList")
    public R queryGeneratorModulesList() {
        return R.ok().put("data",generatorModulesService.queryGeneratorModulesList());
    }


}
