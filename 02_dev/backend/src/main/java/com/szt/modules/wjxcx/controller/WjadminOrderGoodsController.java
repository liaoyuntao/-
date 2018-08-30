package com.szt.modules.wjxcx.controller;

import java.util.Arrays;
import java.util.Map;
import java.util.List;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.wjadmin.entity.WjadminOrderGoodsEntity;
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
//import com.szt.modules.wjxcx.entity.WjadminOrderGoodsEntity;
import com.szt.modules.wjxcx.service.WjadminOrderGoodsService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 订单商品管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:58:55
 */
@Slf4j
@Api(value = "订单商品管理接口", tags = "订单商品管理接口")
@RestController
@RequestMapping("wjxcx/wjadminordergoods")
@Controller("wjxcxwjadminordergoods")
public class WjadminOrderGoodsController {
    @Autowired
    private WjadminOrderGoodsService wjadminOrderGoodsService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("wjxcx:wjadminordergoods:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = wjadminOrderGoodsService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("wjxcx:wjadminordergoods:info")
    public R info(@PathVariable("id") Long id) {
            WjadminOrderGoodsEntity wjadminOrderGoods = wjadminOrderGoodsService.selectById(id);

        return R.ok().put("data", wjadminOrderGoods);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("wjxcx:wjadminordergoods:save")
    public R save(@RequestBody WjadminOrderGoodsEntity wjadminOrderGoods) {
            wjadminOrderGoodsService.insertEntity(wjadminOrderGoods);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("wjxcx:wjadminordergoods:save")
    public R save(@RequestBody List<WjadminOrderGoodsEntity> wjadminOrderGoods) {
            wjadminOrderGoodsService.saveAll(wjadminOrderGoods);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("wjxcx:wjadminordergoods:update")
    public R update(@RequestBody WjadminOrderGoodsEntity wjadminOrderGoods) {
            wjadminOrderGoods.update();
            //校验类型
             ValidatorUtils.validateEntity(wjadminOrderGoods);
            wjadminOrderGoodsService.updateById(wjadminOrderGoods);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("wjxcx:wjadminordergoods:delete")
    public R delete(@RequestBody Long[]ids) {
            wjadminOrderGoodsService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
