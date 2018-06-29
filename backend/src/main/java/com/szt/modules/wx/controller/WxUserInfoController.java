package com.szt.modules.wx.controller;

import java.util.Arrays;
import java.util.Map;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.sys.oauth2.TokenGenerator;
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
import com.szt.modules.wx.entity.WxUserInfoEntity;
import com.szt.modules.wx.service.WxUserInfoService;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.annotation.SysLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
/**
 * 微信公众号管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-22 14:49:05
 */
@Slf4j
@Api(value = "微信公众号管理接口", tags = "微信公众号管理接口")
@RestController
@RequestMapping("wx/wxuserinfo")
@Controller("wxwxuserinfo")
public class WxUserInfoController {
    @Autowired
    private WxUserInfoService wxUserInfoService;

    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("wx:wxuserinfo:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = wxUserInfoService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("wx:wxuserinfo:info")
    public R info(@PathVariable("id") Long id) {
            WxUserInfoEntity wxUserInfo = wxUserInfoService.selectById(id);

        return R.ok().put("data", wxUserInfo);
    }

    /**
     * 保存
     */
    @SysLog("保存信息")
    @ApiOperation("保存")
    @PostMapping("/save")
    @RequiresPermissions("wx:wxuserinfo:save")
    public R save(@RequestBody WxUserInfoEntity wxUserInfo) {
             wxUserInfo.insert();
            //生成一个token
            wxUserInfo.setToken(TokenGenerator.generateValue());
            //校验类型
            ValidatorUtils.validateEntity(wxUserInfo);
            wxUserInfoService.insert(wxUserInfo);
        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改信息")
    @ApiOperation("修改")
    @PostMapping("/update")
    @RequiresPermissions("wx:wxuserinfo:update")
    public R update(@RequestBody WxUserInfoEntity wxUserInfo) {
            wxUserInfo.update();
            //校验类型
             ValidatorUtils.validateEntity(wxUserInfo);
            wxUserInfoService.updateById(wxUserInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @SysLog("删除信息")
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("wx:wxuserinfo:delete")
    public R delete(@RequestBody Long[]ids) {
            wxUserInfoService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
