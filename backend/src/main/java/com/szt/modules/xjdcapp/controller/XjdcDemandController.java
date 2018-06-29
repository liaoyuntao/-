package com.szt.modules.xjdcapp.controller;

import com.szt.common.annotation.SysLog;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.R;
import com.szt.common.utils.WxApiUtils;
import com.szt.common.validator.ValidatorUtils;
import com.szt.modules.wx.controller.WxTemplate;
import com.szt.modules.wx.service.WxUserInfoService;
import com.szt.modules.xjdc.entity.XjdcDemandEntity;
import com.szt.modules.xjdcapp.service.XjdcDemandService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Map;
/**
 * 需求信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:35:05
 */
@Slf4j
@Api(value = "需求信息接口", tags = "需求信息接口")
@RestController
@RequestMapping("xjdcapp/xjdcdemand")
@Controller("xjdcappxjdcdemand")
public class XjdcDemandController {
    @Autowired
    private XjdcDemandService xjdcDemandService;
    @Autowired
    private WxUserInfoService wxUserInfoService;
    /**
     * 列表
     */
    @ApiOperation("列表")
    @GetMapping("/list")
    @RequiresPermissions("xjdcapp:xjdcdemand:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = xjdcDemandService.queryPage(params);

        return R.ok().put("data", page);
    }


    /**
     * 信息
     */
    @ApiOperation("信息")
    @GetMapping("/info/{id}")
    @RequiresPermissions("xjdcapp:xjdcdemand:info")
    public R info(@PathVariable("id") Long id) {
            XjdcDemandEntity xjdcDemand = xjdcDemandService.selectById(id);

        return R.ok().put("data", xjdcDemand);
    }

    /**
     * 保存
     */
    @ApiOperation("保存")
    @PostMapping("/save")
    public R save(@RequestBody XjdcDemandEntity xjdcDemand, HttpServletRequest request) {
             xjdcDemand.insert();
          String appid = request.getParameter("appid");
         if(StringUtils.isBlank(appid)){
             return R.error("appid不能为空!");
         }
        //校验类型
        ValidatorUtils.validateEntity(xjdcDemand);
        xjdcDemandService.insertXjdcDemandEntity(xjdcDemand,appid);
        return R.ok();
    }

    /**
     * 修改
     */
    @ApiOperation("修改")
    @PostMapping("/update")
    public R update(@RequestBody XjdcDemandEntity xjdcDemand) {
            xjdcDemand.update();
            //校验类型
             ValidatorUtils.validateEntity(xjdcDemand);
            xjdcDemandService.updateById(xjdcDemand);

        return R.ok();
    }

    /**
     * 删除
     */
    @ApiOperation("删除")
    @PostMapping("/delete")
    @RequiresPermissions("xjdcapp:xjdcdemand:delete")
    public R delete(@RequestBody Long[]ids) {
            xjdcDemandService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

}
