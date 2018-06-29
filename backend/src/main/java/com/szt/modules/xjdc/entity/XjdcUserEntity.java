package com.szt.modules.xjdc.entity;
import com.szt.common.CommonConstant;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.szt.modules.generator.config.InitBusConfig;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
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
 * 用户信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:07:56
 */
@TableName("xjdc_user")
public class XjdcUserEntity implements Serializable {
    private static final long serialVersionUID = 1L;

        /**
         * 主键
         */
        @TableId
        @ApiModelProperty(value = "主键",required = false)
    private Long id;
        /**
         * 用户头像
         */
        @ApiModelProperty(value = "用户头像",required = true)
    private String headimgurl;
        /**
         * openid
         */
            @NotBlank(message="openid不能为空")
        @ApiModelProperty(value = "openid",required = false)
    private String openid;
        /**
         * 昵称
         */
            @NotBlank(message="昵称不能为空")
        @ApiModelProperty(value = "昵称",required = false)
    private String nickname;
        /**
         * 性别@0-未知,1-男,2-女
         */
            @NotBlank(message="性别@0-未知,1-男,2-女不能为空")
        @ApiModelProperty(value = "性别@0-未知,1-男,2-女",required = false)
    private String sex;
        /**
         * 所在城市
         */
        @ApiModelProperty(value = "所在城市",required = true)
    private String city;
        /**
         * 所在国家
         */
        @ApiModelProperty(value = "所在国家",required = true)
    private String country;
        /**
         * 所在省份
         */
        @ApiModelProperty(value = "所在省份",required = true)
    private String province;
        /**
         * 语言
         */
        @ApiModelProperty(value = "语言",required = true)
    private String language;
        /**
         * 只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。
         */
        @ApiModelProperty(value = "只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。",required = true)
    private String unionid;
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
         * 设置：用户头像
         */
        public void setHeadimgurl(String headimgurl) {
            this.headimgurl = headimgurl;
        }
        /**
         * 获取：用户头像
         */
        public String getHeadimgurl() {
            return headimgurl;
        }
        /**
         * 设置：openid
         */
        public void setOpenid(String openid) {
            this.openid = openid;
        }
        /**
         * 获取：openid
         */
        public String getOpenid() {
            return openid;
        }
        /**
         * 设置：昵称
         */
        public void setNickname(String nickname) {
            this.nickname = nickname;
        }
        /**
         * 获取：昵称
         */
        public String getNickname() {
            return nickname;
        }
        /**
         * 设置：性别@0-未知,1-男,2-女
         */
        public void setSex(String sex) {
            this.sex = sex;
        }
        /**
         * 获取：性别@0-未知,1-男,2-女
         */
        public String getSex() {
            return sex;
        }
        /**
         * 设置：所在城市
         */
        public void setCity(String city) {
            this.city = city;
        }
        /**
         * 获取：所在城市
         */
        public String getCity() {
            return city;
        }
        /**
         * 设置：所在国家
         */
        public void setCountry(String country) {
            this.country = country;
        }
        /**
         * 获取：所在国家
         */
        public String getCountry() {
            return country;
        }
        /**
         * 设置：所在省份
         */
        public void setProvince(String province) {
            this.province = province;
        }
        /**
         * 获取：所在省份
         */
        public String getProvince() {
            return province;
        }
        /**
         * 设置：语言
         */
        public void setLanguage(String language) {
            this.language = language;
        }
        /**
         * 获取：语言
         */
        public String getLanguage() {
            return language;
        }
        /**
         * 设置：只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。
         */
        public void setUnionid(String unionid) {
            this.unionid = unionid;
        }
        /**
         * 获取：只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。
         */
        public String getUnionid() {
            return unionid;
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
    public void setWxuser(WxMpUser user){
        this.setHeadimgurl(user.getHeadImgUrl());
        this.setOpenid(user.getOpenId());
        this.setNickname(user.getNickname());
        //性别@0-未知,1-男,2-女
        if(user.getSex().equals("未知")){
            this.setSex("0");
        }else if(user.getSex().equals("男")){
            this.setSex("1");
        }else{
            this.setSex("2");
        }

        this.setCity(user.getCity());
        this.setCountry(user.getCountry());
        this.setProvince(user.getProvince());
        this.setLanguage(user.getLanguage());
        this.setUnionid(user.getUnionId());
    }
}
