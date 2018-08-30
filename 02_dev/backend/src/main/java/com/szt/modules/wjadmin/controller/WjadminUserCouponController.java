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
import com.szt.modules.wjadmin.entity.WjadminUserCouponEntity;
import com.szt.modules.wjadmin.service.WjadminUserCouponService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 用户优惠卷管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
@Slf4j
@Api(value = "用户优惠卷管理接口", tags = "用户优惠卷管理接口")
@RestController
@RequestMapping("wjadmin/wjadminusercoupon")
@Controller("wjadminwjadminusercoupon")
public class WjadminUserCouponController {
    @Autowired
    private WjadminUserCouponService wjadminUserCouponService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("wjadmin:wjadminusercoupon:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = wjadminUserCouponService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("wjadmin:wjadminusercoupon:info")
    public R info(@PathVariable("id") Long id) {
            WjadminUserCouponEntity wjadminUserCoupon = wjadminUserCouponService.selectById(id);

        return R.ok().put("data", wjadminUserCoupon);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("wjadmin:wjadminusercoupon:save")
    public R save(@RequestBody WjadminUserCouponEntity wjadminUserCoupon) {
            wjadminUserCouponService.insertEntity(wjadminUserCoupon);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("wjadmin:wjadminusercoupon:save")
    public R save(@RequestBody List<WjadminUserCouponEntity> wjadminUserCoupon) {
            wjadminUserCouponService.saveAll(wjadminUserCoupon);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("wjadmin:wjadminusercoupon:update")
    public R update(@RequestBody WjadminUserCouponEntity wjadminUserCoupon) {
            wjadminUserCoupon.update();
            //校验类型
             ValidatorUtils.validateEntity(wjadminUserCoupon);
            wjadminUserCouponService.updateById(wjadminUserCoupon);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("wjadmin:wjadminusercoupon:delete")
    public R delete(@RequestBody Long[]ids) {
            wjadminUserCouponService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
