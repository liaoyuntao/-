package com.szt.modules.wjadmin.controller;

import java.util.Arrays;
import java.util.Map;
import java.util.List;
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
import com.szt.modules.wjadmin.entity.WjadminCartEntity;
import com.szt.modules.wjadmin.service.WjadminCartService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 购物车管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
@Slf4j
@Api(value = "购物车管理接口", tags = "购物车管理接口")
@RestController
@RequestMapping("wjadmin/wjadmincart")
@Controller("wjadminwjadmincart")
public class WjadminCartController {
    @Autowired
    private WjadminCartService wjadminCartService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("wjadmin:wjadmincart:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = wjadminCartService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("wjadmin:wjadmincart:info")
    public R info(@PathVariable("id") Long id) {
            WjadminCartEntity wjadminCart = wjadminCartService.selectById(id);

        return R.ok().put("data", wjadminCart);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("wjadmin:wjadmincart:save")
    public R save(@RequestBody WjadminCartEntity wjadminCart) {
            wjadminCartService.insertEntity(wjadminCart);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("wjadmin:wjadmincart:save")
    public R save(@RequestBody List<WjadminCartEntity> wjadminCart) {
            wjadminCartService.saveAll(wjadminCart);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("wjadmin:wjadmincart:update")
    public R update(@RequestBody WjadminCartEntity wjadminCart) {
            wjadminCart.update();
            //校验类型
             ValidatorUtils.validateEntity(wjadminCart);
            wjadminCartService.updateById(wjadminCart);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("wjadmin:wjadmincart:delete")
    public R delete(@RequestBody Long[]ids) {
            wjadminCartService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
