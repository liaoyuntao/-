package com.szt.modules.wjadmin.entity;
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
    import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;

/**
 * 商品管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
@TableName("wjadmin_goods")
public class WjadminGoodsEntity implements Serializable {
    private static final long serialVersionUID = 1L;

        /**
         * 主键
         */
        @TableId
        @ApiModelProperty(value = "主键",required = false)
    private Long id;
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
            @NotBlank(message="逻辑删除不能为空")
        @ApiModelProperty(value = "逻辑删除@0-存在,1-隐藏,2-删除,3-停用",required = false)
    private String deleteFlag;
        /**
         * 排序
         */
            @NotNull(message="排序不能为空")
        @ApiModelProperty(value = "排序",required = false)
    private Integer sort;
        /**
         * 分类id
         */
            @NotNull(message="分类id不能为空")
        @ApiModelProperty(value = "分类id",required = false)
    private Long goodsCategoryId;
        /**
         * 名称
         */
            @NotBlank(message="名称不能为空")
        @ApiModelProperty(value = "名称",required = false)
    private String name;
        /**
         * 图片
         */
            @NotBlank(message="图片不能为空")
        @ApiModelProperty(value = "图片",required = false)
    private String pic;
        /**
         * 原价
         */
            @NotNull(message="原价不能为空")
        @ApiModelProperty(value = "原价",required = false)
    private BigDecimal originalPrice;
        /**
         * 优惠价
         */
        @ApiModelProperty(value = "优惠价",required = true)
    private BigDecimal preferentialPrice;
        /**
         * 首页推荐@0-是,1-否
         */
            @NotBlank(message="首页推荐不能为空")
        @ApiModelProperty(value = "首页推荐@0-是,1-否",required = false)
    private String isRecommend;

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
        /**
         * 设置：分类id
         */
        public void setGoodsCategoryId(Long goodsCategoryId) {
            this.goodsCategoryId = goodsCategoryId;
        }
        /**
         * 获取：分类id
         */
        public Long getGoodsCategoryId() {
            return goodsCategoryId;
        }
        /**
         * 设置：名称
         */
        public void setName(String name) {
            this.name = name;
        }
        /**
         * 获取：名称
         */
        public String getName() {
            return name;
        }
        /**
         * 设置：图片
         */
        public void setPic(String pic) {
            this.pic = pic;
        }
        /**
         * 获取：图片
         */
        public String getPic() {
            return pic;
        }
        /**
         * 设置：原价
         */
        public void setOriginalPrice(BigDecimal originalPrice) {
            this.originalPrice = originalPrice;
        }
        /**
         * 获取：原价
         */
        public BigDecimal getOriginalPrice() {
            return originalPrice;
        }
        /**
         * 设置：优惠价
         */
        public void setPreferentialPrice(BigDecimal preferentialPrice) {
            this.preferentialPrice = preferentialPrice;
        }
        /**
         * 获取：优惠价
         */
        public BigDecimal getPreferentialPrice() {
            return preferentialPrice;
        }
        /**
         * 设置：首页推荐@0-是,1-否
         */
        public void setIsRecommend(String isRecommend) {
            this.isRecommend = isRecommend;
        }
        /**
         * 获取：首页推荐@0-是,1-否
         */
        public String getIsRecommend() {
            return isRecommend;
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
