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
import com.szt.modules.wjadmin.entity.WjadminGoodsEntity;
import com.szt.modules.wjadmin.service.WjadminGoodsService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 商品管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
@Slf4j
@Api(value = "商品管理接口", tags = "商品管理接口")
@RestController
@RequestMapping("wjadmin/wjadmingoods")
@Controller("wjadminwjadmingoods")
public class WjadminGoodsController {
    @Autowired
    private WjadminGoodsService wjadminGoodsService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("wjadmin:wjadmingoods:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = wjadminGoodsService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("wjadmin:wjadmingoods:info")
    public R info(@PathVariable("id") Long id) {
            WjadminGoodsEntity wjadminGoods = wjadminGoodsService.selectById(id);

        return R.ok().put("data", wjadminGoods);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("wjadmin:wjadmingoods:save")
    public R save(@RequestBody WjadminGoodsEntity wjadminGoods) {
            wjadminGoodsService.insertEntity(wjadminGoods);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("wjadmin:wjadmingoods:save")
    public R save(@RequestBody List<WjadminGoodsEntity> wjadminGoods) {
            wjadminGoodsService.saveAll(wjadminGoods);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("wjadmin:wjadmingoods:update")
    public R update(@RequestBody WjadminGoodsEntity wjadminGoods) {
            wjadminGoods.update();
            //校验类型
             ValidatorUtils.validateEntity(wjadminGoods);
            wjadminGoodsService.updateById(wjadminGoods);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("wjadmin:wjadmingoods:delete")
    public R delete(@RequestBody Long[]ids) {
            wjadminGoodsService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
