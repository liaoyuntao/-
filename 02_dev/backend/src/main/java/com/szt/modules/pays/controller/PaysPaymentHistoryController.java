package com.szt.modules.pays.controller;

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
import com.szt.modules.pays.entity.PaysPaymentHistoryEntity;
import com.szt.modules.pays.service.PaysPaymentHistoryService;
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
 * @date 2018-09-18 12:24:24
 */
@Slf4j
@Api(value = "支付记录管理接口", tags = "支付记录管理接口")
@RestController
@RequestMapping("pays/payspaymenthistory")
@Controller("payspayspaymenthistory")
public class PaysPaymentHistoryController {
    @Autowired
    private PaysPaymentHistoryService paysPaymentHistoryService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("pays:payspaymenthistory:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = paysPaymentHistoryService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("pays:payspaymenthistory:info")
    public R info(@PathVariable("id") Long id) {
            PaysPaymentHistoryEntity paysPaymentHistory = paysPaymentHistoryService.selectById(id);

        return R.ok().put("data", paysPaymentHistory);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("pays:payspaymenthistory:save")
    public R save(@RequestBody PaysPaymentHistoryEntity paysPaymentHistory) {
            paysPaymentHistoryService.insertEntity(paysPaymentHistory);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("pays:payspaymenthistory:save")
    public R save(@RequestBody List<PaysPaymentHistoryEntity> paysPaymentHistory) {
            paysPaymentHistoryService.saveAll(paysPaymentHistory);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("pays:payspaymenthistory:update")
    public R update(@RequestBody PaysPaymentHistoryEntity paysPaymentHistory) {
            paysPaymentHistory.update();
            //校验类型
             ValidatorUtils.validateEntity(paysPaymentHistory);
            paysPaymentHistoryService.updateById(paysPaymentHistory);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("pays:payspaymenthistory:delete")
    public R delete(@RequestBody Long[]ids) {
            paysPaymentHistoryService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
