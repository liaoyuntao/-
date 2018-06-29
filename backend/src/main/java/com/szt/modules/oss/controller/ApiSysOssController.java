package com.szt.modules.oss.controller;

import com.szt.common.exception.RRException;
import com.szt.common.utils.R;
import com.szt.modules.oss.service.SysOssService;
import com.szt.modules.oss.util.BASE64DecodedMultipartFile;
import com.szt.modules.wx.utils.WechatUtils;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@Slf4j
@Api(value = "上传图片管理接口", tags = "上传图片管理接口")
@RestController
@RequestMapping("api/sysoss")
@Controller("apisysoss")
public class ApiSysOssController {
    @Autowired
    private SysOssService sysOssService;
    /**
     * 上传微信图片
     */
    @GetMapping("/upload")
    public R upload(String serviceId,String appid,String localIds) throws Exception {
        if(StringUtils.isBlank(serviceId)){
            return R.error("serviceId不存在");
        }

        return R.ok().put("data", sysOssService.insertUpload(appid,serviceId));
    }
    public static byte[] toByteArray(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int n = 0;
        while (-1 != (n = input.read(buffer))) {
            output.write(buffer, 0, n);
        }
        return output.toByteArray();
    }
    /**
     * 根据文件id下载文件
     * @param accessToken
     * @param mediaId
     * @return 文件流对象
     */
    public static InputStream getInputStream(String accessToken, String mediaId) {
        InputStream is = null;
        String url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token="+ accessToken + "&media_id=" + mediaId;
        try {
            URL urlGet = new URL(url);
            HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
            http.setRequestMethod("GET"); // 必须是get方式请求
            http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
            http.connect();
            // 获取文件转化为byte流
            is = http.getInputStream();
        } catch (Exception e) {
            log.error("Failed to convert inputStream from weixin server,accessToken:{},mediaId:{}",accessToken,mediaId);
        }
        return is;

    }
}
