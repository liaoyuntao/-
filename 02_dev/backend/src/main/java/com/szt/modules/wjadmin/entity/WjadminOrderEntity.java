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
 * 订单管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
@TableName("wjadmin_order")
public class WjadminOrderEntity implements Serializable {
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
         * 订单编号
         */
            @NotBlank(message="订单编号不能为空")
        @ApiModelProperty(value = "订单编号",required = false)
    private String orderNo;
        /**
         * 用户id
         */
            @NotNull(message="用户id不能为空")
        @ApiModelProperty(value = "用户id",required = false)
    private Long userId;
        /**
         * 收货地址
         */
            @NotBlank(message="收货地址不能为空")
        @ApiModelProperty(value = "收货地址",required = false)
    private String address;
        /**
         * 详情地址
         */
        @ApiModelProperty(value = "详情地址",required = true)
    private String detailedAddress;
        /**
         * 订单金额
         */
        @ApiModelProperty(value = "订单金额",required = true)
    private BigDecimal orderMoney;
        /**
         * 优惠卷id
         */
        @ApiModelProperty(value = "优惠卷id",required = true)
    private Long couponId;
        /**
         * 支付方式
         */
            @NotBlank(message="支付方式不能为空")
        @ApiModelProperty(value = "支付方式",required = false)
    private String payType;

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
         * 设置：订单编号
         */
        public void setOrderNo(String orderNo) {
            this.orderNo = orderNo;
        }
        /**
         * 获取：订单编号
         */
        public String getOrderNo() {
            return orderNo;
        }
        /**
         * 设置：用户id
         */
        public void setUserId(Long userId) {
            this.userId = userId;
        }
        /**
         * 获取：用户id
         */
        public Long getUserId() {
            return userId;
        }
        /**
         * 设置：收货地址
         */
        public void setAddress(String address) {
            this.address = address;
        }
        /**
         * 获取：收货地址
         */
        public String getAddress() {
            return address;
        }
        /**
         * 设置：详情地址
         */
        public void setDetailedAddress(String detailedAddress) {
            this.detailedAddress = detailedAddress;
        }
        /**
         * 获取：详情地址
         */
        public String getDetailedAddress() {
            return detailedAddress;
        }
        /**
         * 设置：订单金额
         */
        public void setOrderMoney(BigDecimal orderMoney) {
            this.orderMoney = orderMoney;
        }
        /**
         * 获取：订单金额
         */
        public BigDecimal getOrderMoney() {
            return orderMoney;
        }
        /**
         * 设置：优惠卷id
         */
        public void setCouponId(Long couponId) {
            this.couponId = couponId;
        }
        /**
         * 获取：优惠卷id
         */
        public Long getCouponId() {
            return couponId;
        }
        /**
         * 设置：支付方式
         */
        public void setPayType(String payType) {
            this.payType = payType;
        }
        /**
         * 获取：支付方式
         */
        public String getPayType() {
            return payType;
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
