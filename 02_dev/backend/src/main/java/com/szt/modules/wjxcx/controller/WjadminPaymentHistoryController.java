package com.szt.modules.wjxcx.controller;

import java.util.Arrays;
import java.util.Map;
import java.util.List;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.wjadmin.entity.WjadminPaymentHistoryEntity;
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
//import com.szt.modules.wjxcx.entity.WjadminPaymentHistoryEntity;
import com.szt.modules.wjxcx.service.WjadminPaymentHistoryService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 支付记录管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:58:55
 */
@Slf4j
@Api(value = "支付记录管理接口", tags = "支付记录管理接口")
@RestController
@RequestMapping("wjxcx/wjadminpaymenthistory")
@Controller("wjxcxwjadminpaymenthistory")
public class WjadminPaymentHistoryController {
    @Autowired
    private WjadminPaymentHistoryService wjadminPaymentHistoryService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("wjxcx:wjadminpaymenthistory:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = wjadminPaymentHistoryService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("wjxcx:wjadminpaymenthistory:info")
    public R info(@PathVariable("id") Long id) {
            WjadminPaymentHistoryEntity wjadminPaymentHistory = wjadminPaymentHistoryService.selectById(id);

        return R.ok().put("data", wjadminPaymentHistory);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("wjxcx:wjadminpaymenthistory:save")
    public R save(@RequestBody WjadminPaymentHistoryEntity wjadminPaymentHistory) {
            wjadminPaymentHistoryService.insertEntity(wjadminPaymentHistory);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("wjxcx:wjadminpaymenthistory:save")
    public R save(@RequestBody List<WjadminPaymentHistoryEntity> wjadminPaymentHistory) {
            wjadminPaymentHistoryService.saveAll(wjadminPaymentHistory);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("wjxcx:wjadminpaymenthistory:update")
    public R update(@RequestBody WjadminPaymentHistoryEntity wjadminPaymentHistory) {
            wjadminPaymentHistory.update();
            //校验类型
             ValidatorUtils.validateEntity(wjadminPaymentHistory);
            wjadminPaymentHistoryService.updateById(wjadminPaymentHistory);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("wjxcx:wjadminpaymenthistory:delete")
    public R delete(@RequestBody Long[]ids) {
            wjadminPaymentHistoryService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
