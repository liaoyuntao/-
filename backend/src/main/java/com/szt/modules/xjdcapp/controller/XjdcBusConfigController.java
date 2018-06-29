package com.szt.modules.xjdcapp.controller;

import com.szt.common.annotation.SysLog;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.generator.entity.GeneratorBusConfigEntity;
import com.szt.modules.generator.service.GeneratorBusConfigService;
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
 * 自动生成参数管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 15:18:03
 */
@Slf4j
@Api(value = "自动生成参数管理接口", tags = "自动生成参数管理接口")
@RestController
@RequestMapping("xjdc/generatorbusconfig")
@Controller("xjdcgeneratorbusconfig")
public class XjdcBusConfigController {
    @Autowired
    private GeneratorBusConfigService generatorBusConfigService;


    /**
     * 查询所有业务参数
     */
    @ApiOperation("查询所有业务参数")
    @GetMapping("/querySysBusConfigList")
    public R querySysBusConfigList() {
        return R.ok().put("data",generatorBusConfigService.queryAppSysBusConfigList());
    }

}
