package com.szt.modules.wjxcx.controller;

import java.util.Arrays;
import java.util.Map;
import java.util.List;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.wjadmin.entity.WjadminUserInfoEntity;
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
//import com.szt.modules.wjxcx.entity.WjadminUserInfoEntity;
import com.szt.modules.wjxcx.service.WjadminUserInfoService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 小程序用户详细信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:58:55
 */
@Slf4j
@Api(value = "小程序用户详细信息接口", tags = "小程序用户详细信息接口")
@RestController
@RequestMapping("wjxcx/wjadminuserinfo")
@Controller("wjxcxwjadminuserinfo")
public class WjadminUserInfoController {
    @Autowired
    private WjadminUserInfoService wjadminUserInfoService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("wjxcx:wjadminuserinfo:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = wjadminUserInfoService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("wjxcx:wjadminuserinfo:info")
    public R info(@PathVariable("id") Long id) {
            WjadminUserInfoEntity wjadminUserInfo = wjadminUserInfoService.selectById(id);

        return R.ok().put("data", wjadminUserInfo);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("wjxcx:wjadminuserinfo:save")
    public R save(@RequestBody WjadminUserInfoEntity wjadminUserInfo) {
            wjadminUserInfoService.insertEntity(wjadminUserInfo);
        return R.ok();
    }
    /**
     * 批量保存
     */
    @SysLog("批量保存信息")
    @ApiOperation("批量保存")
    @PostMapping("/saveAll")
    @RequiresPermissions("wjxcx:wjadminuserinfo:save")
    public R save(@RequestBody List<WjadminUserInfoEntity> wjadminUserInfo) {
            wjadminUserInfoService.saveAll(wjadminUserInfo);
        return R.ok();
    }
    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("wjxcx:wjadminuserinfo:update")
    public R update(@RequestBody WjadminUserInfoEntity wjadminUserInfo) {
            wjadminUserInfo.update();
            //校验类型
             ValidatorUtils.validateEntity(wjadminUserInfo);
            wjadminUserInfoService.updateById(wjadminUserInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("wjxcx:wjadminuserinfo:delete")
    public R delete(@RequestBody Long[]ids) {
            wjadminUserInfoService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
