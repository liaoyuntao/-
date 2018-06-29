package com.szt.modules.xjdc.entity;
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
 * 房源信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:07:56
 */
@TableName("xjdc_housing_resources")
public class XjdcHousingResourcesEntity implements Serializable {
    private static final long serialVersionUID = 1L;

        /**
         * 主键
         */
        @TableId
        @ApiModelProperty(value = "主键",required = false)
    private Long id;
        /**
         * openid
         */
            @NotBlank(message="openid不能为空")
        @ApiModelProperty(value = "openid",required = false)
    private String openid;
        /**
         * 联系人
         */
            @NotBlank(message="联系人不能为空")
        @ApiModelProperty(value = "联系人",required = false)
    private String name;
        /**
         * 联系电话
         */
            @NotBlank(message="联系电话不能为空")
        @ApiModelProperty(value = "联系电话",required = false)
    private String phone;
        /**
         * 区域
         */
        @ApiModelProperty(value = "区域",required = true)
    private String region;
        /**
         * 价格
         */
        @ApiModelProperty(value = "价格",required = true)
    private BigDecimal price;
        /**
         * 户型@1-一室一厅,2-二室一厅,3-三房两厅,4-其他
         */
        @ApiModelProperty(value = "户型@1-一室一厅,2-二室一厅,3-三房两厅,4-其他",required = true)
    private String houseType;
        /**
         * 平方数
         */
        @ApiModelProperty(value = "平方数",required = true)
    private Float square;
        /**
         * 类型@1-住宅,2-公寓,3-别墅,4-商铺,5-车位,6-写字楼,7-其他
         */
        @ApiModelProperty(value = "类型@1-住宅,2-公寓,3-别墅,4-商铺,5-车位,6-写字楼,7-其他",required = true)
    private String type;
        /**
         * 楼龄
         */
        @ApiModelProperty(value = "楼龄",required = true)
    private Integer buildingAge;
        /**
         * 楼层
         */
        @ApiModelProperty(value = "楼层",required = true)
    private Integer floor;
        /**
         * 装修@1-毛胚,2-普装,3-精装,4-豪装
         */
            @NotBlank(message="装修@1-毛胚,2-普装,3-精装,4-豪装不能为空")
        @ApiModelProperty(value = "装修@1-毛胚,2-普装,3-精装,4-豪装",required = false)
    private String decoration;
        /**
         * 房源标签
         */
        @ApiModelProperty(value = "房源标签",required = true)
    private String labelTag;
        /**
         * 房源图片
         */
        @ApiModelProperty(value = "房源图片",required = true)
    private String imagePath;
        /**
         * 房源描述
         */
        @ApiModelProperty(value = "房源描述",required = true)
    private String describeInfo;
        /**
         * 模块@1-二手房出售,2-租房
         */
            @NotNull(message="模块@1-二手房出售,2-租房不能为空")
        @ApiModelProperty(value = "模块@1-二手房出售,2-租房",required = false)
    private Integer module;
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
         * 设置：联系人
         */
        public void setName(String name) {
            this.name = name;
        }
        /**
         * 获取：联系人
         */
        public String getName() {
            return name;
        }
        /**
         * 设置：联系电话
         */
        public void setPhone(String phone) {
            this.phone = phone;
        }
        /**
         * 获取：联系电话
         */
        public String getPhone() {
            return phone;
        }
        /**
         * 设置：区域
         */
        public void setRegion(String region) {
            this.region = region;
        }
        /**
         * 获取：区域
         */
        public String getRegion() {
            return region;
        }
        /**
         * 设置：价格
         */
        public void setPrice(BigDecimal price) {
            this.price = price;
        }
        /**
         * 获取：价格
         */
        public BigDecimal getPrice() {
            return price;
        }
        /**
         * 设置：户型@1-一室一厅,2-二室一厅,3-三房两厅,4-其他
         */
        public void setHouseType(String houseType) {
            this.houseType = houseType;
        }
        /**
         * 获取：户型@1-一室一厅,2-二室一厅,3-三房两厅,4-其他
         */
        public String getHouseType() {
            return houseType;
        }
        /**
         * 设置：平方数
         */
        public void setSquare(Float square) {
            this.square = square;
        }
        /**
         * 获取：平方数
         */
        public Float getSquare() {
            return square;
        }
        /**
         * 设置：类型@1-住宅,2-公寓,3-别墅,4-商铺,5-车位,6-写字楼,7-其他
         */
        public void setType(String type) {
            this.type = type;
        }
        /**
         * 获取：类型@1-住宅,2-公寓,3-别墅,4-商铺,5-车位,6-写字楼,7-其他
         */
        public String getType() {
            return type;
        }
        /**
         * 设置：楼龄
         */
        public void setBuildingAge(Integer buildingAge) {
            this.buildingAge = buildingAge;
        }
        /**
         * 获取：楼龄
         */
        public Integer getBuildingAge() {
            return buildingAge;
        }
        /**
         * 设置：楼层
         */
        public void setFloor(Integer floor) {
            this.floor = floor;
        }
        /**
         * 获取：楼层
         */
        public Integer getFloor() {
            return floor;
        }
        /**
         * 设置：装修@1-毛胚,2-普装,3-精装,4-豪装
         */
        public void setDecoration(String decoration) {
            this.decoration = decoration;
        }
        /**
         * 获取：装修@1-毛胚,2-普装,3-精装,4-豪装
         */
        public String getDecoration() {
            return decoration;
        }
        /**
         * 设置：房源标签
         */
        public void setLabelTag(String labelTag) {
            this.labelTag = labelTag;
        }
        /**
         * 获取：房源标签
         */
        public String getLabelTag() {
            return labelTag;
        }
        /**
         * 设置：房源图片
         */
        public void setImagePath(String imagePath) {
            this.imagePath = imagePath;
        }
        /**
         * 获取：房源图片
         */
        public String getImagePath() {
            return imagePath;
        }
        /**
         * 设置：房源描述
         */
        public void setDescribeInfo(String describeInfo) {
            this.describeInfo = describeInfo;
        }
        /**
         * 获取：房源描述
         */
        public String getDescribeInfo() {
            return describeInfo;
        }
        /**
         * 设置：模块@1-二手房出售,2-租房
         */
        public void setModule(Integer module) {
            this.module = module;
        }
        /**
         * 获取：模块@1-二手房出售,2-租房
         */
        public Integer getModule() {
            return module;
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
