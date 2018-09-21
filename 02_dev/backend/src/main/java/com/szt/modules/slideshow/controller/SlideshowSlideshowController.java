package com.szt.modules.slideshow.controller;

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
import com.szt.modules.slideshow.entity.SlideshowSlideshowEntity;
import com.szt.modules.slideshow.service.SlideshowSlideshowService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 轮播图管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-09-18 12:24:23
 */
@Slf4j
@Api(value = "轮播图管理接口", tags = "轮播图管理接口")
@RestController
@RequestMapping("slideshow/slideshowslideshow")
@Controller("slideshowslideshowslideshow")
public class SlideshowSlideshowController {
    @Autowired
    private SlideshowSlideshowService slideshowSlideshowService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("slideshow:slideshowslideshow:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = slideshowSlideshowService.queryPage(params);
        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("slideshow:slideshowslideshow:info")
    public R info(@PathVariable("id") Long id) {
            SlideshowSlideshowEntity slideshowSlideshow = slideshowSlideshowService.selectById(id);

        return R.ok().put("data", slideshowSlideshow);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("slideshow:slideshowslideshow:save")
    public R save(@RequestBody SlideshowSlideshowEntity slideshowSlideshow) {
            slideshowSlideshowService.insertEntity(slideshowSlideshow);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("slideshow:slideshowslideshow:save")
    public R save(@RequestBody List<SlideshowSlideshowEntity> slideshowSlideshow) {
            slideshowSlideshowService.saveAll(slideshowSlideshow);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("slideshow:slideshowslideshow:update")
    public R update(@RequestBody SlideshowSlideshowEntity slideshowSlideshow) {
            slideshowSlideshow.update();
            //校验类型
             ValidatorUtils.validateEntity(slideshowSlideshow);
            slideshowSlideshowService.updateById(slideshowSlideshow);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("slideshow:slideshowslideshow:delete")
    public R delete(@RequestBody Long[]ids) {
            slideshowSlideshowService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
