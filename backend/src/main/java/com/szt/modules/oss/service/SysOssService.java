package com.szt.modules.oss.service;

import com.szt.common.CommonService;
import com.szt.modules.oss.entity.SysOssEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 文件上传
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-25 12:13:26
 */
public interface SysOssService extends CommonService<SysOssEntity> {

    /**
     * 上传图片
     * @param file
     */
    String insertUpload(MultipartFile file);
    /**
     * 上传图片
     * @param appid
     * @param serviceId
     */
    List<String> insertUpload(String appid, String serviceId);
}
