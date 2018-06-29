package com.szt.modules.xjdc.controller;

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
import com.szt.modules.xjdc.entity.XjdcDataDictEntity;
import com.szt.modules.xjdc.service.XjdcDataDictService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 数据字典
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:07:56
 */
@Slf4j
@Api(value = "数据字典接口", tags = "数据字典接口")
@RestController
@RequestMapping("xjdc/xjdcdatadict")
@Controller("xjdcxjdcdatadict")
public class XjdcDataDictController {
    @Autowired
    private XjdcDataDictService xjdcDataDictService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("xjdc:xjdcdatadict:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = xjdcDataDictService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("xjdc:xjdcdatadict:info")
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
    @RequiresPermissions("xjdc:xjdcdatadict:save")
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
    @RequiresPermissions("xjdc:xjdcdatadict:update")
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
    @RequiresPermissions("xjdc:xjdcdatadict:delete")
    public R delete(@RequestBody Long[]ids) {
            xjdcDataDictService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
