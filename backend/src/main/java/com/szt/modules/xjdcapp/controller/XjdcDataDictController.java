package com.szt.modules.xjdcapp.controller;

import com.szt.common.annotation.SysLog;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.xjdc.entity.XjdcDataDictEntity;
import com.szt.modules.xjdcapp.service.XjdcDataDictService;
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
 * 数据字典
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:35:05
 */
@Slf4j
@Api(value = "数据字典接口", tags = "数据字典接口")
@RestController
@RequestMapping("xjdcapp/xjdcdatadict")
@Controller("xjdcappxjdcdatadict")
public class XjdcDataDictController {
    @Autowired
    private XjdcDataDictService xjdcDataDictService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("xjdcapp:xjdcdatadict:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = xjdcDataDictService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("xjdcapp:xjdcdatadict:info")
    public R info(@PathVariable("id") Long id) {
            XjdcDataDictEntity xjdcDataDict = xjdcDataDictService.selectById(id);

        return R.ok().put("data", xjdcDataDict);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("xjdcapp:xjdcdatadict:save")
    public R save(@RequestBody XjdcDataDictEntity xjdcDataDict) {
             xjdcDataDict.insert();
            //校验类型
            ValidatorUtils.validateEntity(xjdcDataDict);
            xjdcDataDictService.insert(xjdcDataDict);

        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("xjdcapp:xjdcdatadict:update")
    public R update(@RequestBody XjdcDataDictEntity xjdcDataDict) {
            xjdcDataDict.update();
            //校验类型
             ValidatorUtils.validateEntity(xjdcDataDict);
            xjdcDataDictService.updateById(xjdcDataDict);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("xjdcapp:xjdcdatadict:delete")
    public R delete(@RequestBody Long[]ids) {
            xjdcDataDictService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
