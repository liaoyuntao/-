package com.szt.modules.oss.service.impl;

import com.szt.modules.oss.cloud.OSSFactory;
import com.szt.modules.wx.utils.WechatUtils;
import org.springframework.stereotype.Service;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.oss.dao.SysOssDao;
import com.szt.modules.oss.entity.SysOssEntity;
import com.szt.modules.oss.service.SysOssService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import static com.szt.modules.oss.controller.ApiSysOssController.getInputStream;

/**
 * 上传图片管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 22:33:41
 */
@Service("osssysOssService")
public class SysOssServiceImpl extends CommonServiceImpl<SysOssDao, SysOssEntity> implements SysOssService {


    @Override
    public String insertUpload(MultipartFile file) {
        //上传文件
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String url = null;
        try {
            url = OSSFactory.build().uploadSuffix(file.getBytes(), suffix)+"?imageslim";
        } catch (IOException e) {
            e.printStackTrace();
        }
        //保存文件信息
        SysOssEntity ossEntity = new SysOssEntity();
        ossEntity.setUrl(url);
        ossEntity.insert();
        return url;
    }

    @Override
    @Transactional
    public List<String> insertUpload(String appid, String serviceId) {
        String[] array = serviceId.split(",");
       List<String> urlList = new ArrayList<String>(array.length);
        for(String obj : array){
            InputStream files = getInputStream(WechatUtils.getAccessToken(appid),obj);
            /** 将图片保存到本地服务器 **/
            String url  = OSSFactory.build().uploadSuffix(files, ".png")+"?imageslim";
            //保存文件信息
            SysOssEntity ossEntity = new SysOssEntity();
            ossEntity.setUrl(url);
            ossEntity.insert();
            urlList.add(url);
        }
        return urlList;
    }
}
