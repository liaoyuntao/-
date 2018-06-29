package com.szt.modules.wx.entity;
import com.szt.common.CommonConstant;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.NotBlank;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.apache.shiro.SecurityUtils;
import com.szt.modules.sys.entity.SysUserEntity;
import com.szt.modules.sys.entity.SysCommcomFieldEntity;
import javax.validation.constraints.NotNull;
import org.springframework.stereotype.Controller;
import java.io.Serializable;
import java.util.Date;

/**
 * 微信公众号管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-22 14:49:05
 */
@TableName("wx_user_info")
public class WxUserInfoEntity implements Serializable {
    private static final long serialVersionUID = 1L;

        /**
         * 主键
         */
        @TableId
        @ApiModelProperty(value = "主键",required = false)
    private Long id;
        /**
         * 公众号名称
         */
            @NotBlank(message="公众号名称不能为空")
        @ApiModelProperty(value = "公众号名称",required = false)
    private String name;
        /**
         * appid
         */
            @NotBlank(message="appid不能为空")
        @ApiModelProperty(value = "appid",required = false)
    private String appid;
        /**
         * app密钥
         */
            @NotBlank(message="app密钥不能为空")
        @ApiModelProperty(value = "app密钥",required = false)
    private String appSecret;
        /**
         * 商户id
         */
            @NotBlank(message="商户id不能为空")
        @ApiModelProperty(value = "商户id",required = false)
    private String mchid;
        /**
         * 商户密钥
         */
            @NotBlank(message="商户密钥不能为空")
        @ApiModelProperty(value = "商户密钥",required = false)
    private String partnerKey;
        /**
         * 证书路径
         */
            @NotBlank(message="证书路径不能为空")
        @ApiModelProperty(value = "证书路径",required = false)
    private String certpath;
        /**
         * 申请类型@0-订阅号,1-服务号,2-企业号
         */
            @NotBlank(message="申请类型@0-订阅号,1-服务号,2-企业号不能为空")
        @ApiModelProperty(value = "申请类型@0-订阅号,1-服务号,2-企业号",required = false)
    private String applicationType;
        /**
         * 类型@0-开发平台公众号,1-普通公众号
         */
            @NotBlank(message="类型@0-开发平台公众号,1-普通公众号不能为空")
        @ApiModelProperty(value = "类型@0-开发平台公众号,1-普通公众号",required = false)
    private String type;
        /**
         * 请求密钥
         */
            @NotBlank(message="请求密钥不能为空")
        @ApiModelProperty(value = "请求密钥",required = false)
    private String token;
        /**
         * 备注
         */
        @ApiModelProperty(value = "备注",required = true)
    private String remarks;
        /**
         * 版本号
         */
            @NotNull(message="版本号不能为空")
        @ApiModelProperty(value = "版本号",required = false)
    private Integer versionNo;
        /**
         * 创建人id
         */
        @ApiModelProperty(value = "创建人id",required = true)
    private Long createBy;
        /**
         * 创建时间
         */
            @NotNull(message="创建时间不能为空")
        @ApiModelProperty(value = "创建时间",required = false)
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;
        /**
         * 修改人id
         */
        @ApiModelProperty(value = "修改人id",required = true)
    private Long updateBy;
        /**
         * 修改时间
         */
            @NotNull(message="修改时间不能为空")
        @ApiModelProperty(value = "修改时间",required = false)
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date updateTime;
        /**
         * 逻辑删除@0-存在,1-隐藏,2-删除,3-停用
         */
            @NotBlank(message="逻辑删除@0-存在,1-隐藏,2-删除,3-停用不能为空")
        @ApiModelProperty(value = "逻辑删除@0-存在,1-隐藏,2-删除,3-停用",required = false)
    private String deleteFlag;
        /**
         * 排序
         */
            @NotNull(message="排序不能为空")
        @ApiModelProperty(value = "排序",required = false)
    private Integer sort;

        /**
         * 设置：主键
         */
        public void setId(Long id) {
            this.id = id;
        }
        /**
         * 获取：主键
         */
        public Long getId() {
            return id;
        }
        /**
         * 设置：公众号名称
         */
        public void setName(String name) {
            this.name = name;
        }
        /**
         * 获取：公众号名称
         */
        public String getName() {
            return name;
        }
        /**
         * 设置：appid
         */
        public void setAppid(String appid) {
            this.appid = appid;
        }
        /**
         * 获取：appid
         */
        public String getAppid() {
            return appid;
        }
        /**
         * 设置：app密钥
         */
        public void setAppSecret(String appSecret) {
            this.appSecret = appSecret;
        }
        /**
         * 获取：app密钥
         */
        public String getAppSecret() {
            return appSecret;
        }
        /**
         * 设置：商户id
         */
        public void setMchid(String mchid) {
            this.mchid = mchid;
        }
        /**
         * 获取：商户id
         */
        public String getMchid() {
            return mchid;
        }
        /**
         * 设置：商户密钥
         */
        public void setPartnerKey(String partnerKey) {
            this.partnerKey = partnerKey;
        }
        /**
         * 获取：商户密钥
         */
        public String getPartnerKey() {
            return partnerKey;
        }
        /**
         * 设置：证书路径
         */
        public void setCertpath(String certpath) {
            this.certpath = certpath;
        }
        /**
         * 获取：证书路径
         */
        public String getCertpath() {
            return certpath;
        }
        /**
         * 设置：申请类型@0-订阅号,1-服务号,2-企业号
         */
        public void setApplicationType(String applicationType) {
            this.applicationType = applicationType;
        }
        /**
         * 获取：申请类型@0-订阅号,1-服务号,2-企业号
         */
        public String getApplicationType() {
            return applicationType;
        }
        /**
         * 设置：类型@0-开发平台公众号,1-普通公众号
         */
        public void setType(String type) {
            this.type = type;
        }
        /**
         * 获取：类型@0-开发平台公众号,1-普通公众号
         */
        public String getType() {
            return type;
        }
        /**
         * 设置：请求密钥
         */
        public void setToken(String token) {
            this.token = token;
        }
        /**
         * 获取：请求密钥
         */
        public String getToken() {
            return token;
        }
        /**
         * 设置：备注
         */
        public void setRemarks(String remarks) {
            this.remarks = remarks;
        }
        /**
         * 获取：备注
         */
        public String getRemarks() {
            return remarks;
        }
        /**
         * 设置：版本号
         */
        public void setVersionNo(Integer versionNo) {
            this.versionNo = versionNo;
        }
        /**
         * 获取：版本号
         */
        public Integer getVersionNo() {
            return versionNo;
        }
        /**
         * 设置：创建人id
         */
        public void setCreateBy(Long createBy) {
            this.createBy = createBy;
        }
        /**
         * 获取：创建人id
         */
        public Long getCreateBy() {
            return createBy;
        }
        /**
         * 设置：创建时间
         */
        public void setCreateTime(Date createTime) {
            this.createTime = createTime;
        }
        /**
         * 获取：创建时间
         */
        public Date getCreateTime() {
            return createTime;
        }
        /**
         * 设置：修改人id
         */
        public void setUpdateBy(Long updateBy) {
            this.updateBy = updateBy;
        }
        /**
         * 获取：修改人id
         */
        public Long getUpdateBy() {
            return updateBy;
        }
        /**
         * 设置：修改时间
         */
        public void setUpdateTime(Date updateTime) {
            this.updateTime = updateTime;
        }
        /**
         * 获取：修改时间
         */
        public Date getUpdateTime() {
            return updateTime;
        }
        /**
         * 设置：逻辑删除@0-存在,1-隐藏,2-删除,3-停用
         */
        public void setDeleteFlag(String deleteFlag) {
            this.deleteFlag = deleteFlag;
        }
        /**
         * 获取：逻辑删除@0-存在,1-隐藏,2-删除,3-停用
         */
        public String getDeleteFlag() {
            return deleteFlag;
        }
        /**
         * 设置：排序
         */
        public void setSort(Integer sort) {
            this.sort = sort;
        }
        /**
         * 获取：排序
         */
        public Integer getSort() {
            return sort;
        }

    public void insert(){
        this.createTime = new Date();
        this.updateTime = new Date();
        this.sort = this.sort == null ? 0 : this.sort;
        if(this.deleteFlag == null || this.deleteFlag.length()==0){
            this.deleteFlag = "0";
        }
        this.versionNo=1;
    }
    public void update(){
        this.updateTime = new Date();
    }
}
