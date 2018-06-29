package com.szt.modules.generator.controller;

import java.util.Arrays;
import java.util.Map;
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
import com.szt.modules.generator.entity.GeneratorBusConfigEntity;
import com.szt.modules.generator.service.GeneratorBusConfigService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 自动生成参数管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 15:18:03
 */
@Slf4j
@Api(value = "自动生成参数管理接口", tags = "自动生成参数管理接口")
@RestController
@RequestMapping("generator/generatorbusconfig")
@Controller("generatorgeneratorbusconfig")
public class GeneratorBusConfigController {
    @Autowired
    private GeneratorBusConfigService generatorBusConfigService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("generator:generatorbusconfig:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = generatorBusConfigService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("generator:generatorbusconfig:info")
    public R info(@PathVariable("id") Long id) {
            GeneratorBusConfigEntity generatorBusConfig = generatorBusConfigService.selectById(id);

        return R.ok().put("data", generatorBusConfig);
    }

    /**
     * 保存
     */
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("generator:generatorbusconfig:save")
    public R save(@RequestBody GeneratorBusConfigEntity generatorBusConfig) {
             generatorBusConfig.insert();
            //校验类型
            ValidatorUtils.validateEntity(generatorBusConfig);
            generatorBusConfigService.insert(generatorBusConfig);

        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("generator:generatorbusconfig:update")
    public R update(@RequestBody GeneratorBusConfigEntity generatorBusConfig) {
            generatorBusConfig.update();
            //校验类型
             ValidatorUtils.validateEntity(generatorBusConfig);
            generatorBusConfigService.updateById(generatorBusConfig);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("generator:generatorbusconfig:delete")
    public R delete(@RequestBody Long[]ids) {
            generatorBusConfigService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    /**
     * 查询所有业务参数
     */
    @ApiOperation("查询所有业务参数")
    @GetMapping("/querySysBusConfigList")
    public R querySysBusConfigList() {
        return R.ok().put("data",InitBusConfig.buconfig);
    }

}
