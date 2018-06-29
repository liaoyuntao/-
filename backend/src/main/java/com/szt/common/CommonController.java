package com.szt.common;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.szt.common.exception.RRException;
import com.szt.common.utils.R;
import com.szt.common.utils.SmsUtil;
import com.szt.modules.oss.cloud.OSSFactory;
import com.szt.modules.oss.entity.SysOssEntity;
import com.szt.modules.oss.service.SysOssService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


/**
 * 公共接口模块
 */
@RestController
@Api(value = "公共接口", tags = "公共接口")
@RequestMapping("api")
@Slf4j
@CrossOrigin
public class CommonController {

    @Autowired
    private SysOssService sysOssService;

    @Autowired
    private SmsUtil smsService;
    /**
     * 后台图片裁剪公共上传图片
     */
    @RequestMapping("/baseUploadImg")
    public String uploadImg(@RequestBody String image){
        String url = null;
        Base64 base64 = new Base64();
        byte[] k = base64.decode(image.substring("{\"image\":\"data:image/jpeg;base64,".length(),image.length()-2));
        url = OSSFactory.build().uploadSuffix(k, ".png");
        return url;
    }
    @RequestMapping("/uploadFile")
    public R uploadFile(@RequestParam("imgFile")MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            throw new RRException("上传文件不能为空");
        }

        //上传文件
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String url = OSSFactory.build().uploadSuffix(file.getBytes(), suffix);

        //保存文件信息
        SysOssEntity ossEntity = new SysOssEntity();
        ossEntity.setUrl(url);
        ossEntity.insert();
        sysOssService.insert(ossEntity);

        return R.ok().put("url", url).put("error", 0);
    }
    /**
     * app图片上传
     */
    @ApiOperation("app图片上传")
    @RequestMapping("/appUploadImg")
    public R uploadImg(HttpServletResponse response, @RequestParam("file") MultipartFile file) throws IOException {
        StringBuilder url= new StringBuilder();
        Map<String,String> map  = new HashMap<String,String>();
        if(file==null){
            return R.error("文件不能为空!");
        }else {
            map.put("url",OSSFactory.build().uploadSuffix(file.getBytes(), ".png"));
        }
        return R.ok().put("data",map);
    }
    /**
     * app批量图片上传
     */
    @ApiOperation("app批量图片上传")
    @RequestMapping("/appUploadImgList")
    public R appUploadImgList(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {
        StringBuilder url= new StringBuilder();
        Iterator<String> itr =  request.getFileNames();
        while(itr.hasNext()){
            String str = itr.next();    //这个文件并不是原来的文件名
            MultipartFile mpf = request.getFile(str);
            url.append(OSSFactory.build().uploadSuffix(mpf.getBytes(), ".png")+",");
        }
        Map<String,String> map  = new HashMap<String,String>();
        map.put("url",  url.substring(0,url.length()-1).toString());
        return R.ok().put("data",map);

    }
    

    /**
     * 录入融云信息
     * fromUserId	String	发送用户 Id。
     toUserId	String	接收用户 Id，即为客户端 targetId。
     objectName	String	消息类型，文本消息 RC:TxtMsg 、 图片消息 RC:ImgMsg 、语音消息 RC:VcMsg 、图文消息 RC:ImgTextMsg 、位置消息 RC:LBSMsg 、添加联系人消息 RC:ContactNtf 、提示条通知消息 RC:InfoNtf 、资料通知消息 RC:ProfileNtf 、通用命令通知消息 RC:CmdNtf ，详细请参见消息类型说明文档。
     content	String	发送消息内容，参考融云消息类型表.示例说明
     channelType	String	会话类型，二人会话是 PERSON 、讨论组会话是 PERSONS 、群组会话是 GROUP 、聊天室会话是 TEMPGROUP 、客服会话是 CUSTOMERSERVICE 、 系统通知是 NOTIFY 、应用公众服务是 MC 、公众服务是 MP。
     对应客户端 SDK 中 ConversationType 类型，二人会话是 1 、讨论组会话是 2 、群组会话是 3 、聊天室会话是 4 、客服会话是 5 、 系统通知是 6 、应用公众服务是 7 、公众服务是 8。
     msgTimestamp	String	服务端收到客户端发送消息时的服务器时间（1970年到现在的毫秒数）。
     msgUID	String	可通过 msgUID 确定消息唯一。
     sensitiveType	Int	消息中是否含有敏感词标识，0 为不含有敏感词，1 为含有屏蔽敏感词，2 为含有替换敏感词。消息路由功能默认含有屏蔽敏感词的消息不进行路由，可提交工单开通含有敏感词的消息路由功能，未开通情况下 sensitiveType 值默认为 0 不代表任何意义。开通后可通过该属性判断消息中是否含有敏感词。目前支持单聊、群聊、聊天室会话类型，其他会话类型默认为 0 ，开通后含有屏蔽敏感词的消息也不会进行下发，只会进行消息路由。
     source	String	标识消息的发送源头，包括：iOS、Android、Websocket。目前支持单聊、群聊会话类型，其他会话类型为空。

     */
   private static final SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

//    @RequestMapping("/imMsg")
//    public String ImMsg(@RequestParam Map<String, Object> params) throws ParseException {
//        String d = format.format(Long.parseLong((String)params.get("msgTimestamp")));
//        Date date=format.parse(d);
//        RyImMassageEntity obj = new RyImMassageEntity();
//        obj.setFromUserId((String) params.get("fromUserId"));
//        obj.setToUserId((String) params.get("toUserId"));
//        obj.setObjectName((String) params.get("objectName"));
//        obj.setContent((String) params.get("content"));
//        obj.setChannelType((String) params.get("channelType"));
//        obj.setMsgTimestamp(date);
//        obj.setSensitiveType((String) params.get("sensitiveType"));
//        obj.setSource((String) params.get("source"));
//        obj.setMsgUid((String) params.get("msgUID"));
//        ryImMassageService.save(obj);
//        return "<xml><code>200</code><url>http://aa.com/1/c6720eea-452b-4f93-8159-7af3046611f1.zip</url><date>2014010101</date></xml>";
//    }
//
//    @RequestMapping(value = "/wxNotifyUrl", method = {RequestMethod.POST, RequestMethod.GET})
//    @ResponseBody
//    public String wxNotifyUrl(HttpServletRequest request) throws ParseException {
//        Map<String, String> xml = new HashMap<String, String>();
////        xml.put("return_code", "FAIL");
////        xml.put("return_msg", "result_code is FAIL");
//        // 支付结果通用通知文档: https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_7
//        log.info("微信支付回调开始");
//        String xmlMsg = HttpKit.readData(request);
//        log.info("微信支付通知=" + xmlMsg);
//        Map<String, String> resultData = PaymentKit.xmlToMap(xmlMsg);
//        Map<String, Object> addData = (Map<String, Object>) JSON.parse(resultData.get("attach"));
//        String result_code = resultData.get("result_code");
//        // 注意重复通知的情况，同一订单号可能收到多次通知，请注意一定先判断订单状态
//        // 避免已经成功、关闭、退款的订单被再次更新
//        if (PaymentKit.verifyNotify(resultData, WxPayApiConfigKit.getWxPayApiConfig().getPaternerKey())) {
//            if ("SUCCESS".equals(result_code)) {
//                if (appPayService.NotifyUrl(resultData, addData)) {
//                    xml.put("return_code", "SUCCESS");
//                    xml.put("return_msg", "OK");
//                } else {
//                    xml.put("return_code", "FAIL");
//                    xml.put("return_msg", "result_code is FAIL");
//                }
//            } else {
//                log.info("支付失败");
//            }
//        }
//        log.info("微信支付回调结束");
//        return PaymentKit.toXml(xml);
//    }
//
//
//    @Autowired
//    private AliPayBean aliPayBean;
//
//    @RequestMapping(value = "/alipayNotifyUrl")
//    @ResponseBody
//    public String alipayNotifyUrl(HttpServletRequest request, @RequestParam Map<String, String> resultData) throws AlipayApiException {
//        String result = "failure";
//        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
//        Map<String, Object> addData = (Map<String, Object>) JSON.parse(resultData.get("passback_params"));
//        log.info("支付宝支付回调结束");
//        log.info("支付通知=" + resultData);
//        //切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
//        boolean verify_result = AlipaySignature.rsaCheckV1(resultData, aliPayBean.getAlipayPublicKey(), "utf-8", resultData.get("sign_type"));
//        // 验证成功
//        if (verify_result) {
//            if (appPayService.NotifyUrl(resultData, addData)) {
//                result = "success";
//            }
//        } else {
//            log.info("签名错误");
//        }
//        log.info("支付宝支付回调结束");
//        return result;
//    }

    /**
     * 忘记密码，重置密码
     * 发送短信验证码
     */
    @ApiOperation("发送短信验证码")
    @RequestMapping("/sendCode")
    public R sendCode(HttpServletRequest request,String phone){
        try {
            smsService.sendCode(request,phone);
        } catch (Exception e) {
            log.error("发送短信验证码失败",e);
            if(e.getMessage()!=null&&e.getMessage().indexOf("!")!=-1){
                return R.error(e.getMessage());
            }
            return R.error();
        }
        return R.ok();
    }
}
